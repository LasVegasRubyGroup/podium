require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module AtomicDefaults
  extend ActiveSupport::Concern

  included do

    this_class = self.to_s                                    # Topic
    base_class = "Base#{self.to_s}"                           # BaseTopic
    fk = "#{this_class.downcase}_id".to_sym                   # :topic_id
    # base_table = base_class.tableize.to_sym                   # :base_topics

    debugger
    has_one :base, class_name: base_class, foreign_key: fk

    default_scope {includes(:base)}

  end

 end