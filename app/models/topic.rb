class Topic < ActiveRecord::Base
  include AtomicDefaults

  # attr_writer :created

  # def created
  #   @created || created_at
  # end

  # def updated
  #   created_at
  # end
end
