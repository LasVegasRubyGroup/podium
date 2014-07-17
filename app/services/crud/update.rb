module Crud
  class Update < Crud::Create

    attr_accessor :base_row

    def initialize(base_row, parameters)
      @base_row = base_row
      super(parameters)
    end

    def call
      ActiveRecord::Base.transaction do
        current_attributes = base_row.data.attributes
        current_attributes.except!('id', 'created_at', 'updated_at')
        params = parameters.stringify_keys.reverse_merge(current_attributes)
        row = extension_resource_factory.create!(params)
        sql = %Q{
          update #{base_row.class.table_name} 
          set #{base_row.class.fk_named} = #{row.attributes['id']}
          where uuid = '#{base_row.uuid}'}
        ActiveRecord::Base.connection.execute(sql)
        base_row.reload
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