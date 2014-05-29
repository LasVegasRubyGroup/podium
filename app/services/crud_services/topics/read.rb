module CrudServices
  module Topics
    class Read < CrudServices::Read
      def default_resource_collection
        Topic
      end
    end
  end
end
