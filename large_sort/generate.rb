File.open('numbers.txt','w') do |f|

  1000000.downto(1) do |i|
    f.puts(i)
  end
end
