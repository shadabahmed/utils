# Using an array and a singly linked link list for this
# The array contains the normal queue while the linked list contains the history of maximas
# For e.g. if this is inserted [1,2,3,4] then linked list would be only -->4. So when asked 
# for max we give the head of linked list

# If 4,3,2,1 is inserted then -->4-->3-->2--> 1 should be in linked list
# If we see a that element being dequeued is same as the head of linked list we remove the head also

# However there is an optimization done here... for a sequence like 4,3,2,1 we store only the maximum
# if the sequence is decreasing. So our linked list would be just -->4. After 4 is dequeued then list becomes nil
# in that case our maximum is the last element in the queue

# For sequences like 7,6,5,4,1,3 our list becomes -->7-->3. Here we compare the head of linked list and the last element in queue
# to determine which is maximum

# What about sequences of large lengths having values like 1,5,1,5,1,5
# Our linked list will start becoming -->5-->5-->5
# To prevent his repetition we store counts also

class MaxQueue
  Node = Struct.new(:value, :count, :next)
  NegInfinity = -1.0/0.0
  def initialize
    @queue = []
    @max_list = nil
  end

  def queue(num)
    [num].flatten.each{|n| _queue(n)}
  end

  def dequeue
    return nil if @queue.empty?
    first = @queue.shift
    if (@queue.empty? or first > @queue.first) and @max_list and @max_list.value == first
      if @max_list.count > 1
        @max_list.count -= 1
      else
        @max_list = @max_list.next
      end
    end
    first
  end
  
  def print
    p @queue
    node = @max_list
    while node
      super "-->#{node.value}(#{node.count})"
      node = node.next
    end
    puts ""
  end
  
  def max
    return nil if @queue.empty?
    [@max_list && @max_list.value || NegInfinity,@queue[0]].max
  end

  private

  def _queue(num)
    last = @queue.last
    @queue.push(num)
    add_max(num) if last.nil? or last < num
  end

  def add_max(num)
    node = @max_list
    prev = nil
    while node && node.value >= num
      prev = node
      node = node.next
    end
    if node == @max_list
      @max_list = Node.new(num, 1)
    elsif prev.value == num
      prev.count += 1
      prev.next = nil
    else        
      node ||= Node.new(num, 1)
      node.value = num
      node.count = 1
      node.next = nil
      prev.next = node
    end
  end
  
end

