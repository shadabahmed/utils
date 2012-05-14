require 'spec_helper'
describe MaxQueue do

  before :each do
    @queue = MaxQueue.new
  end

  describe "#queue" do
   it "should be able to queue an item without exceptions" do
     1.upto(1000) do |i|
       lambda{ @queue.queue(i) }.should_not raise_error
     end	
   end
  end

  describe "#dequeue" do
   it "should be able to dequeue an item in correct order" do
    arr = []
    1000.times { arr << rand(1000)}
    arr.each do |i|
       @queue.queue(i)
     end
     arr.each do |i|
       @queue.dequeue.should eql i
     end
   end
  end

  describe "#max" do
    it "should give correct maximum when data is in ascending order" do
      1.upto(1000) do |i|
        @queue.queue(i)
      end
      1000.times do
        @queue.max.should eql 1000
        @queue.dequeue
      end
    end

    it "should give correct maximum when data is in ascending order" do
      1000.downto(1) do |i|
        @queue.queue(i)
      end
      1000.downto(1) do |i|
        @queue.max.should eql i
        @queue.dequeue
      end
    end
    
    it "should give correct maximum when data is repeated" do
      @queue.queue([1,5]*1000 + [5]*100)
      until @queue.dequeue
         @queue.max.should eql 5
      end
    end   
    
    it "should give correct maximum on random data" do
      10.times do
        arr = []
        1000.times { arr << rand(1000)}
        @queue.queue arr
        until arr.empty? do
          @queue.max.should eql arr.max
          @queue.dequeue
          arr.shift
        end
      end
    end   
  end
 
  describe '#print' do
    it "should print out the object state" do
      100.downto(7) do |i|
        @queue.queue((1..i).to_a)
      end
      capture(:stdout){ @queue.print }.should_not eql ""
    end
  end
end
