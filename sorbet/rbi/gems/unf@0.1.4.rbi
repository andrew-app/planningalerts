# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `unf` gem.
# Please instead update this file by running `bin/tapioca gem unf`.

# typed: true

module UNF; end

class UNF::Normalizer
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  def initialize; end

  def normalize(_arg0, _arg1); end

  class << self
    def normalize(string, form); end
  end
end

UNF::VERSION = T.let(T.unsafe(nil), String)
