

local q = {}
local robins = {}

local core = require(QueueModule)
local rs = game:GetService("ReplicatedStorage")

function setup()
	local newrobin = Instance.new("RemoteFunction")
	newrobin.Name = "newRobin"
	newrobin.Parent = rs
	end

function getrobins() -- HIGHLY SUGGESTED to run **SERVER SIDE**, may crash clients **IF IN WORKSPACE**
  local objects = game.Workspace:GetDescendants() -- Might be getchildren, and getdescendants is nil? Don't know. :p
	print("RUNNING ROBIN SCAN, LAG MAY OCCOUR")
  for i = 1, #objects do
    if objects[i].ClassName == "InstanceValue" then -- Might be ObJectValue. I'm on a school chromebook; can't check wiki. :(
      if objects[i].Parent.Name == "ROBIN_SETUP" then
        table.insert(robins,#robins + 1,objects[i].Parent)
				end
			end
		end
	print("ROBIN SCAN FINISHED.")
	end

function newrobin(robin)
	if robin.Name == "ROBIN_SETUP" then
		table.insert(robins, #robins + 1, robin)
		end
	end

	
