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

    # extension table -- :ext_topics
    def self.extension_table
      atomic_record_extension.constantize.table_name
    end

    has_many :versions, ->{ order "id DESC"}, class_name: atomic_record_extension, foreign_key: :uuid

    belongs_to :data, class_name: atomic_record_extension, foreign_key: :ext_id

    default_scope {includes(:data).where(deleted: false)}

  end

  # delegate method calls to extension class 
  def method_missing(method, *args, &block)
      self.data.send method, *args
    rescue NoMethodError
      super
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
