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
        list_by_uuid(list).map do |uuid, versions|
          first, last = versions.minmax_by &:created_at
          last.created = first.created_at
          last
        end
      end

      def list_by_uuid(list)
        list.group_by { |object| object.uuid }
      end

      def remove_deleted(list)
        list.reject { |object| object.deleted }
      end
    end
  end
end
