
-- Les tables t1 et t2            
t1 = {25}
t2 = {18}
    
mt = {}    -- Construction de la table qui servira de métatable.
    
-- Définition de l'opération addition.
mt.__add = function(a, b)
  return{valeur = a[1] + b[1]}
end
    
setmetatable(t1, mt)    -- Association de mt à t1.

print(unpack(t1 + t2))
