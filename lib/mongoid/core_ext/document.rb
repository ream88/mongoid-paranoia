# encoding: utf-8
module Mongoid
  module Paranoia
    module Document
      extend ActiveSupport::Concern

      included do
        # Indicates whether or not the document includes Mongoid::Paranoia.
        # In Mongoid 3, this method was defined on all Mongoid::Documents.
        # In Mongoid 4, it is no longer defined, hence we are shimming it here.
        class_attribute :paranoid
      end
    end
  end
end

Mongoid::Document.send(:include, Mongoid::Paranoia::Document)
