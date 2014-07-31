require 'active_support/concern'

module AtomicBase
  extend ActiveSupport::Concern

  included do

    self.primary_key = :uuid

    # example of descendant class -- Topic                     

    # atomic record extension class (contains the real data) -- ExtTopic
    def self.atomic_record_extension
      "Ext#{self}"
    end    

    has_many :versions, ->{ order "id DESC"}, class_name: atomic_record_extension, foreign_key: :uuid

    belongs_to :data, class_name: atomic_record_extension, foreign_key: :ext_id

    default_scope {includes(:data).where(deleted: false)}

    # create forwarding accessors for the data columns
    extension_class = atomic_record_extension.constantize
    data_cols =  extension_class.column_names - %w(id deleted uuid created_at update_at)
    code = ""
    data_cols.each do |col|
      code << "def #{col}; data.#{col} end\n"
      code << "def #{col}=(value); data.#{col} = value; end\n"
    end
    class_eval code

  end

  # created returns created_at for the base
  def created
    self.created_at
  end

  # updated returnes created_at for the current record
  def updated
    self.data.created_at
  end

 end
