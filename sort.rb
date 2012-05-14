#numbers = gets.chomp.split(' ').collect &:to_i
#p numbers

def insert_sort(numbers)
	1.upto(numbers.length - 1 ) {|i|
         key = numbers[i]
         j = i - 1
        while j >= 0 && numbers[j] > key
                numbers[j+1] = numbers[j]
		j -= 1
        end         
	numbers[j + 1] = key
        p numbers
	}
end

def merge_sort(numbers, start_index, end_index)
  if start_index < end_index
	  mid = (start_index + end_index)/2
     merge_sort(start_index, mid)
     merge_sort(mid+1,end_index)
     merge(numbers,start_index,mid,end_index)
  end
end

def merge(numbers, start_index,mid,end_index)
  nums = []
  l_index,r_index = start_index, mid + 1
  while l_index <= mid and r_index <= end_index
    p [nums, r_index, l_index]
  	if numbers[l_index] < numbers[r_index]
	     nums <<  numbers[l_index]
	     l_index += 1
  	else
  	   nums <<  numbers[r_index]
	     r_index += 1
  	end
 end
 while r_index <= end_index
   nums <<  numbers[r_index]
   r_index += 1
 end 
 while l_index <= mid
   nums << numbers[l_index]
   l_index += 1
 end
 numbers[start_index,end_index - start_index + 1] = nums 
end

def partition(a,left,right,pivot)
  a[right],a[pivot] = a[pivot],a[right]
  p a
  pivot_ele = a[right]
  index = left
  left.upto(right) do |i|
    if a[i] < pivot_ele
      a[index],a[i] = a[i],a[index]
      index += 1
    end
    p a
  end
  a[index],a[right] = a[right],a[index]
  p a
end

def count_sort(a)
  b,c = [0]*a.size,[0]*a.size
  a.each{|ele| b[ele] += 1}
  1.upto(a.size){|i| b[a[i]] = b[a[i]] + b[a[i-1]]}
  a.size.downto(0){|i| c[b[a[i]]] = a[i];b[a[i]] -= 1}
  c
end

x = [5,4,3,2, 1,3,7,8]
merge_sort(x, 0, 7)
p x
#insert_sort numbers
#p numbers


