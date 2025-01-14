# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `virtus` gem.
# Please instead update this file by running `bin/tapioca gem virtus`.

# typed: true

module Virtus
  include ::Virtus::ClassInclusions::Methods
  include ::Virtus::InstanceMethods
  include ::Virtus::InstanceMethods::Constructor
  include ::Virtus::InstanceMethods::MassAssignment
  include ::Virtus::ClassInclusions

  mixes_in_class_methods ::Virtus::Extensions::Methods
  mixes_in_class_methods ::Virtus::ConstMissingExtensions
  mixes_in_class_methods ::Virtus::ClassMethods

  class << self
    def coerce; end
    def coerce=(value); end
    def coercer(&block); end
    def config(&block); end
    def configuration; end
    def constantize(type); end
    def finalize; end
    def inflector; end
    def model(options = T.unsafe(nil), &block); end
    def module(options = T.unsafe(nil), &block); end
    def value_object(options = T.unsafe(nil), &block); end
    def warn(msg); end

    private

    def extended(object); end
    def included(object); end
  end
end

class Virtus::Attribute
  include ::Virtus::Equalizer::Methods
  extend ::Virtus::TypeLookup
  extend ::Virtus::Options
  extend ::DescendantsTracker

  def initialize(type, options); end

  def coerce(input); end
  def coercer; end
  def coercible?; end
  def default_value; end
  def define_accessor_methods(attribute_set); end
  def finalize; end
  def finalized?; end
  def lazy?; end
  def nullify_blank?; end
  def options; end
  def primitive; end
  def rename(name); end
  def required?; end
  def strict?; end
  def type; end
  def value_coerced?(value); end

  class << self
    def accessor(value = T.unsafe(nil)); end
    def build(type, options = T.unsafe(nil)); end
    def build_coercer(type, options = T.unsafe(nil)); end
    def build_type(definition); end
    def coerce(value = T.unsafe(nil)); end
    def default(value = T.unsafe(nil)); end
    def finalize(value = T.unsafe(nil)); end
    def lazy(value = T.unsafe(nil)); end
    def merge_options!(*_arg0); end
    def nullify_blank(value = T.unsafe(nil)); end
    def primitive(value = T.unsafe(nil)); end
    def required(value = T.unsafe(nil)); end
    def strict(value = T.unsafe(nil)); end
  end
end

module Virtus::Attribute::Accessor
  def defined?(instance); end
  def get(instance); end
  def instance_variable_name; end
  def name; end
  def public_reader?; end
  def public_writer?; end
  def set(instance, value); end
  def set_default_value(instance); end

  class << self
    def extended(descendant); end
  end
end

class Virtus::Attribute::Boolean < ::Virtus::Attribute
  def define_accessor_methods(attribute_set); end
  def value_coerced?(value); end

  class << self
    def build_type(*_arg0); end
  end
end

class Virtus::Attribute::Builder
  def initialize(type_definition, options); end

  def attribute; end
  def klass; end
  def options; end
  def type; end
  def type_definition; end

  private

  def determine_coercer; end
  def determine_visibility; end
  def initialize_attribute; end
  def initialize_class; end
  def initialize_coercer; end
  def initialize_default_value; end
  def initialize_options(options); end
  def initialize_type; end

  class << self
    def call(type, options = T.unsafe(nil)); end
    def determine_type(klass, default = T.unsafe(nil)); end
  end
end

class Virtus::Attribute::Coercer < ::Virtus::Coercer
  def initialize(type, coercers); end

  def call(value); end
  def coercers; end
  def method; end
  def success?(primitive, value); end
end

module Virtus::Attribute::Coercible
  def set(instance, value); end
end

class Virtus::Attribute::Collection < ::Virtus::Attribute
  def coerce(value); end
  def finalize; end
  def finalized?; end
  def member_type; end
  def value_coerced?(value); end

  class << self
    def build_type(definition); end
    def merge_options!(type, options); end
  end
end

