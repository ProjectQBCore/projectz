ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Lokace = {
    { x = -45.05, y = -1117.33, z = 26.43 },
}

Citizen.CreateThread(function()
	Citizen.Wait(5000)
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 288) then	        		
		    SetNuiFocus(true, true)
		    SetNuiFocusKeepInput(false)
		    SendNUIMessage({
		        action = "showLeaderboard",
		    })
		end

    	local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        for _,v in pairs(Lokace) do
	        local distance = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)

	        if distance < 100.0 then
	            DrawMarker(21, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.3, -0.5, 0, 255, 0, 100, true, false, 2, true, false, false, false)
	        end

	        if distance < 1.3 then
	        	ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to open leaderboard')
	        	if IsControlJustReleased(0, 38) then	        		
				    SetNuiFocus(true, true)
				    SetNuiFocusKeepInput(false)
				    SendNUIMessage({
				        action = "showLeaderboard",
				    })
				end
	        end
	    end

		if IsEntityDead(PlayerPedId()) then
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = DeathCauseHash

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if Killer == PlayerId() then
				DeathReason = 'suicide'
			elseif Killer == nil then
				DeathReason = 'death_random'
			else
				DeathReason = 'kill'
			end
			
			if DeathReason == 'suicide' or DeathReason == 'death_random' then
				TriggerServerEvent('kill_log:playerDied', 1, GetPlayerName(PlayerId()), GetPlayerServerId(PlayerId()), DeathReason, 0, 0, Weapon)
			else
				TriggerServerEvent("morp_leaderboard:onKillS", GetPlayerServerId(Killer))
				TriggerServerEvent('kill_log:playerDied', 0, GetPlayerName(Killer), GetPlayerServerId(Killer), DeathReason, GetPlayerName(PlayerId()), GetPlayerServerId(PlayerId()), Weapon)
			end

			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		end
		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(10)
		end
	end
end)

RegisterNetEvent("morp_leaderboard:onKillC")
AddEventHandler("morp_leaderboard:onKillC", function()

	exports.esx_xp:ESXP_Add(200)

end)

------------------------here------------------------

RegisterNetEvent('leaderboard:data')
AddEventHandler('leaderboard:data', function(data, data_master, data_kills, data_kda, data_deaths, data_playtime, connectedPlayers)
	local json_data = json.encode(data)	
	local json_data_master = json.encode(data_master)	
	local json_data_kills = json.encode(data_kills)	
	local json_data_deaths = json.encode(data_deaths)
	local json_data_kdas = json.encode(data_kda)
	local json_data_playtimes = json.encode(data_playtime)

	for k,v in pairs(connectedPlayers) do
		if k == GetPlayerServerId(PlayerId()) then
			own_steam = v
		end
	end
	
    SendNUIMessage({
        action = "updateLeaderboard",
        j_data = json_data,
        j_data_master = json_data_master,
        j_data_kills = json_data_kills,
        j_data_deaths = json_data_deaths,
        j_data_kdas = json_data_kdas,
        j_data_playtimes = json_data_playtimes,
        j_data_own_steam = own_steam
    })
end)

RegisterNetEvent('leaderboard:crewdata')
AddEventHandler('leaderboard:crewdata', function(crewdata, leaderboard_crew_master, leaderboard_crew_kills, leaderboard_crew_members)
	local json_crewdata = json.encode(crewdata)	
	local json_crew_master = json.encode(leaderboard_crew_master)	
	local json_crew_kills = json.encode(leaderboard_crew_kills)
	local json_crew_members = json.encode(leaderboard_crew_members)

    SendNUIMessage({
        action = "updateCrewLeaderboard",
        j_crewdata = json_crewdata,
        j_crew_master = json_crew_master,
        j_crew_kills = json_crew_kills,
		j_crew_members = json_crew_members
    })

end)

RegisterCommand('statsclose', function(source, args)
	closekda()
end)

RegisterNUICallback("kdaclose", function()
	closekda()
end)

RegisterNUICallback('open_roulette', function(data, cb)
	ExecuteCommand('credits')
	cb('ok')
end)

closekda = function()
	SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    SendNUIMessage({
        action = "hideLeaderboard",
    })
end