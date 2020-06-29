# typed: false
# frozen_string_literal: true

require "standalone_sweeper"

class ApplicationSweeper < StandaloneSweeper
  observe Application

  def after_create(_application)
    expire_page(controller: "authorities", action: "index")
  end

  def after_destroy(_application)
    expire_page(controller: "authorities", action: "index")
  end
end
