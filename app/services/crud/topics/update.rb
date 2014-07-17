module Crud
  module Topics
    class Update < Crud::Update
      def default_resource_factory
        Topic
      end
    end
  end
end