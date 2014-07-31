require 'active_support/concern'

module AtomicExtension
  extend ActiveSupport::Concern

  included do

    # example of descendant class -- ExtTopic

    # atomic record base class -- Topic
    def self.atomic_record_base
      self.to_s.gsub(/\AExt/, '')
    end

    belongs_to :base, class_name: atomic_record_base, foreign_key: :uuid

  end

  # created returns created_at for the base
  def created
    self.base.created_at
  end

  # updated returnes created_at for the current record
  def updated
    self.created_at
  end

 end