# typed: strict
# frozen_string_literal: true

class TopUsageAPIUsersService < ApplicationService
  extend T::Sig

  attr_reader :redis

  def self.call(redis:, date_from:, date_to:, number:)
    new(redis).call(date_from: date_from, date_to: date_to, number: number)
  end

  def initialize(redis)
    @redis = redis
  end

  def call(date_from:, date_to:, number:)
    top_total_usage_by_api_key_in_date_range(date_from, date_to, number).map do |h|
      user = User.find_by(api_key: h[:api_key])
      { requests: h[:requests], user: user }
    end
  end

  def all_usage_by_user_on_date(date)
    all_usage_by_api_key_on_date(date).map do |a|
      user = User.find_by(api_key: a[:api_key])
      { requests: a[:requests], user: user }
    end
  end

  def all_usage_by_api_key_on_date(date)
    # Definitely not the most efficient way to do things. It would be more
    # efficient in redis land to be using a hash but we're depending currently
    # on the way rack-throttle stores stuff
    keys = all_keys_for_date(date)
    api_keys = keys.map { |k| k.split(":")[1] }
    values = redis.mget(keys).map(&:to_i)
    values.zip(api_keys).map { |a| { requests: a[0], api_key: a[1] } }
  end

  def all_keys_for_date(date)
    redis.scan_each(match: "throttle:*:#{date}").to_a.uniq
  end

  def all_usage_by_api_key_in_date_range(date_from, date_to)
    # TODO: Improve this implementation so that it doesn't make so many
    # separate calls to redis
    r = []
    (date_from..date_to).each do |date|
      r += all_usage_by_api_key_on_date(date)
    end
    r
  end

  def total_usage_by_api_key_in_date_range(date_from, date_to)
    # Use 0 as a default value for the hash members
    r = Hash.new(0)
    all_usage_by_api_key_in_date_range(date_from, date_to).each do |record|
      requests = record[:requests]
      api_key = record[:api_key]
      r[api_key] += requests
    end
    # Put it back into array form
    r.map do |api_key, requests|
      { api_key: api_key, requests: requests }
    end
  end

  def top_total_usage_by_api_key_in_date_range(date_from, date_to, number)
    # Put it in array form
    array = total_usage_by_api_key_in_date_range(date_from, date_to)
    array = array.sort { |a, b| b[:requests] <=> a[:requests] }
    array[0..(number - 1)]
  end
end