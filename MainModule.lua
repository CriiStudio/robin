--[[


		ROBIN

	/////////////////////
	
	   Robin MainModule


This module is stored in cloud and is used for
managing the core functions of robin.
Required Things:

ROBIN_SETUP (Anything)
	Host (InstanceValue) -- MUST







]]

local r = {}
local q = {}
local robins = {}
local hosttime
local lasthost

local core = require(QueueModule)
local rs = game:GetService("ReplicatedStorage")

function setup()
	local newrobin = Instance.new("RemoteFunction")
	newrobin.Name = "newRobin"
	newrobin.Parent = rs
	local plrinqueue = Instance.new("RemoteFunction")
	plrinqueue.Name = "plrInQueue"
	plrinqueue.Parent = rs
	end
setup()



function r.newrobin(robin)
	if robin.Name == "ROBIN_SETUP" then
		table.insert(robins, #robins + 1, robin)
		end
	end

function add(plr)
	core.add(plr)
	end

function leave(plr)
	core.remove(plr)
	end
game.Players.PlayerLeaving:connect(leave)

function r.getrobins() -- HIGHLY SUGGESTED to run **SERVER SIDE**, may crash clients **IF IN WORKSPACE**
  local objects = game.Workspace:GetDescendants() -- Might be getchildren, and getdescendants is nil? Don't know. :p
	print("RUNNING ROBIN SCAN, LAG MAY OCCOUR")
  for i = 1, #objects do
    if objects[i].ClassName == "InstanceValue" then -- Might be ObJectValue. I'm on a school chromebook; can't check wiki. :(
      if objects[i].Parent.Name == "ROBIN_SETUP" then
				if core.find(objects[i],"bool") == false then
        				table.insert(robins,#robins + 1,objects[i].Parent)
					objects[i].JoinButton.MouseClick:connect(add)
					objects[i].LeaveButton.MouseClick:connect(leave)
				end
			end
		end
	print("ROBIN SCAN FINISHED.")
	end

function r.update()
	q = core:getqueue()
	if q[1] ~= lasthost then
		hosttime = game.Workspace.DistributedGameTime
		lasthost = q[1]
		end
	for i = 1, #robins do
		robins[i].Host.Value = q[1]
		robins[i].NextHost.Value = q[2]
		robins[i].QueueConcat = table.concat(queue,', ')
		robins[i].HostTimer = game.Workspace.DistributedGameTime - hosttime
		end
	end
	
function r.findpro(queue,object)
	local ret = false
		for 1 = 1, #queue do
			if object == queue[i] then
				ret = true
				end
			end
		return ret
		end

function replacequeue(newqueue)
	q = core:getqueue()
	for i = 1, #q do
		core.remove(q[i]
	
function r.scan()
	q = core:getqueue()
	local scanned = {}
		for i = 1, #queue do
			if r.findpro(scanned,q[i]) then
				else
				table.add(scanned,#scanned + 1,q[i]
					end
				end
			
				
	
	return r


	
