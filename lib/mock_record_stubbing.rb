require 'spec'
require 'mock_record'

module MockRecordStubbing
  def stub_new_records(klass)
    mock_records = Array.new
    
    make_new_record = lambda do |attrs, save|
      mr = MockRecord.new
      attrs.each { |k, v| mr.send "#{k}=", v }
      mr.save! if save
      mock_records << mr
      mr
    end
    
    # Stub creation methods
    [[:new,     false],
     [:create,  true],
     [:create!, true]].each do |method, save|
       klass.stub!(method).with().and_return { make_new_record[{}, save] }
       klass.stub!(method).with(an_instance_of(Hash)).and_return { |attrs| make_new_record[attrs, save] }
    end
    
    klass.stub!(:new_records).and_return do
      mock_records.reject { |mr| mr.new_record? }.each { |mr| mr.reload }
    end
  end
end
