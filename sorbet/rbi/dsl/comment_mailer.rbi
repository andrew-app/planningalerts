# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `CommentMailer`.
# Please instead update this file by running `bin/tapioca dsl CommentMailer`.

# typed: true
class CommentMailer
  sig { params(comment: Comment).returns(::ActionMailer::MessageDelivery) }
  def self.notify_authority(comment); end
end