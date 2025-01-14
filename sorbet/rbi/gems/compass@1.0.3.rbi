# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `compass` gem.
# Please instead update this file by running `bin/tapioca gem compass`.

# typed: true

module Compass
  extend ::Compass::HasDeprecatedConstantsFromCore
  extend ::Compass::Version
  extend ::QuickCache
  extend ::Compass::Configuration::Helpers

  private

  def base_directory; end
  def lib_directory; end
  def shared_extension_paths; end

  class << self
    def add_configuration(data, filename = T.unsafe(nil)); end
    def base_directory; end
    def configuration; end
    def const_missing(const_name); end
    def default_configuration; end
    def deprojectize(path, project_path = T.unsafe(nil)); end
    def discover_extensions!; end
    def discover_gem_extensions!; end
    def lib_directory; end
    def projectize(path, project_path = T.unsafe(nil)); end
    def reset_configuration!; end
    def shared_extension_paths; end
  end
end

module Compass::Actions
  def basename(file); end
  def copy(from, to, options = T.unsafe(nil), binary = T.unsafe(nil)); end
  def directory(dir, options = T.unsafe(nil)); end
  def log_action(action, file, options); end
  def logger; end
  def logger=(_arg0); end
  def process_erb(contents, ctx = T.unsafe(nil)); end
  def relativize(path); end
  def remove(file_name); end
  def separate(path); end
  def strip_trailing_separator(path); end
  def write_file(file_name, contents, options = T.unsafe(nil), binary = T.unsafe(nil)); end
end

module Compass::AppIntegration
  extend ::Compass::AppIntegration::Helpers
end

module Compass::AppIntegration::Helpers
  def default?; end
  def init; end
  def lookup(type); end
  def project_types; end
  def register(type, klass); end
end

Compass::AppIntegration::Helpers::DEAFULT_PROJECT_TYPES = T.let(T.unsafe(nil), Hash)

module Compass::AppIntegration::StandAlone
  extend ::Compass::AppIntegration::StandAlone

  def configuration; end
  def installer(*args); end
end

module Compass::AppIntegration::StandAlone::ConfigurationDefaults
  def css_dir_without_default; end
  def default_cache_dir; end
  def default_project_type; end
  def images_dir_without_default; end
  def javascripts_dir_without_default; end
  def sass_dir_without_default; end
end

class Compass::AppIntegration::StandAlone::Installer < ::Compass::Installers::ManifestInstaller
  def compilation_required?; end
  def completed_configuration; end
  def config_contents; end
  def config_files_exist?; end
  def finalize(options = T.unsafe(nil)); end
  def init; end
  def prepare; end
  def write_configuration_files(config_file = T.unsafe(nil)); end
end

class Compass::Compiler
  include ::Compass::Actions

  def initialize(working_path, from, to, options); end

  def clean!; end
  def compile(sass_filename, css_filename, sourcemap_filename = T.unsafe(nil)); end
  def compile_if_required(sass_filename, css_filename, sourcemap_filename = T.unsafe(nil)); end
  def corresponding_css_file(sass_file); end
  def corresponding_sourcemap_file(sass_file); end
  def css_files; end
  def determine_cache_location; end
  def engine(sass_filename, css_filename, sourcemap_filename = T.unsafe(nil)); end
  def error_contents(e, sass_filename); end
  def from; end
  def from=(_arg0); end
  def handle_exception(sass_filename, css_filename, e); end
  def importer; end
  def importer=(_arg0); end
  def needs_update?(css_filename, sass_filename); end
  def new_config?; end
  def options; end
  def options=(_arg0); end
  def out_of_date?; end
  def relative_path(from_path, to_path); end
  def relative_stylesheet_name(sass_file); end
  def reset!; end
  def reset_staleness_checker!; end
  def run; end
  def sass_files(options = T.unsafe(nil)); end
  def sass_options; end
  def sass_options=(_arg0); end
  def should_compile?(sass_filename, css_filename, sourcemap_filename = T.unsafe(nil)); end
  def show_full_exception?; end
  def sourcemap_files; end
  def staleness_checker; end
  def staleness_checker=(_arg0); end
  def stylesheet_name(sass_file); end
  def target_directories; end
  def timed(timed_thing = T.unsafe(nil)); end
  def to; end
  def to=(_arg0); end
  def working_path; end
  def working_path=(_arg0); end
end

module Compass::Configuration
  class << self
    def add_configuration_property(name, comment = T.unsafe(nil), &default); end
    def attributes_for_directory(dir_name, http_dir_name = T.unsafe(nil)); end
    def remove_configuration_property(name); end
  end
end

