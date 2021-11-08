# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `i18n` gem.
# Please instead update this file by running `bin/tapioca gem i18n`.

# typed: true

module I18n
  extend ::I18n::Base

  class << self
    def interpolate(string, values); end
    def interpolate_hash(string, values); end
    def new_double_nested_cache; end
  end
end

class I18n::ArgumentError < ::ArgumentError; end
module I18n::Backend; end

module I18n::Backend::Base
  include ::I18n::Backend::Transliterator

  def available_locales; end
  def eager_load!; end
  def exists?(locale, key, options = T.unsafe(nil)); end
  def load_translations(*filenames); end
  def localize(locale, object, format = T.unsafe(nil), options = T.unsafe(nil)); end
  def reload!; end
  def store_translations(locale, data, options = T.unsafe(nil)); end
  def translate(locale, key, options = T.unsafe(nil)); end

  protected

  def deep_interpolate(locale, data, values = T.unsafe(nil)); end
  def default(locale, object, subject, options = T.unsafe(nil)); end
  def eager_loaded?; end
  def interpolate(locale, subject, values = T.unsafe(nil)); end
  def load_file(filename); end
  def load_json(filename); end
  def load_rb(filename); end
  def load_yaml(filename); end
  def load_yml(filename); end
  def lookup(locale, key, scope = T.unsafe(nil), options = T.unsafe(nil)); end
  def pluralization_key(entry, count); end
  def pluralize(locale, entry, count); end
  def resolve(locale, object, subject, options = T.unsafe(nil)); end
  def subtrees?; end
  def translate_localization_format(locale, object, format, options); end
end

module I18n::Backend::Cache
  def translate(locale, key, options = T.unsafe(nil)); end

  protected

  def _fetch(cache_key, &block); end
  def cache_key(locale, key, options); end
  def fetch(cache_key, &block); end

  private

  def digest_item(key); end
end

module I18n::Backend::CacheFile
  def path_roots; end
  def path_roots=(_arg0); end

  protected

  def load_file(filename); end
  def normalized_path(file); end
end

module I18n::Backend::Cascade
  def lookup(locale, key, scope = T.unsafe(nil), options = T.unsafe(nil)); end
end

class I18n::Backend::Chain
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base
  include ::I18n::Backend::Chain::Implementation
end

module I18n::Backend::Chain::Implementation
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base

  def initialize(*backends); end

  def available_locales; end
  def backends; end
  def backends=(_arg0); end
  def eager_load!; end
  def exists?(locale, key, options = T.unsafe(nil)); end
  def initialized?; end
  def localize(locale, object, format = T.unsafe(nil), options = T.unsafe(nil)); end
  def reload!; end
  def store_translations(locale, data, options = T.unsafe(nil)); end
  def translate(locale, key, default_options = T.unsafe(nil)); end

  protected

  def init_translations; end
  def namespace_lookup?(result, options); end
  def translations; end

  private

  def _deep_merge(hash, other_hash); end
end

module I18n::Backend::Fallbacks
  def exists?(locale, key, options = T.unsafe(nil)); end
  def extract_non_symbol_default!(options); end
  def translate(locale, key, options = T.unsafe(nil)); end

  private

  def on_fallback(_original_locale, _fallback_locale, _key, _optoins); end
end

module I18n::Backend::Flatten
  def flatten_keys(hash, escape, prev_key = T.unsafe(nil), &block); end
  def flatten_translations(locale, data, escape, subtree); end
  def links; end
  def normalize_flat_keys(locale, key, scope, separator); end

  protected

  def escape_default_separator(key); end
  def find_link(locale, key); end
  def resolve_link(locale, key); end
  def store_link(locale, key, link); end

  class << self
    def escape_default_separator(key); end
    def normalize_flat_keys(locale, key, scope, separator); end
  end
end

I18n::Backend::Flatten::FLATTEN_SEPARATOR = T.let(T.unsafe(nil), String)
I18n::Backend::Flatten::SEPARATOR_ESCAPE_CHAR = T.let(T.unsafe(nil), String)

module I18n::Backend::Gettext
  protected

  def load_po(filename); end
  def normalize(locale, data); end
  def normalize_pluralization(locale, key, value); end
  def parse(filename); end
