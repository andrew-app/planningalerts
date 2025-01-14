# typed: strict
# frozen_string_literal: true

class ApiController < ApplicationController
  extend T::Sig

  before_action :check_api_parameters, except: %i[howto]
  before_action :require_api_key, except: %i[howto]
  before_action :authenticate_bulk_api, only: %i[all date_scraped]

  # This is disabled because at least one commercial user of the API is doing
  # GET requests for JSONP instead of using XHR
  # TODO: Remove this line to re-enable CSRF protection on API actions
  skip_before_action :verify_authenticity_token,
                     only: %i[authority suburb_postcode point area date_scraped all]

  sig { void }
  def authority
    # TODO: Handle the situation where the authority name isn't found
    authority = Authority.find_short_name_encoded!(params[:authority_id])
    apps = authority.applications.with_current_version.order("date_scraped DESC")
    api_render(apps, "Recent applications from #{authority.full_name_and_state}")
  end

  sig { void }
  def suburb_postcode
    apps = Application.with_current_version.order("date_scraped DESC")
    descriptions = []
    if params[:suburb]
      descriptions << params[:suburb]
      apps = apps.where(application_versions: { suburb: params[:suburb] })
    end
    if params[:state]
      descriptions << params[:state]
      apps = apps.where(application_versions: { state: params[:state] })
    end
    # TODO: Check that it's a valid postcode (i.e. numerical and four digits)
    if params[:postcode]
      descriptions << params[:postcode]
      apps = apps.where(application_versions: { postcode: params[:postcode] })
    end
    api_render(apps, "Recent applications in #{descriptions.join(', ')}")
  end

  sig { void }
  def point
    radius = if params[:radius]
               params[:radius].to_f
             elsif params[:area_size]
               params[:area_size].to_f
             else
               2000.0
             end
    location = Location.new(lat: params[:lat].to_f, lng: params[:lng].to_f)
    location_text = location.to_s
    api_render(
      Application.with_current_version.order("date_scraped DESC").near(
        [location.lat, location.lng], radius / 1000,
        units: :km,
        latitude: "application_versions.lat",
        longitude: "application_versions.lng"
      ),
      "Recent applications within #{help.meters_in_words(radius)} of #{location_text}"
    )
  end

  sig { void }
  def area
    lat0 = params[:bottom_left_lat]
    lng0 = params[:bottom_left_lng]
    lat1 = params[:top_right_lat]
    lng1 = params[:top_right_lng]
    api_render(
      Application.with_current_version.order("date_scraped DESC").where("lat > ? AND lng > ? AND lat < ? AND lng < ?", lat0, lng0, lat1, lng1),
      "Recent applications in the area (#{lat0},#{lng0}) (#{lat1},#{lng1})"
    )
  end

  sig { void }
  def date_scraped
    begin
      date = Date.parse(params[:date_scraped])
    rescue ArgumentError => e
      raise e unless e.message == "invalid date"
    end

    if date
      api_render(Application.with_current_version.order("date_scraped DESC").where("application_versions.date_scraped" => date.beginning_of_day...date.end_of_day), "All applications collected on #{date}")
    else
      render_error("invalid date_scraped", :bad_request)
    end
  end

  # Note that this returns results in a slightly different format than the
  # other API calls because the paging is done differently (via scrape time rather than page number)
  sig { void }
  def all
    # TODO: Check that params page and v aren't being used
    LogApiCallJob.perform_later(
      api_key: request.query_parameters["key"],
      ip_address: request.remote_ip,
      query: request.fullpath,
      params: params_for_logging,
      user_agent: request.headers["User-Agent"],
      time_as_float: Time.zone.now.to_f
    )
    apps = Application.with_current_version.order("applications.id")
    apps = apps.where("applications.id > ?", params[:since_id]) if params[:since_id]

    # Max number of records that we'll show
    limit = 1000

    applications = apps.limit(limit).to_a
    last = applications.last
    last = Application.with_current_version.order("applications.id").last if last.nil?
    max_id = last.id if last

    respond_to do |format|
      format.json do
        @applications = applications
        @max_id = T.let(max_id, T.nilable(Integer))
        render "all", formats: :json
      end
      # Use of the js extension is deprecated. See
      # https://github.com/openaustralia/planningalerts/issues/679
      # TODO: Remove when it's no longer used
      format.js do
        @applications = applications
        @max_id = T.let(max_id, T.nilable(Integer))
        render "all", formats: :json, content_type: Mime[:json]
      end
      # Doesn't make sense (I think) to support georss and geojson here
    end
  end

  sig { void }
  def howto; end

  private

  sig { void }
  def check_api_parameters
    valid_parameter_keys = %w[
      format action controller
      authority_id
      page
      postcode
      suburb state
      lat lng radius area_size
      bottom_left_lat bottom_left_lng top_right_lat top_right_lng
      count v key since_id date_scraped
    ]

    # Parameter error checking (only do it on the API calls)
    invalid_parameter_keys = params.keys - valid_parameter_keys
    return if invalid_parameter_keys.empty?

    render_error(
      "Bad request: Invalid parameter(s) used: #{invalid_parameter_keys.sort.join(', ')}",
      :bad_request
    )
  end

  sig { void }
  def require_api_key
    if params[:key] && ApiKey.exists?(value: params[:key], disabled: false)
      # Everything is fine
      return
    end

    render_error(
      "not authorised - use a valid api key - https://www.openaustraliafoundation.org.au/2015/03/02/planningalerts-api-changes",
      :unauthorized
    )
  end

  sig { params(error_text: String, status: Symbol).void }
  def render_error(error_text, status)
    respond_to do |format|
      format.json do
        render json: { error: error_text }, status: status
      end
      # Use of the js extension is deprecated. See
      # https://github.com/openaustralia/planningalerts/issues/679
      # TODO: Remove when it's no longer used
      format.js do
        render json: { error: error_text }, status: status, content_type: Mime[:json]
      end
      format.geojson do
        render json: { error: error_text }, status: status
      end
      format.rss do
        render plain: error_text, status: status
      end
    end
  end

  sig { void }
  def authenticate_bulk_api
    return if ApiKey.exists?(value: params[:key], bulk: true)

    render_error("no bulk api access", :unauthorized)
  end

  sig { returns(Integer) }
  def per_page
    # Allow to set number of returned applications up to a maximum
    count = params[:count]&.to_i
    if count && count <= Application.max_per_page
      count
    else
      Application.max_per_page
    end
  end

  sig { params(apps: T.untyped, description: String).void }
  def api_render(apps, description)
    # typed_params = TypedParams[ApiRenderParams].new.extract!(params)
    applications = apps.includes(:authority).page(params[:page]).per(per_page)
    @applications = T.let(applications, T.untyped)
    @description = T.let(description, T.nilable(String))

    LogApiCallJob.perform_later(
      api_key: request.query_parameters["key"],
      ip_address: request.remote_ip,
      query: request.fullpath,
      params: params_for_logging,
      user_agent: request.headers["User-Agent"],
      time_as_float: Time.zone.now.to_f
    )
    # In Rails 6.0 variants seem to not be able to be a string
    variants = :v2 if params[:v] == "2"

    respond_to do |format|
      # TODO: Move the template over to using an xml builder
      format.rss do
        render "index", format: :rss,
                        layout: false,
                        content_type: Mime[:xml]
      end
      format.json do
        # TODO: Document use of v parameter
        render "index", formats: :json,
                        variants: variants
      end
      # Use of the js extension is deprecated. See
      # https://github.com/openaustralia/planningalerts/issues/679
      # TODO: Remove when it's no longer used
      format.js do
        # TODO: Document use of v parameter
        render "index", formats: :json,
                        content_type: Mime[:json],
                        variants: variants
      end
      format.geojson do
        render "index"
      end
    end
  end

  sig { returns(ApiController::Helper) }
  def help
    Helper.instance
  end

  class Helper
    include Singleton
    include ApplicationHelper
    include ActionView::Helpers::TextHelper
  end

  sig { returns(T.untyped) }
  def params_for_logging
    permitted_params.merge(
      controller: params[:controller],
      action: params[:action],
      format: params[:format]
    )
  end

  sig { returns(T.untyped) }
  def permitted_params
    params.permit(
      :authority_id, :suburb, :state, :postcode, :radius, :area_size,
      :lat, :lng, :bottom_left_lat, :bottom_left_lng, :top_right_lat,
      :top_right_lng, :date_scraped, :since_id, :key, :count, :page, :v
    )
  end
end
