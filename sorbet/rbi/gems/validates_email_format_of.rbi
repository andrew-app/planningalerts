# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/validates_email_format_of/all/validates_email_format_of.rbi
#
# validates_email_format_of-1.6.3

module ValidatesEmailFormatOf
  def self.default_message; end
  def self.load_i18n_locales; end
  def self.validate_domain_part_syntax(domain); end
  def self.validate_email_domain(email); end
  def self.validate_email_format(email, options = nil); end
  def self.validate_local_part_syntax(local); end
end
module ActiveModel
end
module ActiveModel::Validations
end
class ActiveModel::Validations::EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value); end
end
module ActiveModel::Validations::HelperMethods
  def validates_email_format_of(*attr_names); end
end
class ValidatesEmailFormatOf::Railtie < Rails::Railtie
end
