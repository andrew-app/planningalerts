# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Devise::OmniauthCallbacksController`.
# Please instead update this file by running `tapioca dsl`.

# typed: true
module Devise
  class OmniauthCallbacksController
    module HelperMethods
      include ::ActionController::Base::HelperMethods
      include ::ActionDispatch::Routing::PolymorphicRoutes
      include ::ActionDispatch::Routing::UrlFor
      include ::ActionText::ContentHelper
      include ::ActionText::TagHelper
      include ::ActionView::Helpers::CaptureHelper
      include ::ActionView::Helpers::OutputSafetyHelper
      include ::ActionView::Helpers::SanitizeHelper
      include ::ActionView::Helpers::TagHelper
      include ::ActionView::Helpers::TextHelper
      include ::Admin::ApplicationHelper
      include ::AlertMailerHelper
      include ::ApiHowtoHelper
      include ::ApplicationController::HelperMethods
      include ::ApplicationHelper
      include ::ApplicationsHelper
      include ::AtdisHelper
      include ::AuthoritiesHelper
      include ::CommentsHelper
      include ::DeviseHelper
      include ::GeneratedPathHelpersModule
      include ::GeneratedUrlHelpers
      include ::GeneratedUrlHelpersModule
      include ::SignupHelper
      include ::StaticHelper

      sig { returns(T.untyped) }
      def devise_mapping; end

      sig { returns(T.untyped) }
      def resource; end

      sig { returns(T.untyped) }
      def resource_class; end

      sig { returns(T.untyped) }
      def resource_name; end

      sig { returns(T.untyped) }
      def resource_params; end

      sig { returns(T.untyped) }
      def scope_name; end

      sig { returns(T.untyped) }
      def signed_in_resource; end
    end

    class HelperProxy < ::ActionView::Base
      include HelperMethods
    end

    sig { returns(HelperProxy) }
    def helpers; end
  end
end