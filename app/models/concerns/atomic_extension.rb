require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module AtomicExtension
  extend ActiveSupport::Concern

  included do

    extension_class = self.to_s                               # ExtTopic
    base_class = extension_class.gsub(/\AExt/, '')            # Topic
    fk_base = "#{base_class.downcase}_id".to_sym              # :topic_id
    base_record = base_class.downcase.to_sym                  # :topic
    base_table = base_class.tableize.to_sym                   # :topics

    belongs_to :base, class_name: base_class, foreign_key: :uuid

  end

 end