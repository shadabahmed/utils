require 'spec_helper'

describe Bill do
  before :all do
    @products = 
    @bill = Bill.new(400, false)
  end

  describe '#new' do
    it "returns a Bill object" do
      @bill.should be_an_instance_of Bill
    end

    it "throws argument error when given less than 2 parameters" do
      lambda{ Bill.new(400) }.should raise_exception ArgumentError
    end
  end
  
  describe "#grocery_item?" do
    it "returns correctly if product is a grocery item" do
        @bill.grocery_item?.should eql false
    end
  end

  describe "#price" do
    it "returns the correct price" do
        @bill.price.should be_a_kind_of Fixnum
        @bill.price.should eql 400
    end
  end

end

