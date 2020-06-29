# typed: false
# frozen_string_literal: true

module RepliesHelper
  def reply_path(reply)
    application_path(reply.comment.application, anchor: "reply#{reply.id}")
  end
end
