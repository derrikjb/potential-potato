
--[[ Main file for reactor control*/ --]]

local filesystem = require("filesystem")
local component = require("component")
local keyboard = require("keyboard")
local event = require("event")

local reactor = isReactor()

if (reactor)
  then
    print("Error: Computer not connected to Reactor Computer Port")
  else
    print("Successful connection to reactor")
end



-- Check if a reactor is present
function isReactor()
  return component.br_reactor
end