Compass::Configuration::ARRAY_ATTRIBUTES = T.let(T.unsafe(nil), Array)
Compass::Configuration::ARRAY_ATTRIBUTE_OPTIONS = T.let(T.unsafe(nil), Hash)
Compass::Configuration::ATTRIBUTES = T.let(T.unsafe(nil), Array)

module Compass::Configuration::Comments
  def comment_for_http_path; end
  def comment_for_line_comments; end
  def comment_for_output_style; end
  def comment_for_preferred_syntax; end
  def comment_for_relative_assets; end
end

class Compass::Configuration::Data
  include ::Sass::Callbacks::InstanceMethods
  include ::Compass::Configuration::Inheritance
  include ::Compass::Configuration::Inheritance::InstanceMethods
  include ::Compass::Configuration::Adapters
  include ::Compass::Configuration::Comments
  include ::Compass::Configuration::Serialization
  extend ::Sass::Callbacks
  extend ::Compass::Configuration::Inheritance::ClassMethods
  extend ::Compass::Configuration::Paths

  def initialize(name, attr_hash = T.unsafe(nil)); end

  def add_import_path(*paths); end
  def add_to_additional_import_paths(v); end
  def add_to_framework_path(v); end
  def add_to_loaded_frameworks(v); end
  def add_to_required_libraries(v); end
  def add_to_sprite_load_path(v); end
  def additional_import_paths; end
  def additional_import_paths=(value); end
  def additional_import_paths_set?; end
  def additional_import_paths_without_default; end
  def asset_cache_buster(simple = T.unsafe(nil), &block); end
  def asset_cache_buster=(value); end
  def asset_cache_buster_set?; end
  def asset_cache_buster_without_default; end
  def asset_host(&block); end
  def asset_host=(value); end
  def asset_host_set?; end
  def asset_host_without_default; end
  def cache; end
  def cache=(value); end
  def cache_dir; end
  def cache_dir=(value); end
  def cache_dir_set?; end
  def cache_dir_with_trailing_separator; end
  def cache_dir_without_default; end
  def cache_path; end
  def cache_path=(value); end
  def cache_path_set?; end
  def cache_path_with_trailing_separator; end
  def cache_path_without_default; end
  def cache_set?; end
  def cache_without_default; end
  def chunky_png_options; end
  def chunky_png_options=(value); end
  def chunky_png_options_set?; end
  def chunky_png_options_without_default; end
  def color_output; end
  def color_output=(value); end
  def color_output_set?; end
  def color_output_without_default; end
  def css_dir; end
  def css_dir=(value); end
  def css_dir_set?; end
  def css_dir_with_trailing_separator; end
  def css_dir_without_default; end
  def css_path; end
  def css_path=(value); end
  def css_path_set?; end
  def css_path_with_trailing_separator; end
  def css_path_without_default; end
  def disable_warnings; end
  def disable_warnings=(value); end
  def disable_warnings_set?; end
  def disable_warnings_without_default; end
  def discover(frameworks_dir); end
  def environment; end
  def environment=(value); end
  def environment_set?; end
  def environment_without_default; end
  def extensions_dir; end
  def extensions_dir=(value); end
  def extensions_dir_set?; end
  def extensions_dir_with_trailing_separator; end
  def extensions_dir_without_default; end
  def extensions_path; end
  def extensions_path=(value); end
  def extensions_path_set?; end
  def extensions_path_with_trailing_separator; end
  def extensions_path_without_default; end
  def fonts_dir; end
  def fonts_dir=(value); end
  def fonts_dir_set?; end
  def fonts_dir_with_trailing_separator; end
  def fonts_dir_without_default; end
  def fonts_path; end
  def fonts_path=(value); end
  def fonts_path_set?; end
  def fonts_path_with_trailing_separator; end
  def fonts_path_without_default; end
  def framework_path; end
  def framework_path=(value); end
  def framework_path_set?; end
  def framework_path_without_default; end
  def generated_images_dir; end
  def generated_images_dir=(value); end
  def generated_images_dir_set?; end
  def generated_images_dir_with_trailing_separator; end
  def generated_images_dir_without_default; end
  def generated_images_path; end
  def generated_images_path=(value); end
  def generated_images_path_set?; end
  def generated_images_path_with_trailing_separator; end
  def generated_images_path_without_default; end
  def http_fonts_dir; end
  def http_fonts_dir=(value); end
  def http_fonts_dir_set?; end
  def http_fonts_dir_with_trailing_separator; end
  def http_fonts_dir_without_default; end
  def http_fonts_path; end
  def http_fonts_path=(value); end
  def http_fonts_path_set?; end
  def http_fonts_path_with_trailing_separator; end
  def http_fonts_path_without_default; end
  def http_generated_images_dir; end
  def http_generated_images_dir=(value); end
  def http_generated_images_dir_set?; end
  def http_generated_images_dir_with_trailing_separator; end
  def http_generated_images_dir_without_default; end
  def http_generated_images_path; end
  def http_generated_images_path=(value); end
  def http_generated_images_path_set?; end
  def http_generated_images_path_with_trailing_separator; end
  def http_generated_images_path_without_default; end
  def http_images_dir; end
  def http_images_dir=(value); end
  def http_images_dir_set?; end
  def http_images_dir_with_trailing_separator; end
  def http_images_dir_without_default; end
  def http_images_path; end
  def http_images_path=(value); end
  def http_images_path_set?; end
  def http_images_path_with_trailing_separator; end
  def http_images_path_without_default; end
  def http_javascripts_dir; end
  def http_javascripts_dir=(value); end
  def http_javascripts_dir_set?; end
  def http_javascripts_dir_with_trailing_separator; end
  def http_javascripts_dir_without_default; end
  def http_javascripts_path; end
  def http_javascripts_path=(value); end
  def http_javascripts_path_set?; end
  def http_javascripts_path_with_trailing_separator; end
  def http_javascripts_path_without_default; end
  def http_path; end
  def http_path=(value); end
  def http_path_set?; end
  def http_path_with_trailing_separator; end
  def http_path_without_default; end
  def http_stylesheets_dir; end
  def http_stylesheets_dir=(value); end
  def http_stylesheets_dir_set?; end
  def http_stylesheets_dir_with_trailing_separator; end
  def http_stylesheets_dir_without_default; end
  def http_stylesheets_path; end
  def http_stylesheets_path=(value); end
  def http_stylesheets_path_set?; end
  def http_stylesheets_path_with_trailing_separator; end
  def http_stylesheets_path_without_default; end
  def images_dir; end
  def images_dir=(value); end
  def images_dir_set?; end
  def images_dir_with_trailing_separator; end
  def images_dir_without_default; end
  def images_path; end
  def images_path=(value); end
  def images_path_set?; end
  def images_path_with_trailing_separator; end
  def images_path_without_default; end
  def inherited_data; end
  def inherited_data=(_arg0); end
  def javascripts_dir; end
  def javascripts_dir=(value); end
  def javascripts_dir_set?; end
  def javascripts_dir_with_trailing_separator; end
  def javascripts_dir_without_default; end
  def javascripts_path; end
  def javascripts_path=(value); end
  def javascripts_path_set?; end
  def javascripts_path_with_trailing_separator; end
  def javascripts_path_without_default; end
  def line_comments; end
  def line_comments=(value); end
  def line_comments_set?; end
  def line_comments_without_default; end
  def load(framework_dir); end
  def loaded_frameworks; end
  def loaded_frameworks=(value); end
  def loaded_frameworks_set?; end
  def loaded_frameworks_without_default; end
  def name; end
  def on_sourcemap_removed(&block); end
  def on_sourcemap_saved(&block); end
  def on_sprite_generated(&block); end
  def on_sprite_removed(&block); end
  def on_sprite_saved(&block); end
  def on_stylesheet_error(&block); end
  def on_stylesheet_removed(&block); end
  def on_stylesheet_saved(&block); end
  def output_style; end
  def output_style=(value); end
  def output_style_set?; end
  def output_style_without_default; end
  def preferred_syntax; end
  def preferred_syntax=(value); end
  def preferred_syntax_set?; end
  def preferred_syntax_without_default; end
  def project_path; end
  def project_path=(value); end
  def project_path_set?; end
  def project_path_with_trailing_separator; end
  def project_path_without_default; end
  def project_type; end
  def project_type=(value); end
  def project_type_set?; end
  def project_type_without_default; end
  def raw_additional_import_paths; end
  def raw_asset_cache_buster; end
  def raw_asset_host; end
  def raw_cache; end
  def raw_cache_dir; end
  def raw_cache_path; end
  def raw_chunky_png_options; end
  def raw_color_output; end
  def raw_css_dir; end
  def raw_css_path; end
  def raw_disable_warnings; end
  def raw_environment; end
  def raw_extensions_dir; end
  def raw_extensions_path; end
  def raw_fonts_dir; end
  def raw_fonts_path; end
  def raw_framework_path; end
  def raw_generated_images_dir; end
  def raw_generated_images_path; end
  def raw_http_fonts_dir; end
  def raw_http_fonts_path; end
  def raw_http_generated_images_dir; end
  def raw_http_generated_images_path; end
  def raw_http_images_dir; end
  def raw_http_images_path; end
  def raw_http_javascripts_dir; end
  def raw_http_javascripts_path; end
  def raw_http_path; end
  def raw_http_stylesheets_dir; end
  def raw_http_stylesheets_path; end
  def raw_images_dir; end
  def raw_images_path; end
  def raw_javascripts_dir; end
  def raw_javascripts_path; end
  def raw_line_comments; end
  def raw_loaded_frameworks; end
  def raw_output_style; end
  def raw_preferred_syntax; end
  def raw_project_path; end
  def raw_project_type; end
  def raw_relative_assets; end
  def raw_required_libraries; end
  def raw_sass_dir; end
  def raw_sass_options; end
  def raw_sass_path; end
  def raw_sourcemap; end
  def raw_sprite_engine; end
  def raw_sprite_load_path; end
  def read_inherited_additional_import_paths_array; end
  def read_inherited_framework_path_array; end
  def read_inherited_loaded_frameworks_array; end
  def read_inherited_required_libraries_array; end
  def read_inherited_sprite_load_path_array; end
  def relative_assets; end
  def relative_assets=(value); end
  def relative_assets?; end
  def relative_assets_set?; end
  def relative_assets_without_default; end
  def remove_from_additional_import_paths(v); end
  def remove_from_framework_path(v); end
  def remove_from_loaded_frameworks(v); end
  def remove_from_required_libraries(v); end
  def remove_from_sprite_load_path(v); end
  def require(lib); end
  def required_libraries; end
  def required_libraries=(value); end
  def required_libraries_set?; end
  def required_libraries_without_default; end
  def run_sourcemap_removed(*args, &block); end
  def run_sourcemap_saved(*args, &block); end
  def run_sprite_generated(*args, &block); end
  def run_sprite_removed(*args, &block); end
  def run_sprite_saved(*args, &block); end
  def run_stylesheet_error(*args, &block); end
  def run_stylesheet_removed(*args, &block); end
  def run_stylesheet_saved(*args, &block); end
  def sass_dir; end
  def sass_dir=(value); end
  def sass_dir_set?; end
  def sass_dir_with_trailing_separator; end
  def sass_dir_without_default; end
  def sass_options; end
  def sass_options=(value); end
  def sass_options_set?; end
  def sass_options_without_default; end
  def sass_path; end
  def sass_path=(value); end
  def sass_path_set?; end
  def sass_path_with_trailing_separator; end
  def sass_path_without_default; end
  def set_all(attr_hash); end
  def set_attributes; end
  def set_attributes=(_arg0); end
  def sourcemap; end
  def sourcemap=(value); end
  def sourcemap_set?; end
  def sourcemap_without_default; end
  def sprite_engine; end
  def sprite_engine=(value); end
  def sprite_engine_set?; end
  def sprite_engine_without_default; end
  def sprite_load_path; end
  def sprite_load_path=(value); end
  def sprite_load_path_set?; end
  def sprite_load_path_without_default; end
  def top_level; end
  def top_level=(_arg0); end
  def unset_additional_import_paths!; end
  def unset_asset_cache_buster!; end
  def unset_asset_host!; end
  def unset_cache!; end
  def unset_cache_dir!; end
  def unset_cache_path!; end
  def unset_chunky_png_options!; end
  def unset_color_output!; end
  def unset_css_dir!; end
  def unset_css_path!; end
  def unset_disable_warnings!; end
  def unset_environment!; end
  def unset_extensions_dir!; end
  def unset_extensions_path!; end
  def unset_fonts_dir!; end
  def unset_fonts_path!; end
  def unset_framework_path!; end
  def unset_generated_images_dir!; end
  def unset_generated_images_path!; end
  def unset_http_fonts_dir!; end
  def unset_http_fonts_path!; end
  def unset_http_generated_images_dir!; end
  def unset_http_generated_images_path!; end
  def unset_http_images_dir!; end
  def unset_http_images_path!; end
  def unset_http_javascripts_dir!; end
  def unset_http_javascripts_path!; end
  def unset_http_path!; end
  def unset_http_stylesheets_dir!; end
  def unset_http_stylesheets_path!; end
  def unset_images_dir!; end
  def unset_images_path!; end
  def unset_javascripts_dir!; end
  def unset_javascripts_path!; end
  def unset_line_comments!; end
  def unset_loaded_frameworks!; end
  def unset_output_style!; end
  def unset_preferred_syntax!; end
  def unset_project_path!; end
  def unset_project_type!; end
  def unset_relative_assets!; end
  def unset_required_libraries!; end
  def unset_sass_dir!; end
  def unset_sass_options!; end
  def unset_sass_path!; end
  def unset_sourcemap!; end
  def unset_sprite_engine!; end
  def unset_sprite_load_path!; end
  def watch(glob, &block); end
  def watches; end

  private

  def _chained_run_sourcemap_removed(*args); end
  def _chained_run_sourcemap_saved(*args); end
  def _chained_run_sprite_generated(*args); end
  def _chained_run_sprite_removed(*args); end
  def _chained_run_sprite_saved(*args); end
  def _chained_run_stylesheet_error(*args); end
  def _chained_run_stylesheet_removed(*args); end
  def _chained_run_stylesheet_saved(*args); end
