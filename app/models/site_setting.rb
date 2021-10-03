# typed: strict
# frozen_string_literal: true

# Stores versioned site settings. This is an append only log where the most
# recent record contains the current settings for the whole site.
# This is used for things like feature flags
class SiteSetting < ApplicationRecord
  extend T::Sig

  serialize :settings

  DEFAULTS = T.let({
    streetview_in_emails_enabled: true,
    streetview_in_app_enabled: true
  }.freeze, T::Hash[Symbol, T.untyped])

  # Note that this doesn't include the default values
  sig { returns(T::Hash[Symbol, T.untyped]) }
  def self.settings
    SiteSetting.order(id: :desc).first&.settings || {}
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def self.settings_with_defaults
    DEFAULTS.merge(settings)
  end

  sig { params(params: T::Hash[Symbol, T.untyped]).void }
  def self.set(params)
    SiteSetting.create!(settings: settings.merge(params))
  end

  sig { params(param: Symbol).returns(T.untyped) }
  def self.get(param)
    raise "Add default value for parameter :#{param} to SiteSetting.DEFAULTS" unless DEFAULTS.key?(param)

    settings.key?(param) ? settings[param] : DEFAULTS[param]
  end
end
