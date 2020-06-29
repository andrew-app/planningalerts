# typed: true
# frozen_string_literal: true

class Stat < ApplicationRecord
  def self.applications_sent
    get_value_for_key("applications_sent")
  end

  def self.increment_applications_sent(value)
    increment_value_for_key("applications_sent", value)
  end

  def self.emails_sent
    get_value_for_key("emails_sent")
  end

  def self.increment_emails_sent(value)
    increment_value_for_key("emails_sent", value)
  end

  def self.get_value_for_key(key)
    record_for_key(key).value
  end

  def self.increment_value_for_key(key, value)
    # rubocop:disable Rails/SkipsModelValidations
    Stat.update_counters(record_for_key(key).id, value: value)
    # rubocop:enable Rails/SkipsModelValidations
  end

  def self.record_for_key(key)
    Stat.find_or_create_by(key: key) { |s| s.value = 0 }
  end
end
