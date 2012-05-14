def push_all_zeroes(arr)
  index = 0
  0.upto(arr.length - 1) do |i|    
    if arr[i] != 0
      arr[i], arr[index] = arr[index], arr[i]
      index += 1 
    end
  end
  arr
end

p push_all_zeroes([1,2,0,8,0,0,9,0,0,0])
