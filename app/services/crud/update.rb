module Crud
  class Update < Crud::Create

    attr_accessor :base_record

    def initialize(base_record, parameters)
      @base_record = base_record
      super(parameters)
    end

    def call
      ActiveRecord::Base.transaction do
        current_attributes = base_record.data.attributes.symbolize_keys
        current_attributes.except!(:id, :created_at, :updated_at)
        updated_attributes = parameters.reverse_merge(current_attributes)
        ext_record = extension_resource_factory.create!(updated_attributes)
        #update_base ext_id: ext_record['id']
        ActiveRecord::Base.connection.execute sql_update(ext_record)
        base_record.reload
      end
    end

    def update_base(params)
      base_record.update! params
    end

    def sql_update(ext_record)
      "update #{base_record.class.table_name} " \
          "set ext_id = #{ext_record['id']} " \
          "where uuid = '#{base_record.uuid}'"
    end

  end
end