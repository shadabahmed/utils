# Question here = http://www.careercup.com/question?id=13252671


def regex_match(reg , str, idx1 , idx2)
  while idx1 < reg.length and idx2 < str.length
    char = reg[idx1]
    idx1 += 1
    if idx1 < reg.length and reg[idx1] == '*'
      char += '*'
      idx1 += 1
    end
    idx2 = terminate(char, str, idx2)
    puts "#{char} #{idx2}"
    break if idx2 == -1
  end
  idx1 == reg.length && idx2 == str.length
end

def terminate(char, str, idx)
  case
  when char.length == 1 && str[idx] == char
    idx + 1
  when char.length == 2
    idx += 1 while char[0] == str[idx] and idx < str.length
    idx
  else
    -1
  end
end

regex_match('ab*c','abbbc',0,0)

