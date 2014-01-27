--[[
  RRException definition - used in all the exception handling methods in RR
]]

local StrictTable = require 'rano-raraku-sdk.collections.RRStrictTable'

StrictTable.RRException {
  code = 0;
  msg = 'Undefined exception';
  __tostring = function(self)
    return "Exception: #"..self.code..": "..self.msg
  end;
}