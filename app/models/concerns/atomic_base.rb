require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module AtomicBase
  extend ActiveSupport::Concern

  included do

    self.primary_key = :uuid

    # named class (contains metadata) -- Topic
    def self.named_class
      self.to_s
    end                        

    # extension_class (contains the real data) -- ExtTopic
    def self.extension_class
      "Ext#{named_class}"
    end                   

    # foreign key -- :topic_id
    def self.fk_named
      "#{named_class.downcase}_id".to_sym
    end

    # extension table -- :ext_topics
    def self.extension_table
      extension_class.tableize.to_sym
    end

    has_many :versions, class_name: extension_class, foreign_key: :uuid

    belongs_to :data, class_name: extension_class, foreign_key: fk_named

    default_scope {includes(:data).where(deleted: false)}

    def self.history(uuid = nil)
      unscoped do
        by_update = "#{extension_table}.created_at asc"   
        scope = joins(:versions).order(by_update)
        scope = scope.where(uuid: uuid) if uuid
        scope
      end
    end

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
