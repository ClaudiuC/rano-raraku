package.path = package.path .. ";../../?.lua"

require 'rano-raraku-sdk.util'

try(function()
  throw(DummyException)
end, function(ex) 
  print(ex.code, ex.msg)  
end)