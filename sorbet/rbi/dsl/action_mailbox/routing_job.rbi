# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ActionMailbox::RoutingJob`.
# Please instead update this file by running `bin/tapioca dsl ActionMailbox::RoutingJob`.

# typed: true

class ActionMailbox::RoutingJob
  sig { params(inbound_email: T.untyped).returns(T.any(ActionMailbox::RoutingJob, FalseClass)) }
  def self.perform_later(inbound_email); end

  sig { params(inbound_email: T.untyped).returns(T.untyped) }
  def self.perform_now(inbound_email); end
end
