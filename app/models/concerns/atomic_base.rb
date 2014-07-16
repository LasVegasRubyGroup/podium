require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module AtomicBase
  extend ActiveSupport::Concern

  included do

    self.primary_key = :uuid

    base_class = self.to_s                                    # BaseTopic
    extended_class = base_class.gsub(/\ABase/, '')            # Topic
    fk = "#{extended_class.downcase}_id".to_sym               # :topic_id

    belongs_to :extended_class, class_name: extended_class, foreign_key: fk

  end

 end
