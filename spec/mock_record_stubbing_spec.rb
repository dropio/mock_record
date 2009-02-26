require File.dirname(__FILE__) + '/spec_helper'
require 'mock_record_stubbing'

class Model; end

describe "When Model is stubbed with MockRecordStubbing#stub_new_records, Model" do
  include MockRecordStubbing
  
  before do
    stub_new_records Model
  end
  
  describe ".new" do
    it "returns a new mock record" do
      Model.new.should be_a_new_record
    end
    
    it "takes a hash of attributes to set" do
      m = Model.new(:name => "gary", :age => 32)
      m.name.should == "gary"
      m.age.should  == 32
    end
  end
  
  describe ".create" do
    it "returns a saved mock record" do
      Model.create.should be_saved
    end
    
    it "takes a hash of attributes to set" do
      m = Model.create(:name => "gary", :age => 32)
      m.name.should == "gary"
      m.age.should  == 32
      m.should be_saved
    end
  end
  
  describe ".create!" do
    it "returns a saved mock record" do
      Model.create!.should be_saved
    end
    
    it "takes a hash of attributes to set" do
      m = Model.create!(:name => "gary", :age => 32)
      m.name.should == "gary"
      m.age.should  == 32
      m.should be_saved
    end
  end
  
  describe ".new_records" do
    it "returns all of the mock records created" do
      model1 = Model.new
      model2 = Model.create
      model3 = Model.create!
      
      Model.new_records.should == [model1, model2, model3]
    end
  end
end
