# typed: false
# frozen_string_literal: true

require "open-uri"

ActiveAdmin.register Authority do
  actions :all, except: [:destroy]

  scope :active, default: true
  scope(:disabled) { |a| a.where(disabled: true) }
  scope :all

  index do
    column "Name", :full_name
    column :state
    column :email
    column(:applications) { |a| a.applications.count }
    column(:total_comments) { |a| a.comments.count }
    column(:comments_to_councillors) { |a| a.comments.to_councillor.count }
    column(:comments_with_replies) { |a| a.comments.joins(:replies).distinct.count }
    column :write_to_councillors_enabled
    column(:number_of_councillors) { |a| a.councillors.count }
    actions
  end

  show title: :full_name do |a|
    attributes_table do
      row :full_name
      row :short_name
      row :state
      row :email
      row :website_url
      row :write_to_councillors_enabled
      row :population_2017
      row :morph_name
      row :scraper_authority_label
      row :disabled
    end

    h3 "Councillors"
    if a.councillors.present?
      table_for resource.councillors.order(current: :desc), class: "index_table" do
        column :name
        column :current
        column :email
        column :party
        column(:image) { |c| link_to(image_tag(c.image_url), c.image_url) if c.image_url.present? }
        # TODO: Add delete action
        column do |c|
          safe_join(
            [
              link_to("View", admin_councillor_path(c)),
              link_to("Edit", edit_admin_councillor_path(c))
            ],
            " "
          )
        end
      end
    else
      para "None loaded for this authority."
    end

    h3 "Last import run log"
    div do
      simple_format a.last_scraper_run_log
    end
  end

  filter :full_name

  form do |f|
    inputs "Name" do
      input :full_name
      input :short_name, input_html: { disabled: !f.object.new_record? },
                         hint: "Used to generate the authority URL and so shouldn't change once created"
    end
    inputs "Details" do
      input :state
      input :email
      input :website_url
      input :population_2017
      input :write_to_councillors_enabled
    end
    inputs "Scraping" do
      input :morph_name, hint: "The name of the scraper at morph.io", placeholder: "planningalerts-scrapers/scraper-blue-mountains"
      input :scraper_authority_label, hint: "If the scraper above supports multiple authorities enter the authority_label used"
      input :disabled
    end
    actions
  end

  action_item :scrape, only: :show do
    button_to("Import applications", import_admin_authority_path)
  end

  member_action :import, method: :post do
    authority = Authority.find(params[:id])
    ImportApplicationsJob.perform_later(authority: authority)
    redirect_to({ action: :show }, notice: "Queued for importing!")
  end

  action_item :load_councillors, only: :show do
    button_to("Load Councillors", load_councillors_admin_authority_path)
  end

  member_action :load_councillors, method: :post do
    popolo = EveryPolitician::Popolo.parse(RestClient.get(resource.popolo_url).body)
    results = resource.load_councillors(popolo)
    notice = render_to_string(partial: "load_councillors_message", locals: { councillors: results })

    redirect_to({ action: :show }, notice: notice)
  end

  csv do
    column :full_name
    column :short_name
    column :disabled
    column :write_to_councillors_enabled
    column :state
    column :email
    column :population_2017
    column :morph_name
    column(:number_of_applications) { |a| a.applications.count }
    column(:number_of_comments) { |a| a.comments.count }
  end

  permit_params :full_name, :short_name, :state, :email, :website_url, :write_to_councillors_enabled, :population_2017, :morph_name, :scraper_authority_label, :disabled
end
