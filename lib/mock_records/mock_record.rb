require 'ostruct'

module MockRecords
  class MockRecord
    class << self
      def create!(attrs={})
        mr = new(attrs)
        mr.save!
        mr
      end
      alias_method :create, :create!
    end
    
    def initialize(attrs={})
      @data       = OpenStruct.new(attrs)
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
      nil
    end
  end
end
