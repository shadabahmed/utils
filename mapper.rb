#!/usr/bin/ruby

while line = gets
  words = line.split /\s/
  words.each do |word|
    puts "#{word[0,1]}\t#{word.size}"
  end
end
