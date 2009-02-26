require 'spec'
require 'mock_record'

module MockRecordStubbing
  def stub_new_records(klass)
    mock_records = Array.new
    
    klass.stub!(:new).with().and_return do
      mr = MockRecord.new
      mock_records << mr
      mr
    end
    
    klass.stub!(:new).with(an_instance_of(Hash)).and_return do |attrs|
      mr = MockRecord.new
      attrs.each { |k, v| mr.send "#{k}=", v }
      mock_records << mr
      mr
    end
    
    klass.stub!(:create).with().and_return do
      mr = MockRecord.new
      mr.save!
      mock_records << mr
      mr
    end
    
    klass.stub!(:create).with(an_instance_of(Hash)).and_return do |attrs|
      mr = MockRecord.new
      attrs.each { |k, v| mr.send "#{k}=", v }
      mr.save!
      mock_records << mr
      mr
    end
    
    klass.stub!(:create!).with().and_return do
      mr = MockRecord.new
      mr.save!
      mock_records << mr
      mr
    end
    
    klass.stub!(:create!).with(an_instance_of(Hash)).and_return do |attrs|
      mr = MockRecord.new
      attrs.each { |k, v| mr.send "#{k}=", v }
      mr.save!
      mock_records << mr
      mr
    end
    
    klass.stub!(:mock_records).and_return(mock_records)
  end
end
