# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Rails::Conductor::ActionMailbox::ReroutesController`.
# Please instead update this file by running `tapioca dsl`.

# typed: true
module Rails
  module Conductor
    module ActionMailbox
      class ReroutesController
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
        end

        class HelperProxy < ::ActionView::Base
          include HelperMethods
        end

        sig { returns(HelperProxy) }
        def helpers; end
      end
    end
  end
end