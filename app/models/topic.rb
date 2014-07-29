class Topic < ActiveRecord::Base
  include AtomicBase

  def title
    data.title
  end

  def description
    data.description
  end

end
