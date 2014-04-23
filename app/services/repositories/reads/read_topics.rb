module Repositories
  module Reads
    class ReadTopics < Read
      def default_resource_collection
        Topic
      end
    end
  end
end
