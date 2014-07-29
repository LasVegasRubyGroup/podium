module Crud
  class Create
    attr_defaultable :uuid_generator, -> { SecureRandom }
    attr_defaultable :resource_factory, -> { default_resource_factory }
    attr_defaultable :extension_resource_factory, ->{ default_extension_resource_factory }
    attr_defaultable :transaction_factory, ->{ ActiveRecord::Base }
    attr_reader :parameters

    def initialize(parameters)
      @parameters = parameters
    end

    def call
      transaction_factory.transaction do
        uuid = uuid_generator.uuid
        params = parameters_with_uuid(uuid)
        ext_record = extension_resource_factory.create!(params)
        resource_factory.create! ext_id: ext_record['id'], uuid: uuid
      end
    end

    def default_resource_factory
      fail NotImplementedError, 'No Default Factory: Please Override'
    end

    def default_extension_resource_factory
      "Ext#{resource_factory}".constantize
    end

    def parameters_with_uuid(uuid)
      parameters.reverse_merge(uuid: uuid)
    end

  end
end
