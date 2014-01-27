--[[
  A list of Exceptions used in RR
]]

-- Used for _.throw()
UnhandledException = 
  RRException {
    code = 1,
    msg="Error throwing Exception (RRException enforced)"
  }

-- Used in samples
DummyException =
  RRException {
    code = 42,
    msg="The quick brown fox jumps over the lazy dog"
  }