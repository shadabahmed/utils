def compress(a,i,j)
  a[i,j] = []
end

def count_chars(a)
lastCount = 1
lastChar = a[0]
currentSize = a.size
index = 1
while(index <= currentSize)
  currentChar = a[index]
  if(lastChar != currentChar)
    a[index - lastCount + 1] = lastCount.to_s
    if lastCount > 2
      a[index - lastCount + 2, lastCount - 2] = ''
      currentSize -= lastCount - 2
      index -= lastCount  - 2 
    end
    lastCount = 1
    lastChar = currentChar
  else
    lastCount += 1
  end
  index += 1
end
p a
end

count_chars 'aaaaaaaabbbbbbbbbcccc'
