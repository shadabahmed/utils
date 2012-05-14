class Heap
  # Speciufy whether max heap or min heap
  def initialize(p, max_heap = true)
    @arr = Array.new p
    @max_heap = max_heap
    build
  end

  def size
    @arr.size
  end

  def insert(num)
    @arr << num
    heapify_up(@arr.size - 1)
  end

  def remove(num)
    index = @arr.index(num)
    return unless index
    @arr[index],@arr[@arr.size - 1] = @arr[@arr.size - 1],@arr[index]
    num = @arr.pop
    heapify_down(index) if index < (@arr.size)/2
    num
  end
  
  def sort
    copy = Array.new @arr
    sorted = []
    until @arr.empty?
      @arr[0],@arr[@arr.size - 1] = @arr[@arr.size - 1],@arr[0]
      sorted << @arr.pop
      heapify_down(0)
    end
    @arr = copy
    sorted
  end
  
  def print
    p @arr
  end  

  private

  def parent(i)
    i/2 - 1
  end
  
  def left(i)
    2*i + 1
  end
  
  def right(i)
    2*i + 2
  end

  def build
    (@arr.size/2 -1).downto(0){|i| heapify_down(i);}
  end

  def max
    @arr[0]
  end
  
  def heapify_down(i)
    return unless i < @arr.size
    priority_index = [i , left(i), right(i)].reduce(i){|last_index,x| last_index = x if @arr[x] && (@max_heap ? @arr[last_index] < @arr[x] : @arr[last_index] > @arr[x]);last_index}
    if i != priority_index
      @arr[i], @arr[priority_index] = @arr[priority_index], @arr[i]
      heapify_down(priority_index)
    end
  end

  def heapify_up(i) 
    parent_index = parent(i)
    while i > 0 and (@max_heap ? @arr[i] > @arr[parent_index] : @arr[i] < @arr[parent_index])
      @arr[i],@arr[parent_index] = @arr[parent_index],@arr[i]
      i = parent_index
    end
  end

end
