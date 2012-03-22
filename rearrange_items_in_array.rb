def rearrange(arr, index1, index2)
  if index1 + 1 == index2
    arr[index1 ], arr[index2] = arr[index2], arr[index1]
  elsif index1 + 3 == index2
    arr[index1 + 1], arr[index1 + 2] = arr[index1 + 2], arr[index1 + 1]
    return
  else
    mid = (index2 + index1)/2 + 1
    i = index1 + mid/2
    index = 0
    p [index , mid]
    i.upto(mid - 1) do |i|
      p [arr[i],arr[index + mid]]      
      arr[i],arr[index + mid] = arr[index + mid],arr[i]
      index += 1
    end
   p arr
   rearrange(arr,index1 , mid - 1)
   rearrange(arr, mid, index2)
  end
end


a = []

(1..5).each {|i| a << 'a' + i.to_s}
(1..5).each {|i| a << 'b' + i.to_s}

rearrange(a,0,a.size - 1)

p a
