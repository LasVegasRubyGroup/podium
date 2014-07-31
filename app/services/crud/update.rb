module Crud
  class Update < Crud::Create

    attr_accessor :base_record

    def initialize(base_record, parameters)
      @base_record = base_record
      super(parameters)
    end

    def call
      transaction_factory.transaction do
        ext_params = base_record.data.attributes.symbolize_keys
        ext_params.except!(:id, :deleted, :created_at, :updated_at)
        ext_params.merge! parameters
        new_ext = extension_resource_factory.create!(ext_params)
        base_params = {ext_id: new_ext['id'], deleted: new_ext['deleted']}
        base_record.update! base_params
        base_record
      end
    end

  end
end