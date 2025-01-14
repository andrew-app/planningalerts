# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Alert`.
# Please instead update this file by running `bin/tapioca dsl Alert`.

# typed: true

class Alert
  include GeneratedAttributeMethods
  extend GeneratedRelationMethods

  module GeneratedAttributeMethods
    sig { returns(::String) }
    def address; end

    sig { params(value: ::String).returns(::String) }
    def address=(value); end

    sig { returns(T::Boolean) }
    def address?; end

    sig { returns(T.nilable(::String)) }
    def address_before_last_save; end

    sig { returns(T.untyped) }
    def address_before_type_cast; end

    sig { returns(T::Boolean) }
    def address_came_from_user?; end

    sig { returns(T.nilable([::String, ::String])) }
    def address_change; end

    sig { returns(T.nilable([::String, ::String])) }
    def address_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def address_changed?; end

    sig { returns(T.nilable(::String)) }
    def address_in_database; end

    sig { returns(T.nilable([::String, ::String])) }
    def address_previous_change; end

    sig { returns(T::Boolean) }
    def address_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def address_previously_was; end

    sig { returns(T.nilable(::String)) }
    def address_was; end

    sig { void }
    def address_will_change!; end

    sig { returns(T.nilable(::String)) }
    def confirm_id; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def confirm_id=(value); end

    sig { returns(T::Boolean) }
    def confirm_id?; end

    sig { returns(T.nilable(::String)) }
    def confirm_id_before_last_save; end

    sig { returns(T.untyped) }
    def confirm_id_before_type_cast; end

    sig { returns(T::Boolean) }
    def confirm_id_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def confirm_id_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def confirm_id_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def confirm_id_changed?; end

    sig { returns(T.nilable(::String)) }
    def confirm_id_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def confirm_id_previous_change; end

    sig { returns(T::Boolean) }
    def confirm_id_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def confirm_id_previously_was; end

    sig { returns(T.nilable(::String)) }
    def confirm_id_was; end

    sig { void }
    def confirm_id_will_change!; end

    sig { returns(T::Boolean) }
    def confirmed; end

    sig { params(value: T::Boolean).returns(T::Boolean) }
    def confirmed=(value); end

    sig { returns(T::Boolean) }
    def confirmed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def confirmed_before_last_save; end

    sig { returns(T.untyped) }
    def confirmed_before_type_cast; end

    sig { returns(T::Boolean) }
    def confirmed_came_from_user?; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def confirmed_change; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def confirmed_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def confirmed_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def confirmed_in_database; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def confirmed_previous_change; end

    sig { returns(T::Boolean) }
    def confirmed_previously_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def confirmed_previously_was; end

    sig { returns(T.nilable(T::Boolean)) }
    def confirmed_was; end

    sig { void }
    def confirmed_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at=(value); end

    sig { returns(T::Boolean) }
    def created_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_before_last_save; end

    sig { returns(T.untyped) }
    def created_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def created_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def created_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_previous_change; end

    sig { returns(T::Boolean) }
    def created_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_was; end

    sig { void }
    def created_at_will_change!; end

    sig { returns(::String) }
    def email; end

    sig { params(value: ::String).returns(::String) }
    def email=(value); end

    sig { returns(T::Boolean) }
    def email?; end

    sig { returns(T.nilable(::String)) }
    def email_before_last_save; end

    sig { returns(T.untyped) }
    def email_before_type_cast; end

    sig { returns(T::Boolean) }
    def email_came_from_user?; end

    sig { returns(T.nilable([::String, ::String])) }
    def email_change; end

    sig { returns(T.nilable([::String, ::String])) }
    def email_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def email_changed?; end

    sig { returns(T.nilable(::String)) }
    def email_in_database; end

    sig { returns(T.nilable([::String, ::String])) }
    def email_previous_change; end

    sig { returns(T::Boolean) }
    def email_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def email_previously_was; end

    sig { returns(T.nilable(::String)) }
    def email_was; end

    sig { void }
    def email_will_change!; end

    sig { returns(T.nilable(::Integer)) }
    def id; end

    sig { params(value: ::Integer).returns(::Integer) }
    def id=(value); end

    sig { returns(T::Boolean) }
    def id?; end

    sig { returns(T.nilable(::Integer)) }
    def id_before_last_save; end

    sig { returns(T.untyped) }
    def id_before_type_cast; end

    sig { returns(T::Boolean) }
    def id_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_change; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def id_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def id_in_database; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_previous_change; end

    sig { returns(T::Boolean) }
    def id_previously_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def id_previously_was; end

    sig { returns(T.nilable(::Integer)) }
    def id_was; end

    sig { void }
    def id_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at=(value); end

    sig { returns(T::Boolean) }
    def last_delivered_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at_before_last_save; end

    sig { returns(T.untyped) }
    def last_delivered_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def last_delivered_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_delivered_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_delivered_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def last_delivered_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_delivered_at_previous_change; end

    sig { returns(T::Boolean) }
    def last_delivered_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_delivered_at_was; end

    sig { void }
    def last_delivered_at_will_change!; end

    sig { returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully; end

    sig { params(value: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully=(value); end

    sig { returns(T::Boolean) }
    def last_delivered_successfully?; end

    sig { returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully_before_last_save; end

    sig { returns(T.untyped) }
    def last_delivered_successfully_before_type_cast; end

    sig { returns(T::Boolean) }
    def last_delivered_successfully_came_from_user?; end

    sig { returns(T.nilable([T.nilable(T::Boolean), T.nilable(T::Boolean)])) }
    def last_delivered_successfully_change; end

    sig { returns(T.nilable([T.nilable(T::Boolean), T.nilable(T::Boolean)])) }
    def last_delivered_successfully_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def last_delivered_successfully_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully_in_database; end

    sig { returns(T.nilable([T.nilable(T::Boolean), T.nilable(T::Boolean)])) }
    def last_delivered_successfully_previous_change; end

    sig { returns(T::Boolean) }
    def last_delivered_successfully_previously_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully_previously_was; end

    sig { returns(T.nilable(T::Boolean)) }
    def last_delivered_successfully_was; end

    sig { void }
    def last_delivered_successfully_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed=(value); end

    sig { returns(T::Boolean) }
    def last_processed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed_before_last_save; end

    sig { returns(T.untyped) }
    def last_processed_before_type_cast; end

    sig { returns(T::Boolean) }
    def last_processed_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_processed_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_processed_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def last_processed_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_processed_previous_change; end

    sig { returns(T::Boolean) }
    def last_processed_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_processed_was; end

    sig { void }
    def last_processed_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent=(value); end

    sig { returns(T::Boolean) }
    def last_sent?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent_before_last_save; end

    sig { returns(T.untyped) }
    def last_sent_before_type_cast; end

    sig { returns(T::Boolean) }
    def last_sent_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_sent_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_sent_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def last_sent_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def last_sent_previous_change; end

    sig { returns(T::Boolean) }
    def last_sent_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def last_sent_was; end

    sig { void }
    def last_sent_will_change!; end

    sig { returns(::Float) }
    def lat; end

    sig { params(value: ::Float).returns(::Float) }
    def lat=(value); end

    sig { returns(T::Boolean) }
    def lat?; end

    sig { returns(T.nilable(::Float)) }
    def lat_before_last_save; end

    sig { returns(T.untyped) }
    def lat_before_type_cast; end

    sig { returns(T::Boolean) }
    def lat_came_from_user?; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lat_change; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lat_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def lat_changed?; end

    sig { returns(T.nilable(::Float)) }
    def lat_in_database; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lat_previous_change; end

    sig { returns(T::Boolean) }
    def lat_previously_changed?; end

    sig { returns(T.nilable(::Float)) }
    def lat_previously_was; end

    sig { returns(T.nilable(::Float)) }
    def lat_was; end

    sig { void }
    def lat_will_change!; end

    sig { returns(::Float) }
    def lng; end

    sig { params(value: ::Float).returns(::Float) }
    def lng=(value); end

    sig { returns(T::Boolean) }
    def lng?; end

    sig { returns(T.nilable(::Float)) }
    def lng_before_last_save; end

    sig { returns(T.untyped) }
    def lng_before_type_cast; end

    sig { returns(T::Boolean) }
    def lng_came_from_user?; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lng_change; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lng_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def lng_changed?; end

    sig { returns(T.nilable(::Float)) }
    def lng_in_database; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def lng_previous_change; end

    sig { returns(T::Boolean) }
    def lng_previously_changed?; end

    sig { returns(T.nilable(::Float)) }
    def lng_previously_was; end

    sig { returns(T.nilable(::Float)) }
    def lng_was; end

    sig { void }
    def lng_will_change!; end

    sig { returns(::Integer) }
    def radius_meters; end

    sig { params(value: ::Integer).returns(::Integer) }
    def radius_meters=(value); end

    sig { returns(T::Boolean) }
    def radius_meters?; end

    sig { returns(T.nilable(::Integer)) }
    def radius_meters_before_last_save; end

    sig { returns(T.untyped) }
    def radius_meters_before_type_cast; end

    sig { returns(T::Boolean) }
    def radius_meters_came_from_user?; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def radius_meters_change; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def radius_meters_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def radius_meters_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def radius_meters_in_database; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def radius_meters_previous_change; end

    sig { returns(T::Boolean) }
    def radius_meters_previously_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def radius_meters_previously_was; end

    sig { returns(T.nilable(::Integer)) }
    def radius_meters_was; end

    sig { void }
    def radius_meters_will_change!; end

    sig { void }
    def restore_address!; end

    sig { void }
    def restore_confirm_id!; end

    sig { void }
    def restore_confirmed!; end

    sig { void }
    def restore_created_at!; end

    sig { void }
    def restore_email!; end

    sig { void }
    def restore_id!; end

    sig { void }
    def restore_last_delivered_at!; end

    sig { void }
    def restore_last_delivered_successfully!; end

    sig { void }
    def restore_last_processed!; end

    sig { void }
    def restore_last_sent!; end

    sig { void }
    def restore_lat!; end

    sig { void }
    def restore_lng!; end

    sig { void }
    def restore_radius_meters!; end

    sig { void }
    def restore_unsubscribed!; end

    sig { void }
    def restore_unsubscribed_at!; end

    sig { void }
    def restore_unsubscribed_by!; end

    sig { void }
    def restore_updated_at!; end

    sig { returns(T.nilable([::String, ::String])) }
    def saved_change_to_address; end

    sig { returns(T::Boolean) }
    def saved_change_to_address?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_confirm_id; end

    sig { returns(T::Boolean) }
    def saved_change_to_confirm_id?; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def saved_change_to_confirmed; end

    sig { returns(T::Boolean) }
    def saved_change_to_confirmed?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_created_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_created_at?; end

    sig { returns(T.nilable([::String, ::String])) }
    def saved_change_to_email; end

    sig { returns(T::Boolean) }
    def saved_change_to_email?; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def saved_change_to_id; end

    sig { returns(T::Boolean) }
    def saved_change_to_id?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_last_delivered_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_last_delivered_at?; end

    sig { returns(T.nilable([T.nilable(T::Boolean), T.nilable(T::Boolean)])) }
    def saved_change_to_last_delivered_successfully; end

    sig { returns(T::Boolean) }
    def saved_change_to_last_delivered_successfully?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_last_processed; end

    sig { returns(T::Boolean) }
    def saved_change_to_last_processed?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_last_sent; end

    sig { returns(T::Boolean) }
    def saved_change_to_last_sent?; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def saved_change_to_lat; end

    sig { returns(T::Boolean) }
    def saved_change_to_lat?; end

    sig { returns(T.nilable([::Float, ::Float])) }
    def saved_change_to_lng; end

    sig { returns(T::Boolean) }
    def saved_change_to_lng?; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def saved_change_to_radius_meters; end

    sig { returns(T::Boolean) }
    def saved_change_to_radius_meters?; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def saved_change_to_unsubscribed; end

    sig { returns(T::Boolean) }
    def saved_change_to_unsubscribed?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_unsubscribed_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_unsubscribed_at?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_unsubscribed_by; end

    sig { returns(T::Boolean) }
    def saved_change_to_unsubscribed_by?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_updated_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_updated_at?; end

    sig { returns(T::Boolean) }
    def unsubscribed; end

    sig { params(value: T::Boolean).returns(T::Boolean) }
    def unsubscribed=(value); end

    sig { returns(T::Boolean) }
    def unsubscribed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at=(value); end

    sig { returns(T::Boolean) }
    def unsubscribed_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at_before_last_save; end

    sig { returns(T.untyped) }
    def unsubscribed_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def unsubscribed_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def unsubscribed_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def unsubscribed_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def unsubscribed_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def unsubscribed_at_previous_change; end

    sig { returns(T::Boolean) }
    def unsubscribed_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def unsubscribed_at_was; end

    sig { void }
    def unsubscribed_at_will_change!; end

    sig { returns(T.nilable(T::Boolean)) }
    def unsubscribed_before_last_save; end

    sig { returns(T.untyped) }
    def unsubscribed_before_type_cast; end

    sig { returns(T.nilable(::String)) }
    def unsubscribed_by; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def unsubscribed_by=(value); end

    sig { returns(T::Boolean) }
    def unsubscribed_by?; end

    sig { returns(T.nilable(::String)) }
    def unsubscribed_by_before_last_save; end

    sig { returns(T.untyped) }
    def unsubscribed_by_before_type_cast; end

    sig { returns(T::Boolean) }
    def unsubscribed_by_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def unsubscribed_by_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def unsubscribed_by_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def unsubscribed_by_changed?; end

    sig { returns(T.nilable(::String)) }
    def unsubscribed_by_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def unsubscribed_by_previous_change; end

    sig { returns(T::Boolean) }
    def unsubscribed_by_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def unsubscribed_by_previously_was; end

    sig { returns(T.nilable(::String)) }
    def unsubscribed_by_was; end

    sig { void }
    def unsubscribed_by_will_change!; end

    sig { returns(T::Boolean) }
    def unsubscribed_came_from_user?; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def unsubscribed_change; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def unsubscribed_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def unsubscribed_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def unsubscribed_in_database; end

    sig { returns(T.nilable([T::Boolean, T::Boolean])) }
    def unsubscribed_previous_change; end

    sig { returns(T::Boolean) }
    def unsubscribed_previously_changed?; end

    sig { returns(T.nilable(T::Boolean)) }
    def unsubscribed_previously_was; end

    sig { returns(T.nilable(T::Boolean)) }
    def unsubscribed_was; end

    sig { void }
    def unsubscribed_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at; end

    sig { params(value: T.nilable(::ActiveSupport::TimeWithZone)).returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at=(value); end

    sig { returns(T::Boolean) }
    def updated_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_before_last_save; end

    sig { returns(T.untyped) }
    def updated_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def updated_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def updated_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_previous_change; end

    sig { returns(T::Boolean) }
    def updated_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_was; end

    sig { void }
    def updated_at_will_change!; end

    sig { returns(T::Boolean) }
    def will_save_change_to_address?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_confirm_id?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_confirmed?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_created_at?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_email?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_id?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_last_delivered_at?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_last_delivered_successfully?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_last_processed?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_last_sent?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_lat?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_lng?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_radius_meters?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_unsubscribed?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_unsubscribed_at?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_unsubscribed_by?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_updated_at?; end
  end

  module GeneratedRelationMethods
    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def active(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def confirmed(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def in_past_week(*args, &blk); end
  end
end
