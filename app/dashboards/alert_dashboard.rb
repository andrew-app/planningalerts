# typed: strict
# frozen_string_literal: true

require "administrate/base_dashboard"

class AlertDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = T.let({
    id: Field::Number,
    email: Field::String,
    address: Field::String,
    last_sent: Field::DateTime,
    lat: Field::Number.with_options(decimals: 2),
    lng: Field::Number.with_options(decimals: 2),
    confirm_id: Field::String,
    confirmed: YesNoBooleanField,
    radius_meters: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    unsubscribed: YesNoBooleanField,
    last_processed: Field::DateTime,
    unsubscribed_at: Field::DateTime,
    last_delivered_at: Field::DateTime,
    last_delivered_successfully: YesNoBooleanField,
    unsubscribed_by: Field::String
  }.freeze, T::Hash[Symbol, T.untyped])

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = T.let(%i[
    email
    address
    confirmed
    unsubscribed
  ].freeze, T::Array[Symbol])

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = T.let(%i[
    id
    email
    address
    last_sent
    lat
    lng
    confirm_id
    confirmed
    radius_meters
    created_at
    updated_at
    unsubscribed
    last_processed
    unsubscribed_at
    last_delivered_at
    last_delivered_successfully
    unsubscribed_by
  ].freeze, T::Array[Symbol])

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = T.let(%i[
    email
    address
    last_sent
    lat
    lng
    confirm_id
    confirmed
    radius_meters
    unsubscribed
    last_processed
    unsubscribed_at
    last_delivered_at
    last_delivered_successfully
    unsubscribed_by
  ].freeze, T::Array[Symbol])

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = T.let({
    active: ->(resources) { resources.active }
  }.freeze, T::Hash[Symbol, T.untyped])

  # Overwrite this method to customize how alerts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(alert)
  #   "Alert ##{alert.id}"
  # end
end
