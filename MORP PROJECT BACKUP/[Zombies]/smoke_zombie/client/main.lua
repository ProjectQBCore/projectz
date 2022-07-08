ESX = nil
local detect = true
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while not ESXP do
        TriggerEvent("esx_xp:isReady", function(ready)
            ESXP = ready
        end)
        Citizen.Wait(10)
    end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

local Models = {
	"executioner",
	"copZ",
	"DocZ",
	"HcopZ",
	"ParaZ",
	"RIOTZ",
	"zombie",
	"Zombie2",
	"Zombie5",
	"Hulk",
	"vampmonster",
	"VAMPIRE",
	"supermutant"
}

local walks = {
	"move_m@drunk@verydrunk",
	"move_m@drunk@moderatedrunk",
	"move_m@drunk@a",
	"anim_group_move_ballistic",
	"move_lester_CaneUp",
}

players = {}

RegisterNetEvent("smoke_zombie:playerupdate")
AddEventHandler("smoke_zombie:playerupdate", function(mPlayers)
	players = mPlayers
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

entitys = {}

TriggerServerEvent("RegisterNewZombie")
TriggerServerEvent("smoke_zombie:newplayer", PlayerId())

RegisterNetEvent("ZombieSync")
AddEventHandler("ZombieSync", function()

	AddRelationshipGroup("zombie")
	SetRelationshipBetweenGroups(0, GetHashKey("zombie"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(2, GetHashKey("PLAYER"), GetHashKey("zombie"))

	while true do
		Citizen.Wait(1)

		local xPlayer = ESX.GetPlayerData()
		local rank = exports.esx_xp:ESXP_GetRank()
		
		while rank == nil do
			rank = exports.esx_xp:ESXP_GetRank()
			Wait(1000)
		end

		local mult = 5 * rank
		local zombie = Config.SpawnZombie + mult

		if #entitys == zombie then
			Citizen.Wait(10000)
		end

		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(Config.zones[closestZone].x, Config.zones[closestZone].y, Config.zones[closestZone].z, x, y, z)

		if #entitys < zombie and dist >= 200.0 then


			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		    
			EntityModel = Models[math.random(1, #Models)]
			EntityModel = string.upper(EntityModel)
			RequestModel(GetHashKey(EntityModel))
			while not HasModelLoaded(GetHashKey(EntityModel)) or not HasCollisionForModelLoaded(GetHashKey(EntityModel)) do
				Wait(1)
			end
			
			local posX = x
			local posY = y
			local posZ = z + 999.0

			repeat
				Wait(1)

				posX = x + math.random(-Config.MaxSpawnDistance, Config.MaxSpawnDistance)
				posY = y + math.random(-Config.MaxSpawnDistance, Config.MaxSpawnDistance)

				_,posZ = GetGroundZFor_3dCoord(posX+.0,posY+.0,z,1)

				for _, player in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if posX > playerX - Config.MinSpawnDistance and posX < playerX + Config.MinSpawnDistance or posY > playerY - Config.MinSpawnDistance and posY < playerY + Config.MinSpawnDistance then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
			until canSpawn
			entity = CreatePed(4, GetHashKey(EntityModel), posX, posY, posZ, 0.0, true, false)

			walk = walks[math.random(1, #walks)]
						
			RequestAnimSet(walk)
			while not HasAnimSetLoaded(walk) do
				Citizen.Wait(1)
			end
			--TaskGoToEntity(entity, GetPlayerPed(-1), -1, 0.0, 1.0, 1073741824, 0)
			SetPedMaxHealth(entity, 50000)
			SetEntityHealth(entity, 50000)
			SetPedPathCanUseClimbovers(entity, true)
			SetPedPathCanUseLadders(entity, true)
			SetPedHearingRange(entity, 35)
			SetPedMovementClipset(entity, walk, 1.0)
			TaskWanderStandard(entity, 1.0, 10)
			SetCanAttackFriendly(entity, true, true)
			SetPedCanEvasiveDive(entity, false)
			SetPedRelationshipGroupHash(entity, GetHashKey("zombie"))
			SetPedCombatAbility(entity, 0)
			SetPedCombatRange(entity,0)
			SetPedCombatMovement(entity, 0)
			SetPedAlertness(entity,0)
			SetPedIsDrunk(entity, false)
			SetPedConfigFlag(entity,100,1)
			ApplyPedDamagePack(entity,"BigHitByVehicle", 0.0, 9.0)
			ApplyPedDamagePack(entity,"SCR_Dumpster", 0.0, 9.0)
			ApplyPedDamagePack(entity,"SCR_Torture", 0.0, 9.0)
			DisablePedPainAudio(entity, true)
			SetPedRandomProps(entity)
			StopPedSpeaking(entity,true)
			SetEntityAsMissionEntity(entity, true, true)
			SetAiMeleeWeaponDamageModifier(0.9)
			SetPedSuffersCriticalHits(entity, false)


			if not NetworkGetEntityIsNetworked(entity) then
				NetworkRegisterEntityAsNetworked(entity)
			end

			table.insert(entitys, entity)
			--Citizen.Trace("Zombie Spawned\n")
		end	

		for i, entity in pairs(entitys) do
			if not DoesEntityExist(entity) then
				SetEntityAsNoLongerNeeded(entity)
				table.remove(entitys, i)
			else
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				local pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, true))	
					
				if pedX < playerX - Config.DespawnDistance or pedX > playerX + Config.DespawnDistance or pedY < playerY - Config.DespawnDistance or pedY > playerY + Config.DespawnDistance then
					local model = GetEntityModel(entity)
					SetEntityAsNoLongerNeeded(entity)
					SetModelAsNoLongerNeeded(model)
					--Citizen.Trace("Zombie Eliminated\n")
					table.remove(entitys, i)
				end
			end
				
			if IsEntityInWater(entity) then
				local model = GetEntityModel(entity)
				SetEntityAsNoLongerNeeded(entity)
				SetModelAsNoLongerNeeded(model)
				DeleteEntity(entity)
				table.remove(entitys,i)
				--Citizen.Trace("Zombie Eliminated from Water\n")
			end
		end
	end
end)

--Zombie sounds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(8000)
        for i, entity in pairs(entitys) do
	       	playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, true))
			if IsPedDeadOrDying(entity, 1) == 1 then
				--none :v
			else
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) <= 10.0 ) then
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, "groan3", 1.0)
				end
			end
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		TriggerEvent('smoke:settaskk')

		--[[
		for i, entity in pairs(entitys) do
			for j, player in pairs(players) do
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
				local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(player)), GetEntityCoords(entity), true)
				if distance <= 50.0 then
					--TaskGoStraightToCoord(entity, playerX, playerY, playerZ, 1.0, -1, 0,0)
					--TaskGoToEntity(entity, GetPlayerPed(player), -1, 0.0, 90.0, 1073741824, 0)
					TriggerEvent('smoke:settaskk')
				end
			end
		end
		]]

	end
