# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `kaminari-actionview` gem.
# Please instead update this file by running `bin/tapioca gem kaminari-actionview`.

# typed: true

module Kaminari
  class << self
    def config; end
    def configure; end
    def paginate_array(array, limit: T.unsafe(nil), offset: T.unsafe(nil), total_count: T.unsafe(nil), padding: T.unsafe(nil)); end
  end
end

module Kaminari::ActionViewExtension; end

module Kaminari::ActionViewExtension::LogSubscriberSilencer
  def render_partial(*_arg0); end
end

module Kaminari::Actionview; end
Kaminari::Actionview::VERSION = T.let(T.unsafe(nil), String)
