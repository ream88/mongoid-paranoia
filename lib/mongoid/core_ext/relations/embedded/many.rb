# encoding: utf-8
module Mongoid
  module Relations
    module Embedded
      class Many < Relations::Many

        # Delete the supplied document from the target. This method is proxied
        # in order to reindex the array after the operation occurs.
        #
        # @example Delete the document from the relation.
        #   person.addresses.delete(address)
        #
        # @param [ Document ] document The document to be deleted.
        #
        # @return [ Document, nil ] The deleted document or nil if nothing deleted.
        #
        # @since 2.0.0.rc.1
        def delete(document)
          execute_callback :before_remove, document
          doc = target.delete_one(document)
          if doc && !_binding?
            _unscoped.delete_one(doc) unless doc.respond_to?(:paranoid?)
            if _assigning?
              if doc.respond_to?(:paranoid?)
                doc.destroy(suppress: true)
              else
                base.add_atomic_pull(doc)
              end
            else
              doc.delete(suppress: true)
              unbind_one(doc)
            end
          end
          reindex
          execute_callback :after_remove, document
          doc
        end

        # For use only with Mongoid::Paranoia - will be removed in 4.0.
        #
        # @example Get the deleted documents from the relation.
        #   person.paranoid_phones.deleted
        #
        # @return [ Criteria ] The deleted documents.
        #
        # @since 3.0.10
        def deleted
          unscoped.deleted
        end
      end
    end
  end
end