class Virtus::Attribute::Collection::Type < ::Struct
  def coercion_method; end
  def member_type; end
  def member_type=(_); end
  def primitive; end
  def primitive=(_); end

  class << self
    def [](*_arg0); end
    def axiom_type?(type); end
    def infer(type, primitive); end
    def infer_member_type(type); end
    def inspect; end
    def members; end
    def new(*_arg0); end
    def pending?(primitive); end
  end
end

class Virtus::Attribute::DefaultValue
  include ::Virtus::Equalizer::Methods
  extend ::DescendantsTracker

  def initialize(value); end

  def call(*_arg0); end
  def value; end

  class << self
    def build(*args); end
  end
end

class Virtus::Attribute::DefaultValue::FromCallable < ::Virtus::Attribute::DefaultValue
  def call(*args); end

  class << self
    def handle?(value); end
  end
end

class Virtus::Attribute::DefaultValue::FromClonable < ::Virtus::Attribute::DefaultValue
  def call(*_arg0); end

  class << self
    def handle?(value); end
  end
end

Virtus::Attribute::DefaultValue::FromClonable::SINGLETON_CLASSES = T.let(T.unsafe(nil), Array)

class Virtus::Attribute::DefaultValue::FromSymbol < ::Virtus::Attribute::DefaultValue
  def call(instance, _); end

  class << self
    def handle?(value); end
  end
end

class Virtus::Attribute::EmbeddedValue < ::Virtus::Attribute
  class << self
    def build_coercer(type, _options); end
    def build_type(definition); end
    def handles?(klass); end
  end
end

class Virtus::Attribute::EmbeddedValue::FromOpenStruct < ::Virtus::Coercer
  def call(input); end
end

class Virtus::Attribute::EmbeddedValue::FromStruct < ::Virtus::Coercer
  def call(input); end
end

Virtus::Attribute::EmbeddedValue::TYPES = T.let(T.unsafe(nil), Array)

class Virtus::Attribute::Hash < ::Virtus::Attribute
  def coerce(*_arg0); end
  def finalize; end
  def finalized?; end
  def key_type; end
  def value_type; end

  class << self
    def build_type(definition); end
    def merge_options!(type, options); end
  end
end

class Virtus::Attribute::Hash::Type < ::Struct
  def coercion_method; end
  def key_type; end
  def key_type=(_); end
  def primitive; end
  def value_type; end
  def value_type=(_); end

  class << self
    def [](*_arg0); end
    def axiom_type?(type); end
    def determine_type(type); end
    def infer(type); end
    def infer_key_and_value_types(type); end
    def inspect; end
    def members; end
    def new(*_arg0); end
    def pending?(primitive); end
  end
end

module Virtus::Attribute::LazyDefault
  def get(instance); end
end

module Virtus::Attribute::NullifyBlank
  def coerce(input); end
end

module Virtus::Attribute::Strict
  def coerce(*_arg0); end
end

class Virtus::AttributeSet < ::Module
  include ::Enumerable

  def initialize(parent = T.unsafe(nil), attributes = T.unsafe(nil)); end

  def <<(attribute); end
  def [](name); end
  def []=(name, attribute); end
  def coerce(attributes); end
  def define_reader_method(attribute, method_name, visibility); end
  def define_writer_method(attribute, method_name, visibility); end
  def each; end
  def finalize; end
  def get(object); end
  def merge(attributes); end
  def reset; end
  def set(object, attributes); end
  def set_defaults(object, filter = T.unsafe(nil)); end

  private

  def merge_attributes(attributes); end
  def skip_default?(object, attribute); end
  def update_index(name, attribute); end

  class << self
    def create(descendant); end
  end
end

class Virtus::Builder
  def initialize(conf, mod = T.unsafe(nil)); end

  def config; end
  def extensions; end
  def mod; end
  def options; end

  private

  def add_extended_hook; end
  def add_included_hook; end
  def with_hook_context; end

  class << self
    def call(options, &block); end
    def pending; end
  end
end

class Virtus::Builder::HookContext
  def initialize(builder, config); end

  def attribute_method; end
  def builder; end
  def config; end
  def constructor?; end
  def finalize?; end
  def initialize_attribute_method; end
  def mass_assignment?; end
  def modules; end
