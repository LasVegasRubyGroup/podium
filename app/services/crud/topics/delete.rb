module Crud
  module Topics
    class Delete < Crud::Delete
      def default_resource_factory
        Topic
      end
    end
  end
end