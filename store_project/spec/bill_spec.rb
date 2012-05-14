require 'spec_helper'
# Rspec test cases for Bill class
describe Bill do
  before :all do
    @grocery_products = [[200, true], [300, true]].collect{|p| Product.new *p}
    @non_grocery_products = [[200, false],[300, false]].collect{|p| Product.new *p}
    @store_employee_user = User.new(true,false,1)
    @store_affiliate_user = User.new(false,true,1)
    @store_old_user = User.new(false,false,3)
    @all_discounts_applicable_user = User.new(true,true,3)
    @other_user = User.new(false,false,1)

    @bill = Bill.new(@other_user, @grocery_products + @non_grocery_products)
  end

  describe '#new' do
    it "returns a Bill object" do
      @bill.should be_an_instance_of Bill
    end

    it "throws argument error when given less than 2 parameters" do
      lambda{ Bill.new(@other_user)}.should raise_exception ArgumentError
    end
  end
  
  describe "#products" do
    it "should return all valid products in a bill" do
        @bill.products.should be_an_instance_of Array
        @bill.products.each do |product|
          product.should be_an_instance_of Product
        end
    end
  end

  describe "#user" do
    it "should return the user object associated with the bill" do
        @bill.user.should be_a_kind_of User
    end
  end
  
  describe "#total" do
    it "should return non discounted total of the bill" do
      @bill.total.should be_same_number_as 1000
    end
  end
 
  describe "#add_product" do
    it "should add product and update total" do
      @bill.add_product Product.new(200, true)
      @bill.total.should be_same_number_as 1200
    end
  end
 
  describe "#discounted_total" do

    it "should return discounted amount for a store employee" do
      bill = Bill.new(@store_employee_user, @non_grocery_products)
      bill.discounted_total.should be_same_number_as 335
      
      bill = Bill.new(@store_employee_user, @grocery_products)
      bill.discounted_total.should be_same_number_as 475

      bill = Bill.new(@store_employee_user, @grocery_products + @non_grocery_products)
      bill.discounted_total.should be_same_number_as 810
    end
    
    it "should return discounted amount for a store affiliate" do
      bill = Bill.new(@store_affiliate_user, @non_grocery_products)
      bill.discounted_total.should be_same_number_as 430
      
      bill = Bill.new(@store_affiliate_user, @grocery_products)
      bill.discounted_total.should be_same_number_as 475

      bill = Bill.new(@store_affiliate_user, @grocery_products + @non_grocery_products)
      bill.discounted_total.should be_same_number_as 905
    end
    
    it "should return discounted amount for an user older than 2 years" do
      bill = Bill.new(@store_old_user, @non_grocery_products)
      bill.discounted_total.should be_same_number_as 455
      
      bill = Bill.new(@store_old_user, @grocery_products)
      bill.discounted_total.should be_same_number_as 475

      bill = Bill.new(@store_old_user, @grocery_products + @non_grocery_products)
      bill.discounted_total.should be_same_number_as 930
    end
    
    it "should return discounted amount for an user newer than 2 year" do
      bill = Bill.new(@other_user, [Product.new(90,false)])
      bill.discounted_total.should be_same_number_as 90

      bill = Bill.new(@other_user, [Product.new(210,false)])
      bill.discounted_total.should be_same_number_as 200
    end
  end
end

