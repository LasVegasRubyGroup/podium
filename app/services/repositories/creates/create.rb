module Repositories
  module Creates
    class Create
      attr_defaultable :uuid_generator, -> { SecureRandom }
      attr_defaultable :resource_factory, -> { default_resource_factory }
      attr_reader :parameters

      def initialize(parameters)
        @parameters = parameters
      end

      def call
        resource_factory.create(parameters_with_uuid)
      end

      def default_resource_factory
        fail NotImplementedError, 'No Default Factory: Please Override'
      end

      private

      def parameters_with_uuid
        parameters.merge(uuid: uuid_generator.uuid)
      end
    end
  end
end
