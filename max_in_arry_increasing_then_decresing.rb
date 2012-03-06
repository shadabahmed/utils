def find_peak(arr, left,right)
  if arr[left + 1] > arr[left] && arr[right -1] > arr[right]
    return 0
  elsif arr[left] > arr[left + 1] && arr[right] < arr[right - 1]
    return -1
  else
    return 1
  end
end
=begin
def find_max(arr)
  return -1 if arr.size < 3
  return arr[1]  if arr.size == 3
  size = arr.size
  if find_peak(arr) == 0
    arr = arr [size/4..(-size/4)]
  elsif find_peak(arr) == 1
    arr = arr [size/2..-1]
  else
    arr = arr [0..(-size/2)]
  end
  return find_max(arr)
end
=end
def find_max(arr,left,right)
  p [left,right]
  return -1 if (right - left).abs  < 2
  size = right - left
  peak_position = find_peak(arr,left,right)
  if peak_position == 0
    return arr[left + 1]  if left == right - 2
    left += size/3
    right -= size/3
  elsif peak_position == 1
    left += size/2
    right += size/2
  else
    left -= size/2
    right -= size/2
  end
  right = arr.size - 1 if right > arr.size - 1
  left = 0 if left < 0
  if right - left < 2
    if left > 0
      left -= 1 
    elsif right < arr.size
      right += 1
    end
  end
  return find_max(arr,left,right)
end

p find_max [1,2,3,4,9,8,7,6], 0 , 7

