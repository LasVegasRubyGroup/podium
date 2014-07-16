module Crud
  class Create
    attr_defaultable :uuid_generator, -> { SecureRandom }
    attr_defaultable :resource_factory, -> { default_resource_factory }
    attr_reader :parameters

    def initialize(parameters)
      @parameters = parameters
    end

    def call
      ActiveRecord::Base.transaction do
        row = resource_factory.create!(parameters)
        companion_resource_factory.create! topic_id: row.read_attribute(:id), uuid: row.uuid
      end
    end

    def default_resource_factory
      fail NotImplementedError, 'No Default Factory: Please Override'
    end

    def companion_resource_factory
      "Current#{resource_factory}".constantize
    end

  end
end
