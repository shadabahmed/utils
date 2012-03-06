def partition(arr, pivot)
  return arr if arr.empty?
  pivot_ele = arr[pivot]
  arr[pivot], arr[-1] = arr[-1], arr[pivot]
  swap_index = 0
  0.upto(arr.size - 1) do |i|
    if arr[i] < pivot_ele
      arr[swap_index], arr[i] = arr[i], arr[swap_index]
      swap_index += 1
    end
  end
  arr[swap_index], arr[- 1] = arr[-1], arr[swap_index]
  [arr, swap_index]
end

def kth_number(arr, k)
  return if arr.empty?
  return arr[0] if arr.size == 1
  pivot = arr.size/2 - 1
  partitioned, pivot_index = partition(arr, pivot)
  p [partitioned, k, pivot_index, partitioned[pivot_index]]
  if k == pivot_index + 1
    return partitioned[pivot_index]
  elsif k <= pivot_index
    return kth_number(partitioned[0..pivot_index], k) 
  else
    return kth_number(partitioned[(pivot_index + 1)..-1], k - pivot_index - 1)
  end
end


