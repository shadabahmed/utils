# Given a string and set of characters, find the shortest substring which contains all the characters in the string.

require 'set'



def shortest_substr(str, set)
  has_found = Hash.new(set.map{|i| [i,0]})
  need_to_find = {}
  set.each do |i|
    need_to_find[i] ||= 0
    need_to_find[i] += 1
    
  end
  count = 0
  start_index = -1
  end_index = -1
  current_index = 0
  
  str.each_with_index |c , index|
    if set.include?(c)
      has_found[c] += 1
      start_index = index if start_index == -1
      count += 1 if has_found[c] == need_to_find[c]
      if count = 0
        end_index == index if end_index == -1
      end
    end
  end
end


set = Set.new(['a','b','c'])

str = 'shadabs cat'

def increment(arr)
  return arr if arr.empty? or arr.nil?
  inc = arr[0] > 0
  arr[-1] += inc ? 1 : -1
  carry = arr[-1] > 0 ? (arr[-1]) / 10 : -1
  arr[-1] = (arr[-1]) % 10
  if arr.size > 1
    (arr.size - 2).downto(0) |i|
      a[i] += carry
      carry = a[i] > 0 ? a[i] / 10 : -1
      a[i] = a[i] % 10
    end
  end
  carry > 0 ? [carry] + arr : arr
  
  a[0] *= -1 if not inc
end



def increment(arr)
  return arr if arr.empty? or arr.nil?
  inc = arr[0] > 0
  arr[0] *= -1 unless inc
  carry = inc ? 1 : -1
  (arr.size - 1).downto(0) do |i|
    arr[i] += carry
    carry = arr[i] > 0 ? arr[i]/10 : -1
    arr[i] = arr[i] % 10
  end
  p carry
  arr = carry > 0 ? [carry] + arr : arr
  arr.shift if arr[0] == 0
  arr[0] *= -1 unless inc
  arr
end
increment [9,9,9]
[[2,7,9,0],[-2,7,9,0],[1,0,0,0],[9,9,9],[9,9,8],[-9,9,9],[-1,0,0,0],[-1,0,0,1],[0],[-1]].each {|x| p increment x}
