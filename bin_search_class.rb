class BstSearch
  def initialize(arr)
    @arr = arr.sort
  end

  def search(number)
    bin_search(0,@arr.size - 1, number)
  end

  def bin_search(first,last,number)
    if first == last
      return [@arr[first], first]
    else
      mid_index = (first + last)/2
      mid = @arr[mid_index]
      if mid == number
        return [mid,mid_index]
      elsif mid > number
        return bin_search(first, mid_index - 1, number)
      else
        return bin_search(mid_index + 1, last, number)
      end
    end
  end
  
end
