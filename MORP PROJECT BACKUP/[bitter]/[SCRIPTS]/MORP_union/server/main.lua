local webhook = 'https://discord.com/api/webhooks/842403489208467496/-Ac1yW9KOI9L1-Qzh9cDhFVoFKSC0zV5yvD6IXosaah567OjDpGAzLizmYRgHA4Ooa2J' -- Your Discord webhook for logs
local wait = false
local ct = 10000
local cooldown = 0
local trolleys = 0
local data = {vault = false,active = false}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('union:status',function(source,cb)
	cb(data)
end)

RegisterServerEvent('union:c4')
AddEventHandler('union:c4', function()
	TriggerClientEvent('c4:sync',-1)
end)

RegisterServerEvent('union:vault')
AddEventHandler('union:vault', function(status)
	if status == true then
		data.vault = true
		data.active = true
		TriggerClientEvent('spawn:sync',-1,data)
		TriggerEvent('union:notify:sv')
		wait = true
		print('^3[Union Depository]: ^2Cooldown started^0')
		cooldown = os.time()
	else
		data.vault = false
		data.active = false
		TriggerClientEvent('spawn:sync',-1,data)
		TriggerClientEvent('union:killblip',-1)
	end
end)

RegisterServerEvent('union:active')
AddEventHandler('union:active', function(status)
	if status == true then
		data.active = true
		TriggerClientEvent('spawn:sync',-1,data)
	else
		data.active = false
		TriggerClientEvent('spawn:sync',-1,data)
	end
end)

RegisterServerEvent('union:notify:sv')
AddEventHandler('union:notify:sv', function()
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('union:notify', xPlayers[i])
		end
	end
end)

ESX.RegisterServerCallback('union:item', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem(item).count >= 1 then
		xPlayer.removeInventoryItem(item,1)
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('union:ThermiteEffectSync')
AddEventHandler('union:ThermiteEffectSync', function(entity)
	TriggerClientEvent('union:thermiteEffect',-1,entity)
end)

RegisterServerEvent('union:doorsStatus')
AddEventHandler('union:doorsStatus', function(doorCoords,status)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('union:syncDoors',-1,doorCoords,status)
end)

ESX.RegisterServerCallback('union:cooldown', function(source,cb)
	local xPlayers = ESX.GetPlayers()
	local cops = 0
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == Config.PoliceJobName then
			cops = cops + 1
		end
	end
	
	if cops >= Config.MinPolice and not wait then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('union:reset')
AddEventHandler('union:reset', function()
	trolleys = 0
	data.vault = false
	data.active = false
	TriggerClientEvent('spawn:sync',-1,data)
	TriggerClientEvent('union:killblip',-1)
	print('^3[Union Depository]: ^2Cooldown Finished^0')
end)

RegisterServerEvent('union:MakeItRain')
AddEventHandler('union:MakeItRain', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if trolleys < 4 then
		trolleys = trolleys + 1
		xPlayer.addAccountMoney(Config.Account,Config.MoneyTrolley)
		xPlayer.showNotification(Config.Lang['money']..Config.MoneyTrolley)
	end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(ct)
		if wait then
			ct = 1000
			if (os.time() - cooldown) < Config.CooldownTime and cooldown ~= 0 then				
				
			else
				TriggerEvent('union:reset')
				wait = false
			end
		else
			ct = 10000
		end
	end
end)

RegisterNetEvent('union:log')
AddEventHandler('union:log', function()
	local player = GetPlayerName(source)
	local content = {
        {
        	["color"] = '8663711',
            ["title"] = "** Union Depository **",
            ["description"] = "**".. player .."** started the Union Depository Robbery",
            ["footer"] = {
                ["text"] = "Your awesome Server Name",
            },
        }
    }
  	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })	
end)