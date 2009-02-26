require 'ostruct'

module MockRecords
  class MockRecord
    def initialize
      @data       = OpenStruct.new
      @saved_data = OpenStruct.new
      @saved      = false
      @dirty      = false
    end
  
    def method_missing(id, *a)
      @dirty = true if id.to_s =~ /=$/
      @data.send(id, *a)
    end
  
    def saved?
      @saved
    end
  
    def new_record?
      not saved?
    end
  
    def dirty?
      @dirty
    end
  
    def save!
      @saved      = true
      @dirty      = false
      @saved_data = @data.dup
    end
    alias_method :save, :save!
  
    def reload
      @data = @saved_data.dup
    end
  end
end
