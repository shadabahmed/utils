no_of_discs, no_of_pegs = gets.chomp.split(' ').collect{|n| n.to_i}
p  no_of_discs, no_of_pegs

def str_to_config(config_str, no_of_pegs)
   Array.new
   pegs = (1..no_of_pegs).reduce([]){|y,i| y << [];y}
   config_str.split(' ').each_with_index{|k,i| pegs[k.to_i - 1].insert(0,  i + 1) }
    pegs
end

initial_config_str = gets.chomp
final_confit_str = gets.chomp


def frame_stewart(current, final_peg, no_of_pegs)
	empty_peg = current.each_with_index{|peg, index| peg.empty? && peg !=}
end



