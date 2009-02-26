module MockRecords
  class MockRecordArgumentMatcher
    def initialize(attrs)
      @attrs = attrs
    end
    
    def ==(mock)
      @attrs.all? do |k, v|
        mock.send(k) == v
      end
    end
    
    def description
      "mock_record_with(#{@attrs.inspect})"
    end
  end
  
  def mock_record_with(attrs)
    MockRecordArgumentMatcher.new(attrs)
  end
end
