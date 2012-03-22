matricesrep = [10,30,5, 60]

matrices = []
0.upto(matricesrep.length - 2) do |i|
  #puts "#{i+1} Matrix is : #{matricesrep[i]}x#{matricesrep[i+1]}"
  matrices << [matricesrep[i], matricesrep[i+1]]
end

p matrices

def mat_count(start_index,end_index)
  return end_index - start_index
end

@prev_results = {}
@optimal_sol = ''

def find_cost_mem(matrices)
  return @prev_results[matrices] if @prev_results.has_key? matrices
  min_sum = 1/0.0
  min_sum_row = min_sum_col = nil
  if matrices.length > 1
    0.upto(matrices.length - 2) do |i|
      part1_sum, part1_row, part1_col = find_cost_mem(matrices[0..i])
      part2_sum, part2_row, part2_col = find_cost_mem(matrices[i+1..-1])
      cur_sum = part1_sum + part2_sum + part1_row*part2_row*part2_col
      if cur_sum < min_sum
        min_sum = cur_sum
        min_sum_row = part1_row
        min_sum_col = part2_col
      end
    end
  elsif matrices.length == 1
    min_sum= 0 
    min_sum_row = matrices[0][0]
    min_sum_col = matrices[0][1]    
  end
  @prev_results[matrices] = [min_sum, min_sum_row, min_sum_col]
  return [min_sum, min_sum_row, min_sum_col]
end


def find_cost(matrices)
  #return @prev_results[matrices] if @prev_results.has_key? matrices
  min_sum = 1/0.0
  min_sum_row = min_sum_col = nil
  rep = ''
  if matrices.length > 1
    0.upto(matrices.length - 2) do |i|
      part1 = matrices[0..i]
      part2 = matrices[i+1..-1]
      part1_sum, part1_row, part1_col, part1_rep = find_cost(part1)
      part2_sum, part2_row, part2_col, part2_rep = find_cost(part2)
      cur_sum = part1_sum + part2_sum + part1_row*part2_row*part2_col
      if cur_sum < min_sum
        min_sum = cur_sum
        min_sum_row = part1_row
        min_sum_col = part2_col
        rep = "(#{part1_rep})x(#{part2_rep})"
      end
    end
  elsif matrices.length == 1
    min_sum= 0 
    min_sum_row = matrices[0][0]
    min_sum_col = matrices[0][1]
    rep = "#{min_sum_row}x#{min_sum_col}"
  end
  return [min_sum, min_sum_row, min_sum_col, rep]
end
=begin
start_time = Time.now
1.times do
  find_cost_mem matrices
  @prev_results = {}
end
end_time = Time.now
p end_time - start_time


start_time = Time.now
1.times do
  
  @prev_results = {}
end
end_time = Time.now
p end_time - start_time

p @optimal_sol
=end
puts find_cost_mem(matrices)[3]
puts @prev_results
#p find_cost matrices
