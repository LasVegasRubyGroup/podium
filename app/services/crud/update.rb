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
        params = parameters.reverse_merge(current_attributes)
        row = extension_resource_factory.create!(params)
        sql = "update #{base_record.class.table_name} " \
          "set ext_id = #{row.attributes['id']} " \
          "where uuid = '#{base_record.uuid}'"
        ActiveRecord::Base.connection.execute(sql)
        base_record.reload
      end
    end

    def default_resource_factory
      fail NotImplementedError, 'No Default Factory: Please Override'
    end

    def default_extension_resource_factory
      "Ext#{resource_factory}".constantize
    end

  end
end