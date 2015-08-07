# encoding: utf-8
module Mongoid
  module Relations
    module Builders
      module NestedAttributes
        class Many < NestedBuilder
          alias_method :original_destroy, :destroy

          # Destroy the child document, needs to do some checking for embedded
          # relations and delay the destroy in case parent validation fails.
          #
          # @api private
          #
          # @example Destroy the child.
          #   builder.destroy(parent, relation, doc)
          #
          # @param [ Document ] parent The parent document.
          # @param [ Proxy ] relation The relation proxy.
          # @param [ Document ] doc The doc to destroy.
          #
          # @since 3.0.10
          def destroy(parent, relation, doc)
            if doc.paranoid?
              destroy_document(relation, doc)
            else
              original_destroy(parent, relation, doc)
            end
          end
        end
      end
    end
  end
end