end)

RegisterNetEvent('smoke:blood')
AddEventHandler('smoke:blood', function()
	detect = false
end)

RegisterNetEvent('smoke:settask')
AddEventHandler('smoke:settask', function()
	if detect then
		TaskGoToEntity(entity, playerPed, -1, 0.0, 500.0, 1073741824, 0)
	end
end)

RegisterNetEvent('smoke:settaskk')
AddEventHandler('smoke:settaskk', function()
	if detect then
		for i, entity in pairs(entitys) do
			for j, player in pairs(players) do
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
				local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(player)), GetEntityCoords(entity), true)
				if distance <= 50.0 then
					--TaskGoStraightToCoord(entity, playerX, playerY, playerZ, 1.0, -1, 0,0)
					TaskGoToEntity(entity, GetPlayerPed(player), -1, 0.0, 500.0, 1073741824, 0)
				end
			end
		end
	end
end)

RegisterNetEvent('smoke:redhealth')
AddEventHandler('smoke:redhealth', function()
	if detect then
		local playerPed = GetPlayerPed(-1)
		local maxHealth = GetEntityMaxHealth(playerPed)
		local health = GetEntityHealth(playerPed)
		local newHealth = health - 50
		SetEntityHealth(playerPed, newHealth)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for i, entity in pairs(entitys) do
	       	playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, true))
			if IsPedDeadOrDying(entity, 1) == 1 then
				--none :v
			else
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 1) then --0.6
					if IsPedRagdoll(entity, 1) ~= 1 then
						if not IsPedGettingUp(entity) then
							--RequestAnimDict("misscarsteal4@actor")
							--TaskPlayAnim(entity,"misscarsteal4@actor","stumble",1.0, 1.0, 500, 9, 1.0, 0, 0, 0)

							RequestAnimDict("melee@unarmed@streamed_variations")
							TaskPlayAnim(entity, "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 1.0, 1.0, 700, 9, 1.0, 0, 0, 0)

							ApplyForceToEntity(PlayerPedId(), 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
							Wait(1000)
							SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0) 
							
							TriggerEvent('smoke:redhealth')

							--local playerPed = GetPlayerPed(-1)
							--local maxHealth = GetEntityMaxHealth(playerPed)
							--local health = GetEntityHealth(playerPed)
							--local newHealth = health - 35
							--SetEntityHealth(playerPed, newHealth)

							Wait(2000)

							TriggerEvent('smoke:settask')
							--TaskGoToEntity(entity, playerPed, -1, 0.0, 90.0, 1073741824, 0)
							
							--TaskGoStraightToCoord(entity, playerX, playerY, playerZ, 1.0, 0, 0,0)
						end
					end
				end
			end
		end
	end
end)

