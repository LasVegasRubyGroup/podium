module Require
  def self.me(self_path)
    require self_path.gsub('/spec/','/app/').gsub('_spec','')
  end

  def self.parent(self_path, parent)
    require self_path.gsub('/spec/','/app/').gsub('_spec','').gsub(/\/\w+\.rb/,"/#{parent}.rb")
  end
end