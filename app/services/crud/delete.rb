module Crud
  class Delete < Crud::Update

    def initialize(base_record)
      super(base_record, {deleted: true})
    end

    def update_base(params)
      params.merge deleted: true
      super params
    end

    def sql_update(ext_record)
      "update #{base_record.class.table_name} " \
          "set ext_id = #{ext_record['id']}, deleted = true " \
          "where uuid = '#{base_record.uuid}'"
    end

  end
end
