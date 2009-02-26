require 'spec'

module MockRecords
  module MockRecordStubbing
    def stub_new_records(klass)
      mock_records = Array.new
      
      make_new_record = lambda do |method, attrs|
        mr = MockRecord.send(method, attrs)
        mock_records << mr
        mr
      end
      
      # Stub creation methods
      [:new, :create, :create!].each do |method|
         klass.stub!(method).with().and_return { make_new_record[method, {}] }
         klass.stub!(method).with(an_instance_of(Hash)).and_return { |attrs| make_new_record[method, attrs] }
      end
      
      klass.stub!(:new_records).and_return do
        mock_records.select { |mr| mr.saved? }.each { |mr| mr.reload }
      end
    end
  end
end
