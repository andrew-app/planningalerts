# typed: false
# frozen_string_literal: true

class TwitterFeed
  attr_reader :username, :logger

  def initialize(username, logger)
    @username = username
    @logger = logger
  end

  def feed
    twitter = client
    if twitter.nil?
      logger.warn "No twitter API credentials set"
      return []
    end

    # If there's any kind of error just return an empty feed
    begin
      @feed ||= twitter.user_timeline(username)[0...2] || []
    rescue StandardError => e
      logger.error "while accessing twitter API: #{e}"
      []
    end
  end

  def items
    @items ||= feed.map do |tweet|
      item       = OpenStruct.new
      item.title = tweet.text
      item.date  = tweet.created_at
      item.link  = "https://twitter.com/#{username}/status/#{tweet.id}"
      item
    end
  end

  def client
    return unless ENV["TWITTER_CONSUMER_KEY"]

    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_OAUTH_TOKEN"]
      config.access_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
    end
  end
end
