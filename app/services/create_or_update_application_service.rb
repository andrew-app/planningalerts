# typed: true
# frozen_string_literal: true

class CreateOrUpdateApplicationService < ApplicationService
  def initialize(
    authority:, council_reference:, attributes:
  )
    @authority = authority
    @council_reference = council_reference
    @attributes = attributes.stringify_keys
    # TODO: Do some sanity checking on the keys in attributes
    # TODO: Make sure that authority_id and council_reference are not
    # keys in attributes
  end

  # Returns created or updated application
  def call
    Application.transaction do
      # First check if record already exists or create a new one if it doesn't
      application = Application.find_or_create_by!(
        authority: authority, council_reference: council_reference
      )
      create_version(application)
      application
    end
  end

  private

  attr_reader :authority, :council_reference, :attributes

  def create_version(application)
    previous_version = application.current_version
    new_version = ApplicationVersion.build_version(
      application_id: application.id,
      previous_version: previous_version,
      attributes: attributes
    )

    # If none of the data has changed don't save the new version
    # Comparing attributes on model so that typecasting has been done
    return if previous_version && new_version.data_attributes.except("date_scraped") == previous_version.data_attributes.except("date_scraped")

    previous_version&.update(current: false)
    new_version.save!
    application.versions.reload
    application.reload_current_version
  end
end
