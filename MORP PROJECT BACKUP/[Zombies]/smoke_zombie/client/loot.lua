ESX = nil

-- not in use implemented in main

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

objects = {}

if Config.ObjectDropLoot then
	Citizen.CreateThread(function()
	    while true do
	        Wait(0)
	        for k,v in pairs(Config.ObjectsLoot) do
		        	local player = GetPlayerPed(-1)
		        	local distanceobject = 2.2
		            local obj = GetClosestObjectOfType(GetEntityCoords(player).x, GetEntityCoords(player).y, GetEntityCoords(player).z, distanceobject, v, false, true ,true)
		            local distance = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(obj), true)
		    


			    if distance <= distanceobject then

		            local ObjectCoords = GetEntityCoords(obj)

		            if not objects[obj] then
		            ESX.Game.Utils.DrawText3D(ObjectCoords + vector3(0.0, 0.0, 0.5), '~c~PRESS ~b~[E]~c~ TO SEARCH', 1, 4)
		        	end

		            if IsControlJustReleased(0, 38) then
						if not objects[obj] then
							
							exports.esx_xp:ESXP_Add(100)	

		                    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263, true)
		                    RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
							while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
								Citizen.Wait(10)
							end
--							TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 2.0, 2.0, 4000, 30, 0, 0, 0, 0)
							Citizen.Wait(10) --4000

						--[[ --old looting
							randomChance = math.random(1, 100)
							randomWeapon = Config.WeaponLootObject[math.random(1, #Config.WeaponLootObject)]
							randomItem = Config.ItemLootObject[math.random(1, #Config.ItemLootObject)]

							if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
								local randomAmmo = math.random(1, 30)
								GiveWeaponToPed(GetPlayerPed(-1), randomWeapon, randomAmmo, true, false)
								ESX.ShowNotification('You found ' .. randomWeapon)
							elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
								TriggerServerEvent('smoke_zombie:moneyloot')
							elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
								TriggerServerEvent('smoke_zombie:itemloot', randomItem)
							elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
								ESX.ShowNotification('You not found nothing')
							end
						]]

							local xPlayer = ESX.GetPlayerData()
							local rank = xPlayer.rank
							randomChance = math.random(1, 100)


							--local pedmodel = GetHashKey('BF4UsSupport')
							--print(pedmodel)
							


							--S
--							sweapon = Config.sweaponn[math.random(1, #Config.sweaponn)]
							sitem 	= Config.sitemm[math.random(1, #Config.sitemm)]
							scash	= math.random(200, 300)

							--A
--							aweapon = Config.aweaponn[math.random(1, #Config.aweaponn)]
							aitem 	= Config.aitemm[math.random(1, #Config.aitemm)]
							acash	= math.random(150, 200)

							--B
--							bweapon = Config.bweaponn[math.random(1, #Config.bweaponn)]
							bitem 	= Config.bitemm[math.random(1, #Config.bitemm)]
							bcash	= math.random(100, 150)

							--C
--							cweapon = Config.cweaponn[math.random(1, #Config.cweaponn)]
							citem 	= Config.citemm[math.random(1, #Config.citemm)]
							ccash	= math.random(50, 75)

							--D
--							dweapon = Config.dweaponn[math.random(1, #Config.dweaponn)]
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
							
							objects[obj] = true
		               	end
		            end
		        end
		    end
		end
	end)
end
