module Crud
  class Read
    attr_defaultable :resource_collection, -> { default_resource_collection }
    attr_reader :filters

    def initialize(filters)
      @filters = filters
    end

    def call
      resource_collection.where(filters).to_a
    end

    def default_resource_collection
      fail NotImplementedError, 'No Default Collection: Please Override'
    end

  end
end
