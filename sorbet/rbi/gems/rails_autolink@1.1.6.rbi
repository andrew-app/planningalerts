# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails_autolink` gem.
# Please instead update this file by running `bin/tapioca gem rails_autolink`.

# typed: true

module ActionView
  extend ::ActiveSupport::Autoload

  class << self
    def eager_load!; end
    def gem_version; end
    def version; end
  end
end

ActionView::ENCODING_FLAG = T.let(T.unsafe(nil), String)

module ActionView::Helpers
  include ::ActiveSupport::Benchmarkable
  include ::ActionView::Helpers::ActiveModelHelper
  include ::ActionView::Helpers::AssetUrlHelper
  include ::ActionView::Helpers::AtomFeedHelper
  include ::ActionView::Helpers::CacheHelper
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::ControllerHelper
  include ::ActionView::Helpers::CspHelper
  include ::ActionView::Helpers::CsrfHelper
  include ::ActionView::Helpers::DateHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::DebugHelper
  include ::ActionView::Helpers::TextHelper
  include ::ActionView::Helpers::FormOptionsHelper
  include ::ActionView::Helpers::JavaScriptHelper
  include ::ActionView::Helpers::NumberHelper
  include ::ActionView::Helpers::RenderingHelper
  extend ::ActiveSupport::Autoload
  extend ::ActiveSupport::Concern
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::AssetTagHelper
  include ::ActionView::Helpers::UrlHelper
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TextHelper
  include ::ActionView::Helpers::FormTagHelper
  include ::ActionView::Helpers::FormHelper
  include ::ActionView::Helpers::TranslationHelper

  mixes_in_class_methods ::ActionView::Helpers::UrlHelper::ClassMethods
  mixes_in_class_methods ::ActionView::Helpers::SanitizeHelper::ClassMethods

  class << self
    def eager_load!; end
  end
end

module ActionView::Helpers::TextHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  extend ::ActiveSupport::Concern
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TagHelper

  mixes_in_class_methods ::ActionView::Helpers::SanitizeHelper::ClassMethods

  def auto_link(text, *args, &block); end
  def concat(string); end
  def current_cycle(name = T.unsafe(nil)); end
  def cycle(first_value, *values); end
  def excerpt(text, phrase, options = T.unsafe(nil)); end
  def highlight(text, phrases, options = T.unsafe(nil)); end
  def pluralize(count, singular, plural_arg = T.unsafe(nil), plural: T.unsafe(nil), locale: T.unsafe(nil)); end
  def reset_cycle(name = T.unsafe(nil)); end
  def safe_concat(string); end
  def simple_format(text, html_options = T.unsafe(nil), options = T.unsafe(nil)); end
  def truncate(text, options = T.unsafe(nil), &block); end
  def word_wrap(text, line_width: T.unsafe(nil), break_sequence: T.unsafe(nil)); end

  private

  def auto_link_email_addresses(text, html_options = T.unsafe(nil), options = T.unsafe(nil)); end
  def auto_link_urls(text, html_options = T.unsafe(nil), options = T.unsafe(nil)); end
  def auto_linked?(left, right); end
  def conditional_html_safe(target, condition); end
  def conditional_sanitize(target, condition, sanitize_options = T.unsafe(nil)); end
  def cut_excerpt_part(part_position, part, separator, options); end
  def get_cycle(name); end
  def set_cycle(name, cycle_object); end
  def split_paragraphs(text); end
end

ActionView::Helpers::TextHelper::AUTO_EMAIL_LOCAL_RE = T.let(T.unsafe(nil), Regexp)
ActionView::Helpers::TextHelper::AUTO_EMAIL_RE = T.let(T.unsafe(nil), Regexp)
ActionView::Helpers::TextHelper::AUTO_LINK_CRE = T.let(T.unsafe(nil), Array)
ActionView::Helpers::TextHelper::AUTO_LINK_RE = T.let(T.unsafe(nil), Regexp)
ActionView::Helpers::TextHelper::BRACKETS = T.let(T.unsafe(nil), Hash)
ActionView::Helpers::TextHelper::WORD_PATTERN = T.let(T.unsafe(nil), String)
ActionView::TemplateError = ActionView::Template::Error
module RailsAutolink; end
class RailsAutolink::Railtie < ::Rails::Railtie; end
