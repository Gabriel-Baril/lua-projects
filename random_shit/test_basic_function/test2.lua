
function comparaison(nb_1,nb_2)
  return (nb_1 > nb_2)
end

local x = comparaison(5,3)

local maTable = {1,5,8,3,0,2,6,7,9,4}

print(table.concat(maTable))
print(unpack(maTable))

table.sort(maTable)

print(table.concat(maTable))
print(unpack(maTable))

print(x)