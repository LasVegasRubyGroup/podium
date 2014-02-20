module Repositories
  module Creates
    class CreateTopic < Create
      def resource_factory
        @resource_factory ||= Topic
      end
    end
  end
end