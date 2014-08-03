module ActiveAdmin
  module Filters
    module FormtasticAddons


      # If the given method has a predicate (like _eq or _lteq), it's pretty
      # likely we're dealing with a valid search method.
      # def has_predicate?
      #   !!Ransackoid::Predicate.detect_from_string(method.to_s)
      # end

      # Ransack supports exposing selected scopes on your model for advanced searches.
      # def scope?
        # context = Ransack::Context.for klass
        # context.respond_to?(:ransackable_scope?) && context.ransackable_scope?(method.to_s, klass)
        # false
      # end

    end
  end
end