end

class I18n::Backend::Gettext::PoData < ::Hash
  def set_comment(msgid_or_sym, comment); end
end

module I18n::Backend::InterpolationCompiler
  def interpolate(locale, string, values); end
  def store_translations(locale, data, options = T.unsafe(nil)); end

  protected

  def compile_all_strings_in(data); end
end

module I18n::Backend::InterpolationCompiler::Compiler
  extend ::I18n::Backend::InterpolationCompiler::Compiler

  def compile_if_an_interpolation(string); end
  def interpolated_str?(str); end

  protected

  def compile_interpolation_token(key); end
  def compiled_interpolation_body(str); end
  def direct_key(key); end
  def escape_key_sym(key); end
  def escape_plain_str(str); end
  def handle_interpolation_token(interpolation, matchdata); end
  def interpolate_key(key); end
  def interpolate_or_raise_missing(key); end
  def missing_key(key); end
  def nil_key(key); end
  def reserved_key(key); end
  def tokenize(str); end
end

I18n::Backend::InterpolationCompiler::Compiler::INTERPOLATION_SYNTAX_PATTERN = T.let(T.unsafe(nil), Regexp)
I18n::Backend::InterpolationCompiler::Compiler::TOKENIZER = T.let(T.unsafe(nil), Regexp)

class I18n::Backend::KeyValue
  include ::I18n::Backend::Flatten
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base
  include ::I18n::Backend::KeyValue::Implementation
end

module I18n::Backend::KeyValue::Implementation
  include ::I18n::Backend::Flatten
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base

  def initialize(store, subtrees = T.unsafe(nil)); end

  def available_locales; end
  def initialized?; end
  def store; end
  def store=(_arg0); end
  def store_translations(locale, data, options = T.unsafe(nil)); end

  protected

  def init_translations; end
  def lookup(locale, key, scope = T.unsafe(nil), options = T.unsafe(nil)); end
  def pluralize(locale, entry, count); end
  def subtrees?; end
  def translations; end
end

class I18n::Backend::KeyValue::SubtreeProxy
  def initialize(master_key, store); end

  def [](key); end
  def has_key?(key); end
  def inspect; end
  def instance_of?(klass); end
  def is_a?(klass); end
  def kind_of?(klass); end
  def nil?; end
end

module I18n::Backend::Memoize
  def available_locales; end
  def eager_load!; end
  def reload!; end
  def store_translations(locale, data, options = T.unsafe(nil)); end

  protected

  def lookup(locale, key, scope = T.unsafe(nil), options = T.unsafe(nil)); end
  def memoized_lookup; end
  def reset_memoizations!(locale = T.unsafe(nil)); end
end

module I18n::Backend::Metadata
  def interpolate(locale, entry, values = T.unsafe(nil)); end
  def pluralize(locale, entry, count); end
  def translate(locale, key, options = T.unsafe(nil)); end

  protected

  def with_metadata(metadata, &block); end

  class << self
    def included(base); end
  end
end

module I18n::Backend::Pluralization
  def pluralize(locale, entry, count); end

  protected

  def pluralizer(locale); end
  def pluralizers; end
end

class I18n::Backend::Simple
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base
  include ::I18n::Backend::Simple::Implementation
end

module I18n::Backend::Simple::Implementation
  include ::I18n::Backend::Transliterator
  include ::I18n::Backend::Base

  def available_locales; end
  def eager_load!; end
  def initialized?; end
  def reload!; end
  def store_translations(locale, data, options = T.unsafe(nil)); end
  def translations(do_init: T.unsafe(nil)); end

  protected

  def init_translations; end
  def lookup(locale, key, scope = T.unsafe(nil), options = T.unsafe(nil)); end
end

module I18n::Backend::Transliterator
  def transliterate(locale, string, replacement = T.unsafe(nil)); end

  class << self
    def get(rule = T.unsafe(nil)); end
  end
end

I18n::Backend::Transliterator::DEFAULT_REPLACEMENT_CHAR = T.let(T.unsafe(nil), String)

