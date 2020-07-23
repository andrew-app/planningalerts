# This is an autogenerated file for dynamic methods in Authority
# Please rerun bundle exec rake rails_rbi:models[Authority] to regenerate.

# typed: strong
module Authority::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Authority::GeneratedAttributeMethods
  sig { returns(T::Boolean) }
  def disabled; end

  sig { params(value: T::Boolean).void }
  def disabled=(value); end

  sig { returns(T::Boolean) }
  def disabled?; end

  sig { returns(T.nilable(String)) }
  def email; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def email=(value); end

  sig { returns(T::Boolean) }
  def email?; end

  sig { returns(String) }
  def full_name; end

  sig { params(value: T.any(String, Symbol)).void }
  def full_name=(value); end

  sig { returns(T::Boolean) }
  def full_name?; end

  sig { returns(Integer) }
  def id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(T.nilable(String)) }
  def last_scraper_run_log; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def last_scraper_run_log=(value); end

  sig { returns(T::Boolean) }
  def last_scraper_run_log?; end

  sig { returns(T.nilable(String)) }
  def morph_name; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def morph_name=(value); end

  sig { returns(T::Boolean) }
  def morph_name?; end

  sig { returns(T.nilable(Integer)) }
  def population_2017; end

  sig { params(value: T.nilable(T.any(Numeric, ActiveSupport::Duration))).void }
  def population_2017=(value); end

  sig { returns(T::Boolean) }
  def population_2017?; end

  sig { returns(T.nilable(String)) }
  def scraper_authority_label; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def scraper_authority_label=(value); end

  sig { returns(T::Boolean) }
  def scraper_authority_label?; end

  sig { returns(String) }
  def short_name; end

  sig { params(value: T.any(String, Symbol)).void }
  def short_name=(value); end

  sig { returns(T::Boolean) }
  def short_name?; end

  sig { returns(String) }
  def state; end

  sig { params(value: T.any(String, Symbol)).void }
  def state=(value); end

  sig { returns(T::Boolean) }
  def state?; end

  sig { returns(T.nilable(String)) }
  def website_url; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def website_url=(value); end

  sig { returns(T::Boolean) }
  def website_url?; end

  sig { returns(T::Boolean) }
  def write_to_councillors_enabled; end

  sig { params(value: T::Boolean).void }
  def write_to_councillors_enabled=(value); end

  sig { returns(T::Boolean) }
  def write_to_councillors_enabled?; end
end

module Authority::GeneratedAssociationMethods
  sig { returns(::Application::ActiveRecord_Associations_CollectionProxy) }
  def applications; end

  sig { returns(T::Array[Integer]) }
  def application_ids; end

  sig { params(value: T::Enumerable[::Application]).void }
  def applications=(value); end

  sig { returns(::Comment::ActiveRecord_Associations_CollectionProxy) }
  def comments; end

  sig { returns(T::Array[Integer]) }
  def comment_ids; end

  sig { params(value: T::Enumerable[::Comment]).void }
  def comments=(value); end

  sig { returns(::CouncillorContribution::ActiveRecord_Associations_CollectionProxy) }
  def councillor_contributions; end

  sig { returns(T::Array[Integer]) }
  def councillor_contribution_ids; end

  sig { params(value: T::Enumerable[::CouncillorContribution]).void }
  def councillor_contributions=(value); end

  sig { returns(::Councillor::ActiveRecord_Associations_CollectionProxy) }
  def councillors; end

  sig { returns(T::Array[Integer]) }
  def councillor_ids; end

  sig { params(value: T::Enumerable[::Councillor]).void }
  def councillors=(value); end

  sig { returns(T.nilable(::GithubIssue)) }
  def github_issue; end

  sig { params(value: T.nilable(::GithubIssue)).void }
  def github_issue=(value); end
end

module Authority::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Authority]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Authority]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Authority]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(Authority)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Authority) }
  def find_by_id!(id); end
end

class Authority < ApplicationRecord
  include Authority::GeneratedAttributeMethods
  include Authority::GeneratedAssociationMethods
  extend Authority::CustomFinderMethods
  extend Authority::QueryMethodsReturningRelation
  RelationType = T.type_alias { T.any(Authority::ActiveRecord_Relation, Authority::ActiveRecord_Associations_CollectionProxy, Authority::ActiveRecord_AssociationRelation) }

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def self.active(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def self.enabled(*args); end
end

class Authority::ActiveRecord_Relation < ActiveRecord::Relation
  include Authority::ActiveRelation_WhereNot
  include Authority::CustomFinderMethods
  include Authority::QueryMethodsReturningRelation
  Elem = type_member(fixed: Authority)

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def active(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def enabled(*args); end
end

class Authority::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Authority::ActiveRelation_WhereNot
  include Authority::CustomFinderMethods
  include Authority::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Authority)

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def active(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def enabled(*args); end
end

class Authority::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Authority::CustomFinderMethods
  include Authority::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Authority)

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def active(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def enabled(*args); end

  sig { params(records: T.any(Authority, T::Array[Authority])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Authority, T::Array[Authority])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Authority, T::Array[Authority])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Authority, T::Array[Authority])).returns(T.self_type) }
  def concat(*records); end
end

module Authority::QueryMethodsReturningRelation
  sig { returns(Authority::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Authority::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Authority::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Authority::ActiveRecord_Relation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

module Authority::QueryMethodsReturningAssociationRelation
  sig { returns(Authority::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Authority::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Authority::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Authority::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Authority::ActiveRecord_AssociationRelation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end
