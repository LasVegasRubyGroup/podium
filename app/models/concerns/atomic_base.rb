require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module AtomicBase
  extend ActiveSupport::Concern

  included do

    self.primary_key = :uuid

    base_class = self.to_s                                    # Topic
    extension_class = "Ext#{base_class}"                      # ExtTopic
    fk_base = "#{base_class.downcase}_id".to_sym              # :topic_id
    extension_table = extension_class.tableize.to_sym         # :ext_topics

    has_many :versions, class_name: extension_class, foreign_key: :uuid

    belongs_to :current_version, class_name: extension_class, foreign_key: fk_base

    default_scope {joins(:current_version)}

  end

  # delegate method calls to extension class 
  def method_missing(method, *args, &block)
      self.current_version.send method, *args
    rescue NoMethodError
      super
  end



 end