end

module Virtus::ClassInclusions
  include ::Virtus::ClassInclusions::Methods
  include ::Virtus::InstanceMethods
  include ::Virtus::InstanceMethods::Constructor
  include ::Virtus::InstanceMethods::MassAssignment

  mixes_in_class_methods ::Virtus::Extensions::Methods
  mixes_in_class_methods ::Virtus::ConstMissingExtensions
  mixes_in_class_methods ::Virtus::ClassMethods

  class << self
    private

    def included(descendant); end
  end
end

module Virtus::ClassInclusions::Methods
  def allowed_writer_methods; end

  private

  def attribute_set; end
end

module Virtus::ClassMethods
  include ::Virtus::Extensions::Methods
  include ::Virtus::ConstMissingExtensions

  def attribute_set; end
  def attributes; end

  private

  def allowed_methods; end
  def assert_valid_name(name); end
  def inherited(descendant); end

  class << self
    private

    def extended(descendant); end
  end
end

class Virtus::Coercer
  include ::Virtus::Equalizer::Methods

  def initialize(type); end

  def call(input); end
  def primitive; end
  def success?(primitive, input); end
  def type; end
end

class Virtus::CoercionError < ::StandardError
  def initialize(output, attribute); end

  def attribute; end
  def attribute_name; end
  def attribute_name?; end
  def build_message; end
  def output; end
  def target_type; end
end

class Virtus::Configuration
  def initialize(options = T.unsafe(nil)); end

  def coerce; end
  def coerce=(_arg0); end
  def coercer(&block); end
  def constructor; end
  def constructor=(_arg0); end
  def finalize; end
  def finalize=(_arg0); end
  def mass_assignment; end
  def mass_assignment=(_arg0); end
  def nullify_blank; end
  def nullify_blank=(_arg0); end
  def required; end
  def required=(_arg0); end
  def strict; end
  def strict=(_arg0); end
  def to_h; end
end

module Virtus::ConstMissingExtensions
  def const_missing(name); end
end

Virtus::EXTRA_CONST_ARGS = T.let(T.unsafe(nil), Array)

class Virtus::Equalizer < ::Module
  def initialize(name, keys = T.unsafe(nil)); end

  def <<(key); end

  private

  def define_cmp_method; end
  def define_hash_method; end
  def define_inspect_method; end
  def define_methods; end
  def include_comparison_methods; end
end

module Virtus::Equalizer::Methods
  def ==(other); end
  def eql?(other); end
end

module Virtus::Extensions
  class << self
    private

    def extended(object); end
  end
end

Virtus::Extensions::INVALID_WRITER_METHODS = T.let(T.unsafe(nil), Set)

module Virtus::Extensions::Methods
  def allowed_writer_methods; end
  def attribute(name, type = T.unsafe(nil), options = T.unsafe(nil)); end
  def values(&block); end

  private

  def attribute_set; end

  class << self
    private

    def extended(descendant); end
  end
end

Virtus::Extensions::RESERVED_NAMES = T.let(T.unsafe(nil), Set)
Virtus::Extensions::WRITER_METHOD_REGEXP = T.let(T.unsafe(nil), Regexp)

module Virtus::InstanceMethods
  def [](name); end
  def []=(name, value); end
  def freeze; end
  def reset_attribute(attribute_name); end
  def set_default_attributes; end
  def set_default_attributes!; end

  private

  def allowed_methods; end
  def assert_valid_name(name); end
end

module Virtus::InstanceMethods::Constructor
  def initialize(attributes = T.unsafe(nil)); end
end

module Virtus::InstanceMethods::MassAssignment
  def attributes; end
  def attributes=(attributes); end
  def to_h; end
  def to_hash; end
end

