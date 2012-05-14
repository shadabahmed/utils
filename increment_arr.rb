def incr_arr(arr)
  return if arr.empty?
  rarr = []
  neg = arr[0] < 0
  carry = arr[0] < 0 ? (arr[0] *= -1;-1) : 1
  carry = arr.reverse.reduce(carry){|carry,i| sum = i + carry;rarr.unshift(sum % 10);(sum >= 0 ? sum/10 : -1) }
  rarr.unshift(carry) if carry > 0
  rarr.shift if rarr[0] == 0
  neg ? (rarr[0] *= -1;rarr) : rarr
end

p incr_arr([-1,0,0])
