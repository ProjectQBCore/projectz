ESX = nil
playerJob = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	playerJob = xPlayer.job
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) 
	playerJob = job
end)
function getPlayerJob()
	return playerJob
end
function getPlayerInventory()
  inventory = {}
  local Inventory = ESX.GetPlayerData().inventory
  for i=1, #Inventory, 1 do
 		inventory[Inventory[i].name] = {}
 		inventory[Inventory[i].name].amount = Inventory[i].count
  end
  return inventory
end


function drwMarker(x,y,z)
	DrawMarker(27, x, y, z, 0, 0, 0, 0, 0, 0, Config.markerRadius, Config.markerRadius, 0.5001, 95,95,255, 200, 0, 0, 0, 0)
end
function Text3D(x,y,z,txt,alpha)
   local px,py,pz=table.unpack(GetGameplayCamCoords())
   local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
   local fov = (1/GetGameplayCamFov())*100
   SetTextScale(0.55, 0.55)
   SetTextFont(4)
   SetTextProportional(1)
   SetTextColour(250, 250, 250, alpha)
   SetTextDropshadow(1, 1, 1, 1, 255)
   SetTextEdge(2, 0, 0, 0, 150)
   SetTextDropShadow()
   SetTextOutline()
   SetTextEntry("STRING")
   SetTextCentre(1)
   AddTextComponentString(txt)
   SetDrawOrigin(x,y,z, 0)
   DrawText(0.0, 0.0)
   ClearDrawOrigin()
end


-- if you use some kind of "Character Selection" then you need to edit this to work with it.
CreateThread(function() Wait(10000) TriggerServerEvent("sm_crafting:playerJoined") print("sm_crafting_modit load data") end)

