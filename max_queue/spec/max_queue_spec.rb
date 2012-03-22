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
end
