# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/multi_xml/all/multi_xml.rbi
#
# multi_xml-0.6.0

module MultiXml
  def self.default_parser; end
  def self.parse(xml, options = nil); end
  def self.parse_binary(binary, entity); end
  def self.parse_file(file, entity); end
  def self.parser; end
  def self.parser=(new_parser); end
  def self.symbolize_keys(params); end
  def self.typecast_xml_value(value, disallowed_types = nil); end
  def self.undasherize_keys(params); end
end
class MultiXml::ParseError < StandardError
end
class MultiXml::NoParserError < StandardError
end
class MultiXml::DisallowedTypeError < StandardError
  def initialize(type); end
end
module InvalidName___Class_0x00___FileLike_69
  def content_type; end
  def content_type=(arg0); end
  def original_filename; end
  def original_filename=(arg0); end
end
