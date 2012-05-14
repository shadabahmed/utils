def powerset(arr)
  if arr.size == 1
    arr = [[],arr]
    return arr
  else
    first = arr[0]
    prev_set = powerset(arr[1..-1])
    power = prev_set.dup
    prev_set.each do |x|
      power << x + [first]
    end
    return power
  end
end

def get_set(set, ele)
  p set
  arr = set.empty? ? (set = [[]]).dup : set.dup
  set.each do |x|
    arr << x + [ele]
  end
  arr
end

def powerset_iter(arr)
  power = []
  arr.each do |x|
    power = get_set(power,x)
  end
  power
end

powerset(['a'])
