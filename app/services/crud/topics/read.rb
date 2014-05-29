module Crud
  module Topics
    class Read < Crud::Read
      def default_resource_collection
        Topic
      end
    end
  end
end