end

class Compass::Configuration::FileData < ::Compass::Configuration::Data
  class << self
    def new_from_file(config_file, defaults = T.unsafe(nil)); end
    def new_from_string(contents, filename, defaults = T.unsafe(nil)); end
  end
end

module Compass::Configuration::Helpers
  def add_project_configuration(*args); end
  def compiler; end
  def configuration_for(config, filename = T.unsafe(nil), defaults = T.unsafe(nil)); end
  def configure_sass_plugin!; end
  def detect_configuration_file(project_path = T.unsafe(nil)); end
  def handle_configuration_change!; end
  def sass_compiler(*args); end
  def sass_engine_options; end
  def sass_plugin_configuration; end
end

Compass::Configuration::Helpers::KNOWN_CONFIG_LOCATIONS = T.let(T.unsafe(nil), Array)
Compass::Configuration::RUNTIME_READONLY_ATTRIBUTES = T.let(T.unsafe(nil), Array)

module Compass::Configuration::Serialization
  def _parse(config_file); end
  def get_binding; end
  def issue_deprecation_warnings; end
  def parse(config_file); end
  def parse_string(contents, filename); end
  def serialize; end
  def serialize_property(prop, value); end
end

module Compass::Deprecation
  class << self
    def deprecated!(identifier, message); end
    def issued_deprecations; end
    def issued_deprecations=(_arg0); end
    def mark_as_issued(identifier); end
  end
