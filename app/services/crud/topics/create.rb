module Crud
  module Topics
    class Create < Crud::Create
      def default_resource_factory
        Topic
      end
    end
  end
end
