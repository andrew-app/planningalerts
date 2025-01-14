# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `htmlentities` gem.
# Please instead update this file by running `bin/tapioca gem htmlentities`.

# typed: true

class HTMLEntities
  def initialize(flavor = T.unsafe(nil)); end

  def decode(source); end
  def encode(source, *instructions); end
end

class HTMLEntities::Decoder
  def initialize(flavor); end

  def decode(source); end

  private

  def entity_regexp; end
  def prepare(string); end
end

class HTMLEntities::Encoder
  def initialize(flavor, instructions); end

  def encode(source); end

  private

  def basic_entity_regexp; end
  def build_basic_entity_encoder(instructions); end
  def build_extended_entity_encoder(instructions); end
  def contains_only_ascii?(string); end
  def encode_decimal(char); end
  def encode_hexadecimal(char); end
  def encode_named(char); end
  def extended_entity_regexp; end
  def minimize_encoding(string); end
  def prepare(string); end
  def replace_basic(string); end
  def replace_extended(string); end
  def reverse_map; end
  def validate_instructions(instructions); end
end

HTMLEntities::Encoder::INSTRUCTIONS = T.let(T.unsafe(nil), Array)
HTMLEntities::FLAVORS = T.let(T.unsafe(nil), Array)
class HTMLEntities::InstructionError < ::RuntimeError; end
HTMLEntities::MAPPINGS = T.let(T.unsafe(nil), Hash)
HTMLEntities::SKIP_DUP_ENCODINGS = T.let(T.unsafe(nil), Hash)
class HTMLEntities::UnknownFlavor < ::RuntimeError; end
module HTMLEntities::VERSION; end
HTMLEntities::VERSION::MAJOR = T.let(T.unsafe(nil), Integer)
HTMLEntities::VERSION::MINOR = T.let(T.unsafe(nil), Integer)
HTMLEntities::VERSION::STRING = T.let(T.unsafe(nil), String)
HTMLEntities::VERSION::TINY = T.let(T.unsafe(nil), Integer)
