# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `responders` gem.
# Please instead update this file by running `bin/tapioca gem responders`.

# typed: true

module ActionController
  extend ::ActiveSupport::Autoload

  class << self
    def add_renderer(key, &block); end
    def remove_renderer(key); end
  end
end

module ActionController::RespondWith
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActionController::RespondWith::ClassMethods

  def respond_with(*resources, &block); end

  protected

  def collect_mimes_from_class_level; end
  def verify_request_format!; end
  def verify_requested_format!; end
end

module ActionController::RespondWith::ClassMethods
  def clear_respond_to; end
  def respond_to(*mimes); end
end

class ActionController::Responder
  def initialize(controller, resources, options = T.unsafe(nil)); end

  def controller; end
  def delete?(*_arg0, &_arg1); end
  def format; end
  def get?(*_arg0, &_arg1); end
  def head(*_arg0, &_arg1); end
  def options; end
  def patch?(*_arg0, &_arg1); end
  def post?(*_arg0, &_arg1); end
  def put?(*_arg0, &_arg1); end
  def redirect_to(*_arg0, &_arg1); end
  def render(*_arg0, &_arg1); end
  def request; end
  def resource; end
  def resources; end
  def respond; end
  def to_format; end
  def to_html; end
  def to_js; end

  protected

  def api_behavior; end
  def api_location; end
  def default_action; end
  def default_render; end
  def display(resource, given_options = T.unsafe(nil)); end
  def display_errors; end
  def has_errors?; end
  def has_renderer?; end
  def has_view_rendering?; end
  def json_resource_errors; end
  def navigation_behavior(error); end
  def navigation_location; end
  def rendering_options; end
  def resource_errors; end
  def resource_location; end
  def response_overridden?; end

  class << self
    def call(*args); end
  end
end

ActionController::Responder::DEFAULT_ACTIONS_FOR_VERBS = T.let(T.unsafe(nil), Hash)
module Responders; end

module Responders::CollectionResponder
  protected

  def navigation_location; end
end

module Responders::ControllerMethod
  def responders(*responders); end
end

module Responders::FlashResponder
  def initialize(controller, resources, options = T.unsafe(nil)); end

  def to_html; end
  def to_js; end

  protected

  def controller_interpolation_options; end
  def flash_defaults_by_namespace(status); end
  def mount_i18n_options(status); end
  def resource_name; end
  def set_flash(key, value); end
  def set_flash_message!; end
  def set_flash_message?; end
  def set_flash_now?; end

  class << self
    def flash_keys; end
    def flash_keys=(_arg0); end
    def helper; end
    def helper=(_arg0); end
    def namespace_lookup; end
    def namespace_lookup=(_arg0); end
  end
end

module Responders::HttpCacheResponder
  def initialize(controller, resources, options = T.unsafe(nil)); end

  def to_format; end

  protected

  def do_http_cache!; end
  def do_http_cache?; end
  def persisted?; end
end

module Responders::LocationResponder
  class << self
    def included(_base); end
  end
end

class Responders::Railtie < ::Rails::Railtie; end
