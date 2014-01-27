--[[
 This module contains a bunch of methods which act as constructs I wish Lua had
]]

function instanceof(subject, super)
	super = tostring(super)
	local mt = getmetatable(subject)
 
	while true do
		if mt == nil then return false end
		if tostring(mt) == super then return true end
 
		mt = getmetatable(mt)
	end	
end

function typeof(subject) 
  local mt = getmetatable(subject)
  
  if mt == nil then return type(subject) end
  return toString(mt)
end

function getvar(_name)
  local value, name, found
    
  -- try local variables
  local i = 1
  while true do
    local n, v = debug.getlocal(2, i)
    if not n then break end
    if n == _name then
      value = v
      name = n
      found = true
    end
    i = i + 1
  end
  
  if found then return name, value end
    
  -- try upvalues
  local func = debug.getinfo(2).func
  i = 1
  while true do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    if n == _name then return n, v end
    i = i + 1   
  end
    
  -- not found; get global
  return _name, getfenv(func)[_name]
end

function throw(ex) 
  local name, value = getvar(ex)
  
  if not instanceof(ex, RRException) then
    throw(UnhandledException)
  end
  error(ex)
end

function try(block, catch) 
    local status, ex = pcall(block)
    print(ex)
    if not status then
      catch(ex)
    end
end