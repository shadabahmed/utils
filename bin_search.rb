
def bin_search(a, search,start_index, end_index)
   return a[start_index] == search ? start_index : -1 if start_index == end_index
   mid = (start_index + end_index)/2
  p mid
  if(search > a[mid])
    return bin_search(a, search, mid + 1, end_index)
  else
    return bin_search(a, search, start_index, mid)
  end
end

p bin_search((1..1000).to_a, 765, 0, 999)

