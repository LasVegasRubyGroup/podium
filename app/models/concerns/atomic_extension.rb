require 'active_support/concern'

module AtomicExtension
  extend ActiveSupport::Concern

  included do

    # example of descendant class -- ExtTopic

    # atomic record base class -- Topic
    def self.atomic_record_base
      atomic_record_extension = self.to_s
      atomic_record_extension.gsub(/\AExt/, '')
    end

    belongs_to :base, class_name: atomic_record_base, foreign_key: :uuid

  end

 end