module Repositories
  module Creates
    class CreateTopic < Create
      def default_resource_factory
        Topic
      end
    end
  end
end