end

class Compass::FilesystemConflict < ::Compass::Error; end
module Compass::Installers; end
class Compass::Installers::Base; end
class Compass::Installers::ManifestInstaller < ::Compass::Installers::Base; end

class Compass::Logger
  def initialize(*actions); end

  def action_padding(action); end
  def actions; end
  def actions=(_arg0); end
  def color(c); end
  def emit(msg); end
  def green; end
  def log(msg); end
  def max_action_length; end
  def options; end
  def options=(_arg0); end
  def record(action, *arguments); end
  def red; end
  def time; end
  def time=(_arg0); end
  def wrap(c, reset_to = T.unsafe(nil)); end
  def yellow; end
end

Compass::Logger::ACTION_CAN_BE_QUIET = T.let(T.unsafe(nil), Hash)
Compass::Logger::ACTION_COLORS = T.let(T.unsafe(nil), Hash)
Compass::Logger::COLORS = T.let(T.unsafe(nil), Hash)
Compass::Logger::DEFAULT_ACTIONS = T.let(T.unsafe(nil), Array)
class Compass::MissingDependency < ::Compass::Error; end

class Compass::NullLogger < ::Compass::Logger
  def emit(msg); end
  def log(msg); end
  def record(*args); end
end

module Compass::SassExtensions
  extend ::Compass::HasDeprecatedConstantsFromCore

  class << self
    def const_missing(const_name); end
  end
