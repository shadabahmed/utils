str = readline.chomp

puts 'Entered string'
@count = 0
def permute(str, start_index, end_index)
  puts str if start_index == end_index
  if start_index == end_index - 1
      puts str
      str[start_index],str[end_index] = str[end_index],str[start_index]
      puts str
      str[start_index],str[end_index] = str[end_index],str[start_index]
      @count += 2
  else
    index = start_index
    while index <= end_index
      str[start_index],str[index] = str[index],str[start_index]
      permute(str,start_index + 1, end_index)
      str[start_index],str[index] = str[index],str[start_index]
      index += 1 
    end
  end
end

permute str, 0 , str.size - 1
puts @count
