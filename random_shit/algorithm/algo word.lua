
word = "test"

for i = 1, string.len(word), 1 do
  print(string.sub(word,i,i)..string.sub(word,i+1,i+1)..string.sub(word,i+2,i+2)..string.sub(word,i+3,i+3))
  print(string.sub(word,i,i)..string.sub(word,i+1,i+1)..string.sub(word,i+3,i+3)..string.sub(word,i+2,i+2))
  print(string.sub(word,i,i)..string.sub(word,i+2,i+2)..string.sub(word,i+3,i+3)..string.sub(word,i+1,i+1))
  print(string.sub(word,i,i)..string.sub(word,i+2,i+2)..string.sub(word,i+1,i+1)..string.sub(word,i+3,i+3))
  print(string.sub(word,i,i)..string.sub(word,i+3,i+3)..string.sub(word,i+1,i+1)..string.sub(word,i+2,i+2))
  print(string.sub(word,i,i)..string.sub(word,i+3,i+3)..string.sub(word,i+2,i+2)..string.sub(word,i+1,i+1))
  
  print(string.rep(word,3,"-"))
end


