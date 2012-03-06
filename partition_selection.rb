def partition(arr, pivot)
  pivot_ele = arr[pivot]
  arr[pivot], arr[- 1] = arr[-1], arr[pivot]
  swap_index = 0
  0.upto(arr.size - 1).do |i|
    if a[i] < pivot_ele
      a[swap_index],a[i] = a[i],a[swap_index]
      swap_index += 1
    end
  end
  arr[swap_index], arr[- 1] = arr[-1], arr[swap_index]
  arr
end
