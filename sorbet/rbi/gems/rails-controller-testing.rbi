# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rails-controller-testing/all/rails-controller-testing.rbi
#
# rails-controller-testing-1.0.5

module Rails
end
module Rails::Controller
end
module Rails::Controller::Testing
  def self.install; end
end
module Rails::Controller::Testing::TestProcess
  def assigns(key = nil); end
end
module Rails::Controller::Testing::Integration
  def delete(*args, **kwargs); end
  def get(*args, **kwargs); end
  def head(*args, **kwargs); end
  def patch(*args, **kwargs); end
  def post(*args, **kwargs); end
  def put(*args, **kwargs); end
end
module Rails::Controller::Testing::TemplateAssertions
  def assert_template(options = nil, message = nil); end
  def process(*arg0, **arg1); end
  def reset_template_assertion; end
  def setup_subscriptions; end
  def teardown_subscriptions; end
  extend ActiveSupport::Concern
end
class Rails::Controller::Testing::Railtie < Rails::Railtie
end
