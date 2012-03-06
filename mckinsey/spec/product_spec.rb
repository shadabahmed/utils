require 'spec_helper'
# Rspec test cases for Product class
describe Product do
  before :each do
    @product = Product.new(400, false)
  end

  describe '#new' do
    it "returns a Product object" do
      @product.should be_an_instance_of Product
    end

    it "throws argument error when given less than 2 parameters" do
      lambda{ Product.new(400) }.should raise_exception ArgumentError
    end
  end
  
  describe "#grocery_item?" do
    it "returns correctly if product is a grocery item" do
        @product.grocery_item?.should eql false
    end
  end

  describe "#price" do
    it "returns the correct price" do
        @product.price.should be_a_kind_of Fixnum
        @product.price.should eql 400
    end
  end

end