end

module Compass::SassExtensions::Functions
  extend ::Compass::HasDeprecatedConstantsFromCore

  class << self
    def const_missing(const_name); end
  end
end

module Compass::SassExtensions::Functions::SassDeclarationHelper
  def declare(*args); end
end

module Compass::SassExtensions::Functions::Sprites
  include ::Sass::Script::Value::Helpers
  extend ::Compass::SassExtensions::Functions::SassDeclarationHelper
  extend ::Sass::Script::Value::Helpers

  def inline_sprite(map); end
  def sprite(map, sprite, offset_x = T.unsafe(nil), offset_y = T.unsafe(nil), use_percentages = T.unsafe(nil)); end
  def sprite_does_not_have_parent(map, sprite); end
  def sprite_file(map, sprite); end
  def sprite_has_selector(map, sprite, selector); end
  def sprite_has_valid_selector(selector); end
  def sprite_height(map, sprite = T.unsafe(nil)); end
  def sprite_map(glob, kwargs = T.unsafe(nil)); end
  def sprite_map_name(map); end
  def sprite_names(map); end
  def sprite_path(map); end
  def sprite_position(map, sprite = T.unsafe(nil), offset_x = T.unsafe(nil), offset_y = T.unsafe(nil), use_percentages = T.unsafe(nil)); end
  def sprite_selector_file(map, sprite, selector); end
  def sprite_url(map); end
  def sprite_width(map, sprite = T.unsafe(nil)); end

  protected

  def convert_sprite_name(sprite); end
  def get_sprite_file(map, sprite = T.unsafe(nil)); end
  def missing_image!(map, sprite); end
  def missing_sprite!(function_name); end
  def reversed_color_names; end
  def verify_map(map, error = T.unsafe(nil)); end
  def verify_sprite(sprite); end
