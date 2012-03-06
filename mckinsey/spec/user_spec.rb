require 'spec_helper'

describe User do
  before :each do
    @user = User.new(true,false,1)
  end

  describe '#new' do
    it "returns a User object" do
      @user.should be_an_instance_of User
    end

    it "throws argument error when given less than 3 parameters" do
      lambda{ User.new true,false }.should raise_exception ArgumentError
    end
  end
  
  describe "#store_employee" do
    it "returns the correct value of store_employee" do
        @user.store_employee?.should eql true
    end
  end

  describe "#store_affiliate" do
    it "returns the correct store_affiliation" do
        @user.store_affiliate?.should eql false
    end
  end

  describe "#membership_duration" do
    it "returns the correct duration" do
        @user.membership_duration.should be_a_kind_of Fixnum
        @user.membership_duration.should eql 1
    end
  end
end

