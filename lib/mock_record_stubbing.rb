require 'spec'
require 'mock_record'

module MockRecordStubbing
  def stub_new_records(klass)
    mock_records = Array.new
    
    klass.stub!(:new).and_return do
      mr = MockRecord.new
      mock_records << mr
      mr
    end
    
    klass.stub!(:mock_records).and_return(mock_records)
  end
end
