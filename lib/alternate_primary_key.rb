# Copyright (c) 2014 Pololu Corporation. For more information, see

# http://www.pololu.com/
# http://forum.pololu.com/

# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

module AlternatePrimaryKey
  extend ActiveSupport::Concern

  # NOTE:  When using composite_primary_keys, primary_keys= must be called before
  # including the present module, in order to get the ancestor chain set up the right way:
  #      XXX < this module < composite < ActiveRecord::Base
  included do
      around_create :set_keys
  end

  def set_keys
    if self.class.using_alternate_primary_key? then
      @creating = true
      temp = self.class.primary_key  # Rails 4.0
      self.class.primary_key = self.class.real_primary_key # Rails 4.0
      yield  # actual key value from database will be copied to "real primary key" field
      @creating = false
      self.class.primary_key = temp # Rails 4.0
      update_alternate_key
    else #do nothing
      yield
    end
  end

  # Rails 4.1
  # # override ActiveRecord::AttributeMethods::PrimaryKey#id
  # def id
  #   return super unless @creating 
  #   #nil
  # end

  # Rails 4.1
  # # override ActiveRecord::AttributeMethods::PrimaryKey#id=
  # # set the real primary key instead!
  # def id=(value)
  #   return super # unless @creating
  #   # instance_eval("self.#{self.class.real_primary_key} = #{value}")   
  # end

  # supports single or composite alternate keys
  def update_alternate_key
    return unless self.class.using_alternate_primary_key?

    # call user-defined updater to populate alternate keys fields in the cached record
    if self.class.updater

      # update fields in the cached record
      self.class.updater.call(self)

      # apply updates to the database record (identified by its real primary key)
      query_string = instance_eval "\"#{self.class.query_template}\""
      ActiveRecord::Base.connection.execute(query_string)
    end
  end

  def real_primary_key_value
    instance_eval self.class.real_primary_key
  end

  def initialize_dup(orig)
    super
    write_attribute(self.class.real_primary_key.to_sym, nil)
  end

  alias :clone :dup

  module ClassMethods

    def real_primary_key=(value)
      @real_primary_key = value && value.to_s
    end

    def real_primary_key
      @real_primary_key
    end

    def using_alternate_primary_key?
      @real_primary_key && @alternate_primary_key_defined
    end

    def define_alternate_key(*keys, &updater)
      # the alternate key(s) must already have been declared as primary key(s) in Active Record
      raise "alternate key(s) must match declared primary key(s)" unless
        [keys].flatten.map(&:to_sym) == [primary_key].flatten.map(&:to_sym)

      if updater
        @updater = updater
        # make query template to update the database record (identified by its real primary key)
        updates = keys.reduce("") do |sql, key|
          sql += ", " if sql.length > 0
          sql += "#{key.to_s} = '" + '#{self.read_attribute(:' + key.to_s + ')}' + "'"
        end
        rpk = "#{real_primary_key.to_s} = '" + '#{self.read_attribute(:' + real_primary_key.to_s + ')}' + "'"
        @query_template = "UPDATE #{table_name} SET #{updates} WHERE #{rpk}"  
        # LIMIT 1 not supported by PostgreSQL
      end
      @alternate_primary_key_defined = true
    end

    def updater
      @updater
    end

    def query_template
      @query_template
    end

  end

end
