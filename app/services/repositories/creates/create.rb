module Repositories
  module Creates
    class Create
      attr_writer :resource_factory, :uuid_generator
      attr_reader :parameters

      def initialize(parameters)
        @parameters = parameters
      end

      def call
        resource_factory.create(parameters_with_uuid)
      end

      def resource_factory
        raise 'No Default Factory: Please Override'
      end

      private
      def parameters_with_uuid
        parameters.merge(uuid: uuid_generator.uuid)
      end

      def uuid_generator
        @uuid_generator ||= SecureRandom
      end
    end
  end
end