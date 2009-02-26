require 'ostruct'

class MockRecord
  def initialize
    @data       = OpenStruct.new
    @saved_data = OpenStruct.new
    @new_record = true
    @dirty      = false
  end
  
  def method_missing(id, *a)
    @dirty = true if id.to_s =~ /=$/
    @data.send(id, *a)
  end
  
  def new_record?
    @new_record
  end
  
  def dirty?
    @dirty
  end
  
  def saved?
    not new_record? and not dirty?
  end
  
  def save!
    @new_record = false
    @dirty      = false
    @saved_data = @data.dup
  end
  alias_method :save, :save!
  
  def reload
    @data = @saved_data.dup
  end
end
