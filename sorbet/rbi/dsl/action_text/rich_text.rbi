# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ActionText::RichText`.
# Please instead update this file by running `bin/tapioca dsl ActionText::RichText`.

# typed: true
module ActionText
  class RichText
    include GeneratedAssociationMethods
    extend GeneratedRelationMethods

    module GeneratedAssociationMethods
      sig { returns(T::Array[T.untyped]) }
      def embeds_attachment_ids; end

      sig { params(ids: T::Array[T.untyped]).returns(T::Array[T.untyped]) }
      def embeds_attachment_ids=(ids); end

      sig { returns(::ActiveRecord::Associations::CollectionProxy[ActiveStorage::Attachment]) }
      def embeds_attachments; end

      sig { params(value: T::Enumerable[T.untyped]).void }
      def embeds_attachments=(value); end

      sig { returns(T::Array[T.untyped]) }
      def embeds_blob_ids; end

      sig { params(ids: T::Array[T.untyped]).returns(T::Array[T.untyped]) }
      def embeds_blob_ids=(ids); end

      sig { returns(::ActiveRecord::Associations::CollectionProxy[ActiveStorage::Blob]) }
      def embeds_blobs; end

      sig { params(value: T::Enumerable[T.untyped]).void }
      def embeds_blobs=(value); end

      sig { returns(T.nilable(T.untyped)) }
      def record; end

      sig { params(value: T.nilable(T.untyped)).void }
      def record=(value); end

      sig { returns(T.nilable(T.untyped)) }
      def reload_record; end
    end

    module GeneratedRelationMethods
      sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
      def with_attached_embeds(*args, &blk); end
    end
  end
end