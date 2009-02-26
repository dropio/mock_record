require File.dirname(__FILE__) + '/../spec_helper'

class Model; end

describe MockRecords::MockRecordArgumentMatcher do
  include MockRecords
  
  it "matches a MockRecord with the given attributes" do
    should_receive(:a_message).with(mock_record_with(:name => "Joe"))
    a_message MockRecords::MockRecord.new(:name => "Joe")
  end
  
  it "matches a MockRecord with the given attributes and more" do
    should_receive(:a_message).with(mock_record_with(:name => "Joe"))
    a_message MockRecords::MockRecord.new(:name => "Joe", :age => 32)
  end
  
  it "doesn't match a MockRecord missing any attribute" do
    should_not_receive(:a_message).with(mock_record_with(:name => "Joe", :age => 32))
    a_message MockRecords::MockRecord.new(:name => "Joe")
  end
end
