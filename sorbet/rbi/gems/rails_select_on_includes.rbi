# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rails_select_on_includes/all/rails_select_on_includes.rbi
#
# rails_select_on_includes-5.2.1

class ActiveRecord::Associations::JoinDependency::Aliases
  def add_virtual_attribute(selected_column); end
  def flatten_hash_values(some_hash); end
  def slice_selected_attr_types(column_types); end
  def update_aliases_to_select_values(select_values); end
end
class ActiveRecord::Associations::JoinDependency::JoinBase < ActiveRecord::Associations::JoinDependency::JoinPart
  def instantiate(row, aliases, column_types = nil, &block); end
end