module Virtus::Model
  include ::Virtus::ClassInclusions::Methods
  include ::Virtus::InstanceMethods
  include ::Virtus::InstanceMethods::Constructor
  include ::Virtus::InstanceMethods::MassAssignment
  include ::Virtus::ClassInclusions

  mixes_in_class_methods ::Virtus::Extensions::Methods
  mixes_in_class_methods ::Virtus::ConstMissingExtensions
  mixes_in_class_methods ::Virtus::ClassMethods

  class << self
    def extended(descendant); end
    def included(descendant); end
  end
end

module Virtus::Model::Constructor
  include ::Virtus::InstanceMethods::Constructor

  class << self
    private

    def included(descendant); end
  end
end

module Virtus::Model::Core
  include ::Virtus::ClassInclusions::Methods
  include ::Virtus::InstanceMethods

  mixes_in_class_methods ::Virtus::Extensions::Methods
  mixes_in_class_methods ::Virtus::ConstMissingExtensions
  mixes_in_class_methods ::Virtus::ClassMethods

  class << self
    private

    def extended(descendant); end
    def included(descendant); end
  end
end

module Virtus::Model::MassAssignment
  include ::Virtus::InstanceMethods::MassAssignment

  class << self
    private

    def extended(descendant); end
    def included(descendant); end
  end
end

class Virtus::ModelBuilder < ::Virtus::Builder; end

class Virtus::ModuleBuilder < ::Virtus::Builder
  private

  def add_included_hook; end
end

module Virtus::ModuleExtensions
  include ::Virtus::ConstMissingExtensions

  def attribute(name, type = T.unsafe(nil), options = T.unsafe(nil)); end

  private

  def define_attributes(object); end
  def extended(object); end
  def included(object); end

  class << self
    def extended(mod); end
    def setup(mod, inclusions = T.unsafe(nil), attribute_definitions = T.unsafe(nil)); end
  end
end

module Virtus::Options
  def accept_options(*new_options); end
  def accepted_options; end
  def options; end

  protected

  def add_accepted_options(new_options); end
  def define_option_method(option); end
  def set_options(new_options); end

  private

  def inherited(descendant); end
end

class Virtus::PendingAttribute
  def initialize(type, options); end

  def determine_type; end
  def finalize; end
  def finalized?; end
  def name; end
  def options; end
  def type; end
end

class Virtus::TypeDefinition
  def initialize(type); end

  def pending?; end
  def primitive; end
  def type; end

  private

  def initialize_primitive; end
end

module Virtus::TypeLookup
  def determine_type(class_or_name); end
  def primitive; end

  private

  def determine_type_and_cache(class_or_name); end
  def determine_type_from_descendant(descendant); end
  def determine_type_from_primitive(primitive); end
  def determine_type_from_string(string); end

  class << self
    def extended(model); end
  end
end

Virtus::TypeLookup::TYPE_FORMAT = T.let(T.unsafe(nil), Regexp)
Virtus::Undefined = T.let(T.unsafe(nil), Object)

module Virtus::ValueObject
  include ::Virtus::ClassInclusions::Methods
  include ::Virtus::InstanceMethods
  include ::Virtus::InstanceMethods::Constructor
  include ::Virtus::InstanceMethods::MassAssignment
  include ::Virtus::ClassInclusions
  include ::Virtus
  include ::Virtus::ValueObject::InstanceMethods

  mixes_in_class_methods ::Virtus::Extensions::Methods
  mixes_in_class_methods ::Virtus::ConstMissingExtensions
  mixes_in_class_methods ::Virtus::ClassMethods
  mixes_in_class_methods ::Virtus::ValueObject::ClassMethods
  mixes_in_class_methods ::Virtus::ValueObject::AllowedWriterMethods

  class << self
    private

    def included(base); end
  end
end

module Virtus::ValueObject::AllowedWriterMethods
  def allowed_writer_methods; end
end

module Virtus::ValueObject::ClassMethods
  def attribute(name, type, options = T.unsafe(nil)); end
  def equalizer; end
end

module Virtus::ValueObject::InstanceMethods
  def clone; end
  def dup; end
  def with(attribute_updates); end
end

class Virtus::ValueObjectBuilder < ::Virtus::Builder
  def extensions; end
  def options; end
end
