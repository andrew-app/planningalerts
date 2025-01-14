# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `themes_on_rails` gem.
# Please instead update this file by running `bin/tapioca gem themes_on_rails`.

# typed: true

module ThemesOnRails
  class << self
    def all; end
  end
end

class ThemesOnRails::ActionController
  def initialize(controller, theme); end

  def prefix_path; end
  def theme_name; end
  def theme_resolver; end
  def theme_view_path; end

  private

  def _theme_name(theme); end

  class << self
    def apply_theme(controller_class, theme, options = T.unsafe(nil)); end

    private

    def before_filter_method(options); end
  end
end

module ThemesOnRails::ControllerAdditions
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ThemesOnRails::ControllerAdditions::ClassMethods
end

module ThemesOnRails::ControllerAdditions::ClassMethods
  def theme(theme, options = T.unsafe(nil)); end
end

class ThemesOnRails::Engine < ::Rails::Engine; end
ThemesOnRails::VERSION = T.let(T.unsafe(nil), String)
