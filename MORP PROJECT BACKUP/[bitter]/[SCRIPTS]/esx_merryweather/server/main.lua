local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_customrob:tooFar')
AddEventHandler('esx_customrob:tooFar', function(currentStore)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
			--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayers[i], {type = 'success', text = _U('robbery_cancelled_at', Stores[currentStore].nameOfStore)})
			TriggerClientEvent('esx_customrob:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_customrob:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('robbery_cancelled_at', Stores[currentStore].nameOfStore)})
	end
end)

RegisterServerEvent('esx_customrob:robberyStarted')
AddEventHandler('esx_customrob:robberyStarted', function(currentStore)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if Stores[currentStore] then
		local store = Stores[currentStore]

		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRob and store.lastRobbed ~= 0 then
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastRobbed))})
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		if not rob then
			if cops >= Config.PoliceNumberRequired then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' then
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayers[i], {type = 'error', text = _U('rob_in_prog', store.nameOfStore), length = 35000})
						TriggerClientEvent('esx_customrob:setBlip', xPlayers[i], Stores[currentStore].position)
					end
				end

				TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('started_to_rob', store.nameOfStore)})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('alarm_triggered')})
				
				TriggerClientEvent('esx_customrob:currentlyRobbing', _source, currentStore)
				TriggerClientEvent('esx_customrob:startTimer', _source)
				
				Stores[currentStore].lastRobbed = os.time()
				robbers[_source] = currentStore

				SetTimeout(store.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						local chance = math.random(1, 100)
						local amount = math.random(Config.cashstart ,Config.cashstop)
						local opp = math.random(1 ,100)
						if xPlayer then
							TriggerClientEvent('esx_customrob:robberyComplete', _source)

							if chance >= 77 and chance <= 100 then  --1
								xPlayer.addInventoryItem('bp_lootchest', 3)
								xPlayer.addMoney(amount)

								local count = math.random(2, 5)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('pistol_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('smg_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('shotgun_clip', count)
								end

							elseif chance >= 59 and chance <= 76 then --2
								xPlayer.addInventoryItem('bp_lootchest2', 3)
								xPlayer.addMoney(amount)

								local count = math.random(5, 8)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('pistol_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('smg_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('shotgun_clip', count)
								end
								
							elseif chance <= 25 and chance >= 42 then --3
								xPlayer.addInventoryItem('bp_lootchest3', 3)
								xPlayer.addMoney(amount)

								local count = math.random(8, 14)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('smg_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('rifle_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('sniper_clip', count)
								end
								
							elseif chance <= 1 and chance >= 4 then --4
								xPlayer.addInventoryItem('bp_lootchest4', 3)
								xPlayer.addMoney(amount)

								local count = math.random(15, 25)
								if opp >= 1 and opp <= 10 then
									xPlayer.addInventoryItem('lightsmg_clip', count)
								elseif opp >= 11 and opp <= 30 then
									xPlayer.addInventoryItem('sniper_clip', count)
								elseif opp >= 31 and opp <= 60 then
									xPlayer.addInventoryItem('rifle_clip', count)
								elseif opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('smg_clip', count)
								end
								
							elseif chance <= 43 and chance >= 58 then --5
								xPlayer.addInventoryItem('bp_lootchest5', 3)
								xPlayer.addMoney(amount)

								local count = math.random(5, 8)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('pistol_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('smg_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('shotgun_clip', count)
								end
								
							elseif chance <= 13 and chance >= 24 then --6
								xPlayer.addInventoryItem('bp_lootchest6', 3)
								xPlayer.addMoney(amount)

								local count = math.random(8, 14)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('smg_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('rifle_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('sniper_clip', count)
								end
								
							elseif chance <= 5 and chance >= 12 then --7
								xPlayer.addInventoryItem('bp_lootchest7', 3)
								xPlayer.addMoney(amount)

								local count = math.random(15, 25)
								if opp >= 61 and opp <= 100 then
									xPlayer.addInventoryItem('rifle_clip', count)
								elseif opp >= 1 and opp <= 20 then
									xPlayer.addInventoryItem('lightsmg_clip', count)
								elseif opp >= 21 and opp <= 60 then
									xPlayer.addInventoryItem('sniper_clip', count)
								end
								
							end
							
							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])

								if xPlayer.job.name == 'police' then
									TriggerClientEvent('mythic_notify:client:SendAlert', xPlayers[i], {type = 'error', text = _U('robbery_complete_at', store.nameOfStore), length = 10000})
									TriggerClientEvent('esx_customrob:killBlip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('min_police', Config.PoliceNumberRequired), length = 10000})
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('robbery_already'), length = 10000})
		end
	end
end)