class I18n::Backend::Transliterator::HashTransliterator
  def initialize(rule = T.unsafe(nil)); end

  def transliterate(string, replacement = T.unsafe(nil)); end

  private

  def add(hash); end
  def add_default_approximations; end
  def approximations; end
end

I18n::Backend::Transliterator::HashTransliterator::DEFAULT_APPROXIMATIONS = T.let(T.unsafe(nil), Hash)

class I18n::Backend::Transliterator::ProcTransliterator
  def initialize(rule); end

  def transliterate(string, replacement = T.unsafe(nil)); end
end

module I18n::Base
  def available_locales; end
  def available_locales=(value); end
  def available_locales_initialized?; end
  def backend; end
  def backend=(value); end
  def config; end
  def config=(value); end
  def default_locale; end
  def default_locale=(value); end
  def default_separator; end
  def default_separator=(value); end
  def eager_load!; end
  def enforce_available_locales; end
  def enforce_available_locales!(locale); end
  def enforce_available_locales=(value); end
  def exception_handler; end
  def exception_handler=(value); end
  def exists?(key, _locale = T.unsafe(nil), locale: T.unsafe(nil), **options); end
  def l(object, locale: T.unsafe(nil), format: T.unsafe(nil), **options); end
  def load_path; end
  def load_path=(value); end
  def locale; end
  def locale=(value); end
  def locale_available?(locale); end
  def localize(object, locale: T.unsafe(nil), format: T.unsafe(nil), **options); end
  def normalize_keys(locale, key, scope, separator = T.unsafe(nil)); end
  def reload!; end
  def t(key = T.unsafe(nil), throw: T.unsafe(nil), raise: T.unsafe(nil), locale: T.unsafe(nil), **options); end
  def t!(key, **options); end
  def translate(key = T.unsafe(nil), throw: T.unsafe(nil), raise: T.unsafe(nil), locale: T.unsafe(nil), **options); end
  def translate!(key, **options); end
  def transliterate(key, throw: T.unsafe(nil), raise: T.unsafe(nil), locale: T.unsafe(nil), replacement: T.unsafe(nil), **options); end
  def with_locale(tmp_locale = T.unsafe(nil)); end

  private

  def handle_exception(handling, exception, locale, key, options); end
  def normalize_key(key, separator); end
end

class I18n::Config
  def available_locales; end
  def available_locales=(locales); end
  def available_locales_initialized?; end
  def available_locales_set; end
  def backend; end
  def backend=(backend); end
  def clear_available_locales_set; end
  def default_locale; end
  def default_locale=(locale); end
  def default_separator; end
  def default_separator=(separator); end
  def enforce_available_locales; end
  def enforce_available_locales=(enforce_available_locales); end
  def exception_handler; end
  def exception_handler=(exception_handler); end
  def interpolation_patterns; end
  def interpolation_patterns=(interpolation_patterns); end
  def load_path; end
  def load_path=(load_path); end
  def locale; end
  def locale=(locale); end
  def missing_interpolation_argument_handler; end
  def missing_interpolation_argument_handler=(exception_handler); end
end

I18n::DEFAULT_INTERPOLATION_PATTERNS = T.let(T.unsafe(nil), Array)

class I18n::Disabled < ::I18n::ArgumentError
  def initialize(method); end
end

I18n::EMPTY_HASH = T.let(T.unsafe(nil), Hash)

class I18n::ExceptionHandler
  def call(exception, _locale, _key, _options); end
end

module I18n::Gettext
  class << self
    def extract_scope(msgid, separator); end
    def plural_keys(*args); end
  end
end

I18n::Gettext::CONTEXT_SEPARATOR = T.let(T.unsafe(nil), String)

module I18n::Gettext::Helpers
  def N_(msgsid); end
  def _(msgid, options = T.unsafe(nil)); end
  def gettext(msgid, options = T.unsafe(nil)); end
  def n_(msgid, msgid_plural, n = T.unsafe(nil)); end
  def ngettext(msgid, msgid_plural, n = T.unsafe(nil)); end
  def np_(msgctxt, msgid, msgid_plural, n = T.unsafe(nil)); end
  def npgettext(msgctxt, msgid, msgid_plural, n = T.unsafe(nil)); end
  def ns_(msgid, msgid_plural, n = T.unsafe(nil), separator = T.unsafe(nil)); end
  def nsgettext(msgid, msgid_plural, n = T.unsafe(nil), separator = T.unsafe(nil)); end
  def p_(msgctxt, msgid); end
  def pgettext(msgctxt, msgid); end
  def s_(msgid, separator = T.unsafe(nil)); end
  def sgettext(msgid, separator = T.unsafe(nil)); end
