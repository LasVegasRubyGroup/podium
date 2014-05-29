module CrudServices
  module Topics
    class Create < CrudServices::Create
      def default_resource_factory
        Topic
      end
    end
  end
end