end

Compass::SassExtensions::Functions::Sprites::BOOL_FALSE = T.let(T.unsafe(nil), Sass::Script::Value::Bool)
Compass::SassExtensions::Functions::Sprites::IDENTIFIER_RX = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Functions::Sprites::VALID_SELECTORS = T.let(T.unsafe(nil), Array)

module Compass::SassExtensions::Functions::Sprites::VariableReader
  def get_var(variable_name); end
end

Compass::SassExtensions::Functions::Sprites::ZERO = T.let(T.unsafe(nil), Sass::Script::Value::Number)
module Compass::SassExtensions::Sprites; end

class Compass::SassExtensions::Sprites::ChunkyPngEngine < ::Compass::SassExtensions::Sprites::Engine
  def construct_sprite; end
  def save(filename); end
end

class Compass::SassExtensions::Sprites::Engine
  def initialize(width, height, images); end

  def canvas; end
  def canvas=(_arg0); end
  def construct_sprite; end
  def height; end
  def height=(_arg0); end
  def images; end
  def images=(_arg0); end
  def save(filename); end
  def width; end
  def width=(_arg0); end
end

class Compass::SassExtensions::Sprites::Image
  include ::Sass::Script::Value::Helpers

  def initialize(base, relative_file, options); end

  def active; end
  def active?; end
  def base; end
  def digest; end
  def file; end
  def find_file; end
  def focus; end
  def focus?; end
  def get_var_file(var); end
  def height; end
  def hover; end
  def hover?; end
  def left; end
  def left=(_arg0); end
  def mtime; end
  def name; end
  def no_repeat?; end
  def offset; end
  def options; end
  def parent; end
  def position; end
  def relative_file; end
  def repeat; end
  def repeat_x?; end
  def repeat_y?; end
  def size; end
  def spacing; end
  def target; end
  def target?; end
  def top; end
  def top=(_arg0); end
  def width; end

  private

  def dimensions; end
end

Compass::SassExtensions::Sprites::Image::ACTIVE = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Sprites::Image::FOCUS = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Sprites::Image::HOVER = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Sprites::Image::NO_REPEAT = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::Image::PARENT = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Sprites::Image::REPEAT_X = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::Image::REPEAT_Y = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::Image::TARGET = T.let(T.unsafe(nil), Regexp)
Compass::SassExtensions::Sprites::Image::VALID_REPEATS = T.let(T.unsafe(nil), Array)

module Compass::SassExtensions::Sprites::ImageMethods
  def get_magic_selector_image(name, selector); end
  def has_active?(name); end
  def has_focus?(name); end
  def has_hover?(name); end
  def has_target?(name); end
  def image_for(name); end
  def sprite_names; end
end

Compass::SassExtensions::Sprites::ImageMethods::SEPERATORS = T.let(T.unsafe(nil), Array)

class Compass::SassExtensions::Sprites::ImageRow
  extend ::Forwardable

  def initialize(max_width); end

  def <<(image); end
  def add(image); end
  def delete(*args, &block); end
  def efficiency; end
  def empty?(*args, &block); end
  def height; end
  def images; end
  def last(*args, &block); end
  def length(*args, &block); end
  def max_width; end
  def total_width; end
  def width; end
  def will_fit?(image); end
end

class Compass::SassExtensions::Sprites::Images < ::Array
  def sort_by!(method); end
end

module Compass::SassExtensions::Sprites::Layout; end

class Compass::SassExtensions::Sprites::Layout::SpriteLayout
  def initialize(images, kwargs = T.unsafe(nil)); end

  def height; end
  def height=(_arg0); end
  def images; end
  def layout!; end
  def options; end
  def properties; end
  def width; end
  def width=(_arg0); end
end

module Compass::SassExtensions::Sprites::LayoutMethods
  def compute_image_positions!; end
  def diagonal?; end
  def horizontal?; end
  def layout; end
  def smart?; end
  def vertical?; end
end

Compass::SassExtensions::Sprites::LayoutMethods::DIAGONAL = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::LayoutMethods::HORIZONTAL = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::LayoutMethods::SMART = T.let(T.unsafe(nil), String)
Compass::SassExtensions::Sprites::LayoutMethods::VERTICAL = T.let(T.unsafe(nil), String)

