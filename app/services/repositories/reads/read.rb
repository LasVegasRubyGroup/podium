module Repositories
  module Reads
    class Read
      attr_defaultable :resource_collection, -> { default_resource_collection }
      attr_reader :filters

      def initialize(filters)
        @filters = filters
      end

      def call
        remove_deleted(reduce_to_current(resource_collection.where(filters).to_a))
      end

      def default_resource_collection
        fail NotImplementedError, 'No Default Collection: Please Override'
      end

      private

      def reduce_to_current(list)
        list_by_uuid(list).map { |uuid, versions|
          sorted = sort_by_created_at(versions) # sort_by is expensive for simple keys so we use sort
          sorted.last.created = sorted.first.created_at
          sorted.last
        }
      end

      def list_by_uuid(list)
        list.group_by { |object| object.uuid }
      end

      def sort_by_created_at(list)
        list.sort { |o1, o2| o1.created_at <=> o2.created_at }
      end

      def remove_deleted(list)
        list.reject { |object| object.deleted }
      end
    end
  end
end
