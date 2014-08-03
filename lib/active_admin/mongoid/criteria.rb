require 'delegate'

Mongoid::Criteria.class_eval do
  # def relation *args, &block
  #   self
  # end

  # def base
  #   klass
  # end

  # def table
  #   CollectionTable.new(klass.collection)
  # end

  # def ransack(q)
  #   Ransackoid::Ransack.new(self, q)
  # end

  # class CollectionTable < SimpleDelegator
  #   def from(*a)
  #     self
  #   end
  # end
end

