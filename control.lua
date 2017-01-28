
--[[ Main file for reactor control --]]

local filesystem = require("filesystem")
local component = require("component")
local keyboard = require("keyboard")
local event = require("event")

local reactor = component.br_reactor

-- Check if connected to reactor computer control
if (reactor)
  then
    print("Successful connection to reactor")
  else
    print("Error: Computer not connected to Reactor Computer Port")
end

-- Check if reactor is a valid configuration
if (reactor.getConnected())
  then
    print("Reactor is Valid")
  else
    print("Reactor structure is invalid")
end

-- Intialize reactor stats table
reactor["stats"] = {}
reactor.stats["state"] = false
reactor.stats["fuelCurrent"] = 0
reactor.stats["fuelMax"] = 0
reactor.stats["wasteCurrent"] = 0
reactor.stats["energyStored"] = 0
reactor.stats["energyTick"] = 0
reactor.stats["controlRodLevel"] = 0


-- Pull and store reactor info
function pullReactorInfo(reactor)
  reactor.stats.state = reactor.getActive()
  reactor.stats.fuelCurrent = reactor.getFuelAmount()
  reactor.stats.fuelMax = reactor.getFuelAmountMax()
  reactor.stats.wasteCurrent = reactor.getWasteAmount()
  reactor.stats.energyStored = reactor.getEnergyStored()
  reactor.stats.energyTick = reactor.getEnergyProducedLastTick()
  reactor.stats.controlRodLevel = reactor.getControlRodLevel(1)
end

pullReactorInfo(reactor)

while(reactor.stats.state)
do


end