class Compass::SassExtensions::Sprites::RowFitter
  extend ::Forwardable

  def initialize(images); end

  def [](*args, &block); end
  def efficiency; end
  def fit!(style = T.unsafe(nil)); end
  def height; end
  def images; end
  def rows; end
  def width; end

  private

  def fast_fit; end
  def new_row(image = T.unsafe(nil)); end
  def scan_fit; end
end

class Compass::SassExtensions::Sprites::SpriteMap < ::Sass::Script::Value::Base
  include ::Compass::SassExtensions::Sprites::SpriteMethods
  include ::Compass::SassExtensions::Sprites::ImageMethods
  include ::Compass::SassExtensions::Sprites::LayoutMethods
  include ::Sass::Script::Value::Helpers

  def initialize(sprites, path, name, context, kwargs); end

  def engine; end
  def engine=(_arg0); end
  def height; end
  def height=(_arg0); end
  def image_names; end
  def image_names=(_arg0); end
  def images; end
  def images=(_arg0); end
  def inspect; end
  def kwargs; end
  def kwargs=(_arg0); end
  def map; end
  def map=(_arg0); end
  def method_missing(meth, *args, &block); end
  def name; end
  def name=(_arg0); end
  def path; end
  def path=(_arg0); end
  def respond_to?(meth); end
  def sort_method; end
  def to_s(kwargs = T.unsafe(nil)); end
  def width; end
  def width=(_arg0); end

  private

  def modulize; end

  class << self
    def from_uri(uri, context, kwargs); end
    def relative_name(sprite); end
  end
end

module Compass::SassExtensions::Sprites::SpriteMethods
  def cleanup_old_sprites; end
  def compute_image_metadata!; end
  def filename; end
  def generate; end
  def generation_required?; end
  def image_filenames; end
  def init_engine; end
  def init_images; end
  def log(action, filename, *extra); end
  def mtime; end
  def name_and_hash; end
  def outdated?; end
  def relativize(path); end
  def save!; end
  def size; end
  def uniqueness_hash; end
end

Compass::SassExtensions::Sprites::SpriteMethods::SPRITE_VERSION = T.let(T.unsafe(nil), String)
class Compass::SpriteException < ::Compass::Error; end

class Compass::SpriteImporter < ::Sass::Importers::Base
  def eql?(other); end
  def find(uri, options); end
  def find_relative(uri, base, options); end
  def hash; end
  def key(uri, options = T.unsafe(nil)); end
  def mtime(uri, options); end
  def public_url(*args); end
  def to_s; end

  class << self
    def content_for_images(uri, name, skip_overrides = T.unsafe(nil)); end
    def files(uri); end
    def find_all_sprite_map_files(path); end
    def path(uri); end
    def path_and_name(uri); end
    def sass_engine(uri, name, importer, options); end
    def sass_options(uri, importer, options); end
    def sprite_name(uri); end
    def sprite_names(uri); end
  end
end

Compass::SpriteImporter::CONTENT_TEMPLATE = T.let(T.unsafe(nil), ERB)
Compass::SpriteImporter::CONTENT_TEMPLATE_FILE = T.let(T.unsafe(nil), String)
Compass::SpriteImporter::SPRITE_IMPORTER_REGEX = T.let(T.unsafe(nil), Regexp)
Compass::SpriteImporter::TEMPLATE_FOLDER = T.let(T.unsafe(nil), String)
Compass::SpriteImporter::VAILD_FILE_NAME = T.let(T.unsafe(nil), Regexp)
Compass::SpriteImporter::VALID_EXTENSIONS = T.let(T.unsafe(nil), Array)
module Compass::Sprites; end

class Compass::Sprites::Binding < ::OpenStruct
  def get_binding; end
end

Compass::VERSION = T.let(T.unsafe(nil), String)
Compass::VERSION_DETAILS = T.let(T.unsafe(nil), Hash)
Compass::VERSION_NAME = T.let(T.unsafe(nil), String)

module Compass::Version
  def parse_version(version, name); end
  def scope(file); end
  def version; end
end

module QuickCache
  def quick_cache(key, ttl = T.unsafe(nil)); end
end

