require 'active_support/concern'

# module that mixes in support for a composite key as an alternate primary key
module ModelDefaults
  extend ActiveSupport::Concern

  included do

    # primary keys must be declared before redefining as alternate keys
    self.primary_key = :uuid

    include AlternatePrimaryKey

    # this is the primary key defined in the database (and in the migration file):
    self.real_primary_key = :id

    # this redefines the previously declared primary key as an alternate key:
    define_alternate_key(:uuid) do |row|
      row.send :write_attribute, :uuid, SecureRandom.uuid
    end
  end  
 end
