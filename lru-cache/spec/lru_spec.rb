require 'spec_helper'

describe LRUCache::Cache do
  before :each do
    @lru = LRUCache::Cache.new(10)
  end

   it "should fetch a value which has been set" do
    @lru.put(:one, 1)
    @lru.get(:one).should eql 1
  end

  it "should not fetch an expired key" do
    @lru.put(:one, 1, 2)
    @lru.put(:two, 2, 4)
    @lru.get(:one).should eql 1
    sleep(3)
    @lru.get(:one).should eql nil
    @lru.get(:two).should eql 2
  end

  
  it "should clear least recently used entry on cache full" do
    1.upto(11) do |i|
      @lru.put i.to_s.to_sym, i
    end
    @lru.get(:"2").should eql 2
    @lru.get(:"1").should eql nil
  end

  it "should return newest value for same key" do
    @lru.put(:two, 1)
    @lru.put(:two, 2)
    @lru.get(:two).should eql 2
  end
  
  describe "#remove" do
    it "should delete the cache value correctly" do
      @lru.put(:two, 2)
      @lru.remove :two
      @lru.get(:two).should eql nil
    end  
  end
end