module Sass::Script::Functions
  include ::Compass::Core::SassExtensions::Functions::Configuration
  include ::Compass::Core::SassExtensions::Functions::Selectors
  include ::Compass::Core::SassExtensions::Functions::Enumerate
  include ::Compass::Core::SassExtensions::Functions::Urls
  include ::Compass::Core::SassExtensions::Functions::Urls::StylesheetUrl
  include ::Compass::Core::SassExtensions::Functions::Urls::FontUrl
  include ::Compass::Core::SassExtensions::Functions::Urls::ImageUrl
  include ::Compass::Core::SassExtensions::Functions::Urls::GeneratedImageUrl
  include ::Compass::Core::SassExtensions::Functions::Display
  include ::Compass::Core::SassExtensions::Functions::InlineImage
  include ::Compass::Core::SassExtensions::Functions::ImageSize
  include ::Sass::Script::Value::Helpers
  include ::Compass::Core::SassExtensions::Functions::GradientSupport::Functions
  include ::Compass::Core::SassExtensions::Functions::FontFiles
  include ::Compass::Core::SassExtensions::Functions::Files
  include ::Compass::Core::SassExtensions::Functions::Constants
  include ::Compass::Core::SassExtensions::Functions::Lists
  include ::Compass::Core::SassExtensions::Functions::Colors
  include ::Compass::Core::SassExtensions::Functions::Math
  include ::Compass::Core::SassExtensions::Functions::CrossBrowserSupport
  include ::Compass::Core::SassExtensions::Functions::Env
  include ::Compass::SassExtensions::Functions::Sprites
  include ::Sprockets::SassProcessor::Functions

  def abs(number); end
  def adjust_color(color, kwargs); end
  def adjust_hue(color, degrees); end
  def alpha(*args); end
  def append(list, val, separator = T.unsafe(nil)); end
  def blue(color); end
  def call(name, *args); end
  def ceil(number); end
  def change_color(color, kwargs); end
  def comparable(number1, number2); end
  def complement(color); end
  def counter(*args); end
  def counters(*args); end
  def darken(color, amount); end
  def desaturate(color, amount); end
  def fade_in(color, amount); end
  def fade_out(color, amount); end
  def feature_exists(feature); end
  def floor(number); end
  def function_exists(name); end
  def global_variable_exists(name); end
  def grayscale(color); end
  def green(color); end
  def hsl(hue, saturation, lightness); end
  def hsla(hue, saturation, lightness, alpha); end
  def hue(color); end
  def ie_hex_str(color); end
  def if(condition, if_true, if_false); end
  def index(list, value); end
  def inspect(value); end
  def invert(color); end
  def is_superselector(sup, sub); end
  def join(list1, list2, separator = T.unsafe(nil)); end
  def keywords(args); end
  def length(list); end
  def lighten(color, amount); end
  def lightness(color); end
  def list_separator(list); end
  def map_get(map, key); end
  def map_has_key(map, key); end
  def map_keys(map); end
  def map_merge(map1, map2); end
  def map_remove(map, *keys); end
  def map_values(map); end
  def max(*values); end
  def min(*numbers); end
  def mix(color1, color2, weight = T.unsafe(nil)); end
  def mixin_exists(name); end
  def nth(list, n); end
  def opacify(color, amount); end
  def opacity(color); end
  def percentage(number); end
  def quote(string); end
  def random(*args); end
  def red(color); end
  def rgb(red, green, blue); end
  def rgba(*args); end
  def round(number); end
  def sass_random(limit = T.unsafe(nil)); end
  def saturate(color, amount = T.unsafe(nil)); end
  def saturation(color); end
  def scale_color(color, kwargs); end
  def selector_append(*selectors); end
  def selector_extend(selector, extendee, extender); end
  def selector_nest(*selectors); end
  def selector_parse(selector); end
  def selector_replace(selector, original, replacement); end
  def selector_unify(selector1, selector2); end
  def set_nth(list, n, value); end
  def simple_selectors(selector); end
  def str_index(string, substring); end
  def str_insert(original, insert, index); end
  def str_length(string); end
  def str_slice(string, start_at, end_at = T.unsafe(nil)); end
  def to_lower_case(string); end
  def to_upper_case(string); end
  def transparentize(color, amount); end
  def type_of(value); end
  def unique_id; end
  def unit(number); end
  def unitless(number); end
  def unquote(string); end
  def variable_exists(name); end
  def zip(*lists); end

  private

  def _adjust(color, amount, attr, range, op, units = T.unsafe(nil)); end
  def check_alpha_unit(alpha, function); end
  def numeric_transformation(value); end

  class << self
    def callable?(*_arg0); end
    def declare(method_name, args, options = T.unsafe(nil)); end
    def random_number_generator; end
    def random_seed=(seed); end
    def signature(method_name, arg_arity, kwarg_arity); end

    private

    def include(*args); end
  end
end

class Sass::Script::Functions::Signature < ::Struct
  def args; end
  def args=(_); end
  def delayed_args; end
  def delayed_args=(_); end
  def deprecated; end
  def deprecated=(_); end
  def var_args; end
  def var_args=(_); end
  def var_kwargs; end
  def var_kwargs=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end
