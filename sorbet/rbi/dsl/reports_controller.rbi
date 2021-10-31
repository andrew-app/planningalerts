# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ReportsController`.
# Please instead update this file by running `bin/tapioca dsl ReportsController`.

# typed: true
class ReportsController
  module HelperMethods
    include ::ActionController::Base::HelperMethods
    include ::ActionDispatch::Routing::PolymorphicRoutes
    include ::ActionDispatch::Routing::UrlFor
    include ::ActionText::ContentHelper
    include ::ActionText::TagHelper
    include ::ActionView::Helpers::AssetTagHelper
    include ::ActionView::Helpers::AssetUrlHelper
    include ::ActionView::Helpers::CaptureHelper
    include ::ActionView::Helpers::DateHelper
    include ::ActionView::Helpers::OutputSafetyHelper
    include ::ActionView::Helpers::SanitizeHelper
    include ::ActionView::Helpers::TagHelper
    include ::ActionView::Helpers::TextHelper
    include ::ActionView::Helpers::UrlHelper
    include ::Admin::ApplicationHelper
    include ::AlertMailerHelper
    include ::ApiHowtoHelper
    include ::ApplicationHelper
    include ::ApplicationsHelper
    include ::AtdisHelper
    include ::AuthoritiesHelper
    include ::CommentsHelper
    include ::DeviseHelper
    include ::GeneratedPathHelpersModule
    include ::GeneratedUrlHelpersModule
    include ::SignupHelper
    include ::StaticHelper

    sig { returns(T.untyped) }
    def current_theme; end
  end

  class HelperProxy < ::ActionView::Base
    include HelperMethods
  end

  sig { returns(HelperProxy) }
  def helpers; end
end