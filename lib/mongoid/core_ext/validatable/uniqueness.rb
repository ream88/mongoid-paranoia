# encoding: utf-8
module Mongoid
  module Validatable

    # Validates whether or not a field is unique against the documents in the
    # database.
    #
    # @example Define the uniqueness validator.
    #
    #   class Person
    #     include Mongoid::Document
    #     field :title
    #
    #     validates_uniqueness_of :title
    #   end
    class UniquenessValidator < ActiveModel::EachValidator

      # Scope the criteria to the scope options provided.
      #
      # @api private
      #
      # @example Scope the criteria.
      #   validator.scope(criteria, document)
      #
      # @param [ Criteria ] criteria The criteria to scope.
      # @param [ Document ] document The document being validated.
      #
      # @return [ Criteria ] The scoped criteria.
      #
      # @since 2.3.0
      def scope(criteria, document, attribute)
        Array.wrap(options[:scope]).each do |item|
          name = document.database_field_name(item)
          criteria = criteria.where(item => document.attributes[name])
        end
        criteria = criteria.where(deleted_at: nil) if document.paranoid?
        criteria
      end
    end
  end
end
