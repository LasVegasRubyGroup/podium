module Crud
  class Delete < Crud::Update

    def initialize(base_record)
      super(base_record, {deleted: true})
    end

  end
end
