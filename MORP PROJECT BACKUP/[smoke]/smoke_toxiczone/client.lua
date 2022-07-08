ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- ===================ESX LOAD==================

local notifIn = false
local notifOut = false
local closestZone = 1

local gasMaskOn = false -- Mask
local poison = false -- poison
local effect = true -- effect loop break

local isRobbing = false -- treasure
local myRobbableItems = {} 

Citizen.CreateThread(function()
	for k,zone in pairs(Config.CircleZones) do
		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #Config.zones, 1 do
			dist = Vdist(Config.zones[i].x, Config.zones[i].y, Config.zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do

		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(Config.zones[closestZone].x, Config.zones[closestZone].y, Config.zones[closestZone].z, x, y, z)
	
		if dist <= Config.Radius then 
			if not notifIn then
				Notif("~c~YOU ~r~ENTERED ~c~A TOXIC ZONE")
				notifIn = true
				notifOut = false
			end
			
			isRobbing = true

			myRobbableItems = Config.robbitems
			TriggerEvent("smoke:toxic")
			Citizen.Wait(1000)
		else
			if not notifOut then

				Notif("~c~YOU ~g~LEFT ~c~A TOXIC ZONE")
				
				isRobbing = false
				notifOut = true
				notifIn = false
				TriggerEvent("smoke:notoxic")
			end
		end
	end
end)


function Notif( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)

	-- create a blip in the middle
	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 0.7)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

RegisterNetEvent("smoke:toxic")
AddEventHandler("smoke:toxic", function()
	if gasMaskOn then
		if effect then
			Notif("~c~YOU ~g~ARE SAFE ~c~IN THE TOXIC ZONE")
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			effect = false
		end
		poison = true
	else
		Notif("~c~YOU HAVE BEEN ~r~POISONED")
		local player = GetPlayerPed(-1)
		local maxHealth = GetEntityMaxHealth(player)
		local health = GetEntityHealth(player)
		local newHealth = health - 15
		SetEntityHealth(player, newHealth)
		Citizen.Wait(1000)
		if not poison then 
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			poison = true
		end
	end
end)

RegisterNetEvent("smoke:notoxic")
AddEventHandler("smoke:notoxic", function()
	if gasMaskOn then 
		if not effect then
			SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
			effect = true
		end
	else 
		Notif("~r~YOU ARE POISONED, YOU NEED AN ANTIDOTE!")
	end
end)

--========================GAS MASK==================

RegisterNetEvent("smoke_gasmask:useItem")
AddEventHandler("smoke_gasmask:useItem", function()
    local animdict = 'mp_masks@on_foot'
    local animname = 'put_on_mask'
    local playerped = PlayerPedId()
    ESX.Streaming.RequestAnimDict(animdict, function()
        TaskPlayAnim(playerped, animdict, animname, 8.0, -8.0, -1, 0, 0, false, false, false)
    end)
    Wait(260)
    if not gasMaskOn then
        TriggerEvent("skinchanger:getSkin", function(skin)
            skin.mask_1 = Config.GasMaskNumber
            skin.mask_2 = 0
            TriggerEvent("skinchanger:loadSkin", skin)
        end)
        gasMaskOn = true
        SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
		TriggerEvent('smoke_gasmask:countdown')
    else
        TriggerEvent("skinchanger:getSkin", function(skin)
            skin.mask_1 = 0
            skin.mask_2 = 0
            TriggerEvent("skinchanger:loadSkin", skin)
        end)
        gasMaskOn = false
		effect = true
        SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
    end
end)

RegisterNetEvent("smoke_ant:useItem1")
AddEventHandler("smoke_ant:useItem1", function()
	if poison then
		SetTimecycleModifier("")
		SetTransitionTimecycleModifier("")
		StopGameplayCamShaking()
		Notif("~c~YOU ARE ~g~SAFE")
		poison = false
	else
		Notif("~c~YOU WASTED AN ~r~ANTIDOT")
	end
end)

RegisterNetEvent('smoke_gasmask:countdown')
AddEventHandler('smoke_gasmask:countdown', function() -- 7 min total

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~g~100% ~c~ZORAX")
	Citizen.Wait(210000) --3.5 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~g~50% ~c~ZORAX")
	Citizen.Wait(105000) --1.75 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~25% ~c~ZORAX")
	Citizen.Wait(63000) --1.5 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~10% ~c~ZORAX")
	Citizen.Wait(21000) --0.35 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~5% ~c~ZORAX")
	Citizen.Wait(4200) --0.07 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~4% ~c~ZORAX")
	Citizen.Wait(4200) --0.07 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~3% ~c~ZORAX")
	Citizen.Wait(4200) --0.07 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~2% ~c~ZORAX")
	Citizen.Wait(4200) --0.07 min

	Notif("~c~YOUR MASK FILTER IS FILLED WITH~r~1% ~c~ZORAX")
	Citizen.Wait(4200) --0.07 min

	Notif("~c~YOUR MASK ZORAX IS~r~EMPTY")
	Notif("~c~YOUR MASK IS EMPTY~r~REMOVING MASK!")

	TriggerEvent("smoke_gasmask:useItem")
end)

--=========================================TREASURES===============================

Citizen.CreateThread(function()
	while true do
  		Citizen.Wait(5)

  		if isRobbing then
   			for i=1,#myRobbableItems do
    			if (GetDistanceBetweenCoords(myRobbableItems[i]["x"], myRobbableItems[i]["y"], myRobbableItems[i]["z"], GetEntityCoords(GetPlayerPed(-1))) < 1.4) and not myRobbableItems[i]['isSearched'] then
     				DrawText3Ds(myRobbableItems[i]["x"], myRobbableItems[i]["y"], myRobbableItems[i]["z"], '~w~Press E To Search ' .. myRobbableItems[i]["name"])

     				if IsControlJustReleased(1, 54) then
      					myRobbableItems[i]['isSearched'] = true
      
   	  					--loadAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')

   	  					--TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
   	  					-- upto here
							
						TriggerServerEvent('SmokeTreasure:searchItem')      
     				end
    			end
 	 		end
  		end
 	end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end