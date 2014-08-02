module Ransackoid
  class Ransack
    attr_reader :object

    def initialize(object, search_params)
      @object = object

      @search_params = search_params

      @query_hash = get_query_hash(search_params)

      @query = @object.where(@query_hash)
    end

    def result
      @object
    end

    def method_missing(method_id, *args, &block)
      if is_query?(method_id)
        mongoidify_search(method_id.to_s, args.first)
      else
        super
      end
    end

    private

    def is_query?(method_id)
      method_id.to_s =~ /_(contains|eq|equals|in|gt|greater_than|lt|less_than|gte|gteq|lte|lteq)$/
    end

    def get_query_hash(search_params)
      searches = search_params.map do|k, v|
        mongoidify_search(k,v)
      end
      Hash[searches]
    end

    def mongoidify_search(k, v)
      case k
      when /_contains$/
        [get_attribute(k), Regexp.new(Regexp.escape("#{v}"), Regexp::IGNORECASE)]
      when /_eq$/, /_equals$/
        [get_attribute(k), v]
      when /_in$/
        [get_attribute(k).to_sym.in, v]
      when /_gt$/, /_greater_than$/
        [get_attribute(k).to_sym.gt, v]
      when /_lt$/, /_less_than$/
        [get_attribute(k).to_sym.lt, v]
      when /_gte$/, /_gteq$/
        [get_attribute(k).to_sym.gte, v]
      when /_lte$/, /_lteq$/
        [get_attribute(k).to_sym.lte, v]
      else
        [k, v]
      end
    end

    def get_attribute(k)
      k.match(/^(.*)_[^_]+?$/)[1]
    end

  end
end