if Config.NotHealthRecharge then
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end

if Config.MuteAmbience then
	StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
end



Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		RestorePlayerStamina(PlayerId(), 0.0)

		SetPlayerMeleeWeaponDamageModifier(PlayerId(), 0.9)
		SetPlayerMeleeWeaponDefenseModifier(PlayerId(), 0.0)
		SetPlayerWeaponDamageModifier(PlayerId(), 0.4)
		SetPlayerTargetingMode(2)

	end
end)


if Config.ZombieDropLoot then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			for i, entity in pairs(entitys) do
				playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, true))
				if DoesEntityExist(entity) == false then
					table.remove(entitys, i)
				end
				if IsPedDeadOrDying(entity, 1) == 1 then
					if GetPedSourceOfDeath(entity) == PlayerPedId() then
						playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
						pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, true))	
						if not IsPedInAnyVehicle(PlayerPedId(), false) then
							if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 1.5) then
								ESX.Game.Utils.DrawText3D({x = pedX, y = pedY, z = pedZ + 0.2}, '~c~PRESS ~b~[E]~c~ TO SEARCH', 0.8, 4)
								if IsControlJustReleased(1, 51) then
									if DoesEntityExist(GetPlayerPed(-1)) then
										
										RequestAnimDict("random@domestic")
										while not HasAnimDictLoaded("random@domestic") do
											Citizen.Wait(1)
										end
										TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 8.0, -8, 2000, 2, 0, 0, 0, 0)
										
										exports.esx_xp:ESXP_Add(50)
								
										--TriggerEvent('BattlePass:AddXP', 50)
										
										Citizen.Wait(10)

										--[[
										randomChance = math.random(1, 100)
										randomWeapon = Config.WeaponLoot[math.random(1, #Config.WeaponLoot)]
										randomItem = Config.ItemLoot[math.random(1, #Config.ItemLoot)]

										if randomChance > 0 and randomChance < Config.ProbabilityWeaponLoot then
											local randomAmmo = math.random(1, 30)
											GiveWeaponToPed(PlayerPedId(), randomWeapon, randomAmmo, true, false)
											ESX.ShowNotification('You found ' .. randomWeapon)
										elseif randomChance >= Config.ProbabilityWeaponLoot and randomChance < Config.ProbabilityMoneyLoot then
											TriggerServerEvent('smoke_zombie:moneyloot')
										elseif randomChance >= Config.ProbabilityMoneyLoot and randomChance < Config.ProbabilityItemLoot then
											TriggerServerEvent('smoke_zombie:itemloot', randomItem)
										elseif randomChance >= Config.ProbabilityItemLoot and randomChance < 100 then
											ESX.ShowNotification('You not found nothing')
										end
										]]

										local xPlayer = ESX.GetPlayerData()
										local rank = exports.esx_xp:ESXP_GetRank()
										randomChance = math.random(2, 99)
										
										--local pedmodel = GetHashKey('BF4UsSupport')
										--[[print(pedmodel)
										print(GetPlayerName(PlayerId()))
										print(GetPlayerServerId(PlayerId()))
										print(GetPlayerIdentifiers(GetPlayerServerId(PlayerId())))]]

										--S
										--sweapon = Config.sweaponn[math.random(1, #Config.sweaponn)]
										sitem 	= Config.sitemm[math.random(1, #Config.sitemm)]
										scash	= math.random(200, 300)

										--A
										--aweapon = Config.aweaponn[math.random(1, #Config.aweaponn)]
										aitem 	= Config.aitemm[math.random(1, #Config.aitemm)]
										acash	= math.random(150, 200)

										--B
										--bweapon = Config.bweaponn[math.random(1, #Config.bweaponn)]
										bitem 	= Config.bitemm[math.random(1, #Config.bitemm)]
										bcash	= math.random(100, 150)

										--C
										--cweapon = Config.cweaponn[math.random(1, #Config.cweaponn)]
										citem 	= Config.citemm[math.random(1, #Config.citemm)]
										ccash	= math.random(50, 75)

										--D
										--dweapon = Config.dweaponn[math.random(1, #Config.dweaponn)]
										ditem 	= Config.ditemm[math.random(1, #Config.ditemm)]
										dcash	= math.random(5, 25)

										-- code

										if rank >= 126 then --s
											if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
												local randomAmmo = math.random(1, 30)
												GiveWeaponToPed(GetPlayerPed(-1), sweapon, randomAmmo, true, false)
												ESX.ShowNotification('You found ' .. sweapon)
											elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
												TriggerServerEvent('smoke_zombie:moneyloot' , scash)
											elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
												TriggerServerEvent('smoke_zombie:itemloot', sitem)
											elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
												ESX.ShowNotification('You not found nothing')
											end
										elseif rank >= 76 and rank <= 125 then --a
											if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
												local randomAmmo = math.random(1, 30)
												GiveWeaponToPed(GetPlayerPed(-1), aweapon, randomAmmo, true, false)
												ESX.ShowNotification('You found ' .. aweapon)
											elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
												TriggerServerEvent('smoke_zombie:moneyloot' , acash)
											elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
												TriggerServerEvent('smoke_zombie:itemloot', aitem)
											elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
												ESX.ShowNotification('You not found nothing')
											end
										elseif rank >= 51 and rank <= 75 then --b
											if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
												local randomAmmo = math.random(1, 30)
												GiveWeaponToPed(GetPlayerPed(-1), bweapon, randomAmmo, true, false)
												ESX.ShowNotification('You found ' .. bweapon)
											elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
												TriggerServerEvent('smoke_zombie:moneyloot' , bcash)
											elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
												TriggerServerEvent('smoke_zombie:itemloot', bitem)
											elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
												ESX.ShowNotification('You not found nothing')
											end
										elseif rank >= 26 and rank <= 50 then --c
											if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
												local randomAmmo = math.random(1, 30)
												GiveWeaponToPed(GetPlayerPed(-1), cweapon, randomAmmo, true, false)
												ESX.ShowNotification('You found ' .. cweapon)
											elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
												TriggerServerEvent('smoke_zombie:moneyloot' , ccash)
											elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
												TriggerServerEvent('smoke_zombie:itemloot', citem)
											elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
												ESX.ShowNotification('You not found nothing')
											end
										elseif rank >= 1 and rank <= 25 then --d
											if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
												local randomAmmo = math.random(1, 30)
												GiveWeaponToPed(GetPlayerPed(-1), dweapon, randomAmmo, true, false)
												ESX.ShowNotification('You found ' .. dweapon)
											elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
												TriggerServerEvent('smoke_zombie:moneyloot' , dcash)
											elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
												TriggerServerEvent('smoke_zombie:itemloot', ditem)
											elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
												ESX.ShowNotification('You not found nothing')
											end
										else
											ESX.ShowNotification('There Has Been An ERROR In Rank Looting Contact An ADMIN!')
										end
										
										ClearPedSecondaryTask(GetPlayerPed(-1))
										local model = GetEntityModel(entity)
										SetEntityAsNoLongerNeeded(entity)
										SetModelAsNoLongerNeeded(model)
										DeleteEntity(entity)
										table.remove(entitys, i)
									end
								end
							end
						end
					end
				end
			end
		end
	end)
end

RegisterNetEvent('smoke_zombie:clear')
AddEventHandler('smoke_zombie:clear', function()
	for i, entity in pairs(entitys) do
		local model = GetEntityModel(entity)
		SetEntityAsNoLongerNeeded(entity)
		SetModelAsNoLongerNeeded(model)
		table.remove(entitys, i)
		--Citizen.Trace("Zombie Eliminated\n")
	end
end)

if Config.Debug then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			for i, entity in pairs(entitys) do
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(PlayerPedId(), true))
				local pedX, pedY, pedZ = table.unpack(GetEntityCoords(entity, false))	
				DrawLine(playerX, playerY, playerZ, pedX, pedY, pedZ, 250,0,0,250)
			end
		end
	end)
end

if Config.NoPeds then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
	    	SetVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			local playerPed = GetPlayerPed(-1)
			local pos = GetEntityCoords(playerPed) 
			RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
			SetGarbageTrucks(0)
			SetRandomBoats(0)
			CancelCurrentPoliceReport()
			
			for i=0,20 do
				EnableDispatchService(i, false)
			end
		end
	end)
end

-- godmode

local godmode = false
RegisterNetEvent('ronhomo:godmode')
AddEventHandler('ronhomo:godmode', function()
    godmode = not godmode
    exports['mythic_notify']:SendAlert('inform', "Godmode is " ..((godmode) and "Enabled" or "Disabled"),"inform",5000)
    SetEntityInvincible(PlayerPedId(),godmode)
end)