end

I18n::Gettext::PLURAL_SEPARATOR = T.let(T.unsafe(nil), String)
module I18n::HashRefinements; end
I18n::INTERPOLATION_PATTERN = T.let(T.unsafe(nil), Regexp)

class I18n::InvalidLocale < ::I18n::ArgumentError
  def initialize(locale); end

  def locale; end
end

class I18n::InvalidLocaleData < ::I18n::ArgumentError
  def initialize(filename, exception_message); end

  def filename; end
end

class I18n::InvalidPluralizationData < ::I18n::ArgumentError
  def initialize(entry, count, key); end

  def count; end
  def entry; end
  def key; end
end

class I18n::JSON
  class << self
    def decode(value); end
    def encode(value); end
  end
end

module I18n::Locale; end

class I18n::Locale::Fallbacks < ::Hash
  def initialize(*mappings); end

  def [](locale); end
  def defaults; end
  def defaults=(defaults); end
  def map(mappings); end

  protected

  def compute(tags, include_defaults = T.unsafe(nil), exclude = T.unsafe(nil)); end
end

module I18n::Locale::Tag
  class << self
    def implementation; end
    def implementation=(implementation); end
    def tag(tag); end
  end
end

module I18n::Locale::Tag::Parents
  def parent; end
  def parents; end
  def self_and_parents; end
end

I18n::Locale::Tag::RFC4646_FORMATS = T.let(T.unsafe(nil), Hash)
I18n::Locale::Tag::RFC4646_SUBTAGS = T.let(T.unsafe(nil), Array)

class I18n::Locale::Tag::Rfc4646 < ::Struct
  include ::I18n::Locale::Tag::Parents

  def language; end
  def region; end
  def script; end
  def to_a; end
  def to_s; end
  def to_sym; end
  def variant; end

  class << self
    def parser; end
    def parser=(parser); end
    def tag(tag); end
  end
end

module I18n::Locale::Tag::Rfc4646::Parser
  class << self
    def match(tag); end
  end
end

I18n::Locale::Tag::Rfc4646::Parser::PATTERN = T.let(T.unsafe(nil), Regexp)

class I18n::Locale::Tag::Simple
  include ::I18n::Locale::Tag::Parents

  def initialize(*tag); end

  def subtags; end
  def tag; end
  def to_a; end
  def to_s; end
  def to_sym; end

  class << self
    def tag(tag); end
  end
end

class I18n::Middleware
  def initialize(app); end

  def call(env); end
end

class I18n::MissingInterpolationArgument < ::I18n::ArgumentError
  def initialize(key, values, string); end

  def key; end
  def string; end
  def values; end
end

class I18n::MissingTranslation < ::I18n::ArgumentError
  include ::I18n::MissingTranslation::Base
end

module I18n::MissingTranslation::Base
  def initialize(locale, key, options = T.unsafe(nil)); end

  def key; end
  def keys; end
  def locale; end
  def message; end
  def options; end
  def to_exception; end
  def to_s; end
end

class I18n::MissingTranslationData < ::I18n::ArgumentError
  include ::I18n::MissingTranslation::Base
end

I18n::RESERVED_KEYS = T.let(T.unsafe(nil), Array)
I18n::RESERVED_KEYS_PATTERN = T.let(T.unsafe(nil), Regexp)

class I18n::ReservedInterpolationKey < ::I18n::ArgumentError
  def initialize(key, string); end

  def key; end
  def string; end
end

module I18n::Tests; end

module I18n::Tests::Localization
  class << self
    def included(base); end
  end
end

class I18n::UnknownFileType < ::I18n::ArgumentError
  def initialize(type, filename); end

  def filename; end
  def type; end
end

I18n::VERSION = T.let(T.unsafe(nil), String)
