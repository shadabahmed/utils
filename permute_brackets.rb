def permute_brackets(n)
  list = []
  if n == 1
    list += [['()']]
  elsif n > 1
    permute_brackets(n-1).each do |i|
      list << ['()'] + i
      list <<  i + ['()'] unless i[0] == '()' and i[-1] == '()'
      list << ['('] + i + [')']
    end
  end
  list
end

z = permute_brackets(ARGV[0].to_i)
z.each do |x|
  puts x.join
end
