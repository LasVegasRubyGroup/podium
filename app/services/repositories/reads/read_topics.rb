module Repositories
  module Reads
    class ReadTopics < Read
      def resource_collection
        @resource_collection ||= Topic
      end
    end
  end
end