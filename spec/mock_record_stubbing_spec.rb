require File.dirname(__FILE__) + '/spec_helper'
require 'mock_record_stubbing'

class Model; end

describe MockRecordStubbing, "#stub_new_records" do
  include MockRecordStubbing
  
  it "stubs the class's #new" do
    stub_new_records Model
    model = Model.new
    Model.mock_records.should == [model]
  end
end
