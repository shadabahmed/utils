a = [];
def par(open,close,n,idx, a, final)
  if(close == n)
    return a
  end

  if(close<open)
    a[idx]=")"
    final << par(open,close+1,n,idx+1,a,final)
  end

  if(open<n)
   a[idx]="(";
   final << par(open+1,close,n,idx+1,a,final)
  end
  final
end


def permute_brackets(n)
  list = []
  if n == 1
    list += [['(',')']]
  elsif n > 1
    last_permute = permute_brackets(n-1)
    last_permute.each do |i|
      sum = 0

      0.upto(i.size) do |idx|
        z = i[idx]
        
        sum += (z == '(' ? 1 : -1)
        if sum == 0
          part1 = i[0...idx]
          part2 = i[idx..-1]
          list << part1 + ['(',')'] + part2 unless part2.empty?
          list << part1 + ['('] + part2 + [')'] unless part2.empty?
          list << part1 + part2 + ['(',')'] unless part2.empty? or part2.size >= 2 and part2[0] == '(' and part2[1] == ')' or part2[-1] == ')' and part2[-2] == '('
        end
      end
    end
  end
  list
end

z = permute_brackets(ARGV[0].to_i)
z.each do |x|
  puts x.join
end
#final = []
#par 0,0,ARGV[0].to_i,0,a, final
#p final
#z.each{|x| puts x.join}
