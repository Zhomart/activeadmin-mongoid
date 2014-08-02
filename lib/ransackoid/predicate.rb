module Ransackoid
  class Predicate
    def self.detect_from_string(str)
      names.include?(str.to_s)
    end

    def self.names
      %w(contains eq equals in gt greater_than lt less_than gte gteq lte lteq)
    end
  end
end
