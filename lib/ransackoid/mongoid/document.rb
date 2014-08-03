module Ransackoid
  module Mongoid
    module Document

      extend ActiveSupport::Concern

      # included do
      #   class_attribute :_ransackers
      #   self._ransackers ||= {}
      # end

      module ClassMethods

      end
    end # Document
  end
end

Mongoid::Document.send :include, Ransackoid::Mongoid::Document
