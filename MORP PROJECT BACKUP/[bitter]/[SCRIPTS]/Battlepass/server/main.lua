
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('getxp')
AddEventHandler('getxp', function()
	local _source = source
	local XPlayer = ESX.GetPlayerFromId(_source)
	DatabaseGetXPNR(XPlayer.getIdentifier(),_source)
end)


local clientsXP = {}

function GetIniFiniLevelfrmlvl(lvl)
	local init = 0
	local finit = 800
	if lvl > 1 then
		for i = 1, #Config.RewardsAndStuff do 
			if i == lvl then
				init = Config.RewardsAndStuff[i-1].xp
				finit = Config.RewardsAndStuff[i].xp
			end
		end
	end
	return init,finit
end

function GetIniFiniLevelfrmxp(xp)
	local init, finit = 0
	init, finit = GetIniFiniLevelfrmlvl(GetMyActualNvl(xp))
	return init, finit
end

function GetMyActualNvl(xp)
	local actualnvl = 1
	local level = 0
	for k,v in pairs(Config.RewardsAndStuff)do
		if xp >= v.xp then
			level = k+1
		end
	end
	if level == 0 then
		return 1
	end
	return level
end


AddEventHandler('BattlePass-Server:AddXP', function(XPadded,src)
	local _source = src
	if clientsXP[_source] then
		local somaxp = clientsXP[_source]+XPadded
		local configstuff = Config.RewardsAndStuff[#Config.RewardsAndStuff]
		if somaxp > configstuff.xp then
			somaxp = configstuff.xp
			XPadded = somaxp-clientsXP[_source]
		end
		clientsXP[_source] = clientsXP[_source]+XPadded
		local xPlayer = ESX.GetPlayerFromId(_source)
		DatabaseModifyXPNR(xPlayer.getIdentifier(),_source)
		TriggerClientEvent("BattlePass:AddXP",_source,XPadded)
	else
		local xPlayer = ESX.GetPlayerFromId(_source)
		DatabaseGetXPNR(xPlayer.getIdentifier(),_source)
		local somaxp = clientsXP[_source]+XPadded
		local configstuff = Config.RewardsAndStuff[#Config.RewardsAndStuff]
		if somaxp > configstuff.xp then
			somaxp = configstuff.xp
			XPadded = somaxp-clientsXP[_source]
		end
		clientsXP[_source] = clientsXP[_source]+XPadded
		DatabaseModifyXPNR(xPlayer.getIdentifier(),_source)
		TriggerClientEvent("BattlePass:AddXP",_source,XPadded)
	end
	local nvlatns = GetMyActualNvl(clientsXP[_source]-XPadded)
	local nvldps = GetMyActualNvl(clientsXP[_source])
	local hadif = nvldps - nvlatns
	if hadif ~= 0 then
		local tabela = {}
		for i = 1,hadif do
			table.insert(tabela, i)
		end
		table.sort(tabela, function(a, b)
			return a > b
		end)
		local niveissubids = {}
		for k,v in pairs(tabela)do
			local nvl = (nvldps - v)+1
			table.insert(niveissubids, nvl)
		end
		if #niveissubids >= 1 then
			local xPlayer = ESX.GetPlayerFromId(_source)
			for k,v in pairs(niveissubids)do
				local prems = Config.RewardsAndStuff[v].Rewards
				for k,v in pairs(prems)do
					if v.typereward == "money" then
						print(v.amount)
						if v.item == "cash" then
							print("isthsiri")
							xPlayer.addMoney(v.amount)
						else
							xPlayer.addAccountMoney(v.item, v.amount)
						end
					elseif v.typereward == "item" then
						xPlayer.addInventoryItem(v.item, v.amount)
						print('item')
					elseif v.typereward == "weapon" then
						xPlayer.addWeapon(v.item, v.amount)
						print('weapon')
					end
				end
			end
		end
	end
end)

AddEventHandler('BattlePass-Server:RemXP', function(XPrem,src)
	local _source = src
	if clientsXP[_source] then
		local somaxp = clientsXP[_source]-XPrem
		if somaxp < 0 then
			XPrem = clientsXP[_source]
		end
		clientsXP[_source] = clientsXP[_source]-XPrem
		local xPlayer = ESX.GetPlayerFromId(_source)
		DatabaseModifyXPNR(xPlayer.getIdentifier(),_source)
		TriggerClientEvent("BattlePass:RemXP",_source,XPrem)
	else
		local xPlayer = ESX.GetPlayerFromId(_source)
		DatabaseGetXPNR(xPlayer.getIdentifier(),_source)
		local somaxp = clientsXP[_source]-XPrem
		if somaxp < 0 then
			XPrem = clientsXP[_source]
		end
		clientsXP[_source] = clientsXP[_source]-XPrem
		if clientsXP[_source] < 0 then
			clientsXP[_source] = 0
		end
		DatabaseModifyXPNR(xPlayer.getIdentifier(),_source)
		TriggerClientEvent("BattlePass:RemXP",_source,XPrem)
	end
	local nvlatns = GetMyActualNvl(clientsXP[_source]+XPrem)
	local nvldps = GetMyActualNvl(clientsXP[_source])
end)

local confreset = Config.ResetInDay
local dif = os.time{year=confreset.year, month=confreset.month, day=confreset.day, hour=confreset.hour, min=confreset.minute}

if not Config.MysqlAsync then
	DatabaseLoad = load
	function ResetDatabaseXPNR()
		exports.ghmattimysql:execute('UPDATE users SET xp = @xp WHERE xp > @xp',
			{
				['@xp'] = 0
			}, 
			function(result)
			TriggerClientEvent("BattlePass:GetMyXP",-1,0,os.time(),dif,true)
		end)
	end
	function DatabaseModifyXPNR(id,source)
		local identifier = id
		local _source = source
		local xp = clientsXP[_source]
		local acabado
		exports.ghmattimysql:execute('UPDATE users SET xp = @xp WHERE identifier = @identifier',
			{
				['@xp'] = xp,
				['@identifier'] = identifier
			}, 
			function(result)--MUDAR ESTA CENA APRA ESX
			Wait(10)
			acabado = true
		end)
		while not acabado do
			Wait(50)
		end
	end
	function DatabaseGetXPNR(id,source,client)
		local identifier = id
		local _source = source
		local acabado
		exports.ghmattimysql:execute("SELECT xp FROM users WHERE identifier = @identifier", {['@identifier'] = identifier}, function(result)--MUDAR ESTA CENA APRA ESX
			if result[1] then
				clientsXP[_source] = result[1].xp
				--if client then
					TriggerClientEvent("BattlePass:GetMyXP",_source,result[1].xp,os.time(),dif)
				--end
			else
				clientsXP[_source] = 0
				--if client then
					TriggerClientEvent("BattlePass:GetMyXP",_source,0,os.time(),dif)
				--end
			end
			Wait(10)
			acabado = true
		end)
		while not acabado do
			Wait(50)
		end
	end
else
	DatabaseLoad = load
	function ResetDatabaseXPNR()
		MySQL.Async.execute('UPDATE users SET xp = @xp WHERE xp > @xp',
			{
				['@xp'] = 0
			}, 
			function(result)
			TriggerClientEvent("BattlePass:GetMyXP",-1,0,os.time(),dif,true)
		end)
	end
	function DatabaseModifyXPNR(id,source)
		local identifier = id
		local _source = source
		local xp = clientsXP[_source]
		local acabado
		MySQL.Async.execute('UPDATE users SET xp = @xp WHERE identifier = @identifier',
			{
				['@xp'] = xp,
				['@identifier'] = identifier
			}, 
			function(result)--MUDAR ESTA CENA APRA ESX
			Wait(10)
			acabado = true
		end)
		while not acabado do
			Wait(50)
		end
	end

	function DatabaseGetXPNR(id,source,client)
		local identifier = id
		local _source = source
		local acabado
		MySQL.Async.fetchAll
		("SELECT xp FROM users WHERE identifier = @identifier", {['@identifier'] = identifier}, function(result)--MUDAR ESTA CENA APRA ESX
			print(result[1].xp)
			if result[1] then
				clientsXP[_source] = result[1].xp
				--if client then
					TriggerClientEvent("BattlePass:GetMyXP",_source,result[1].xp,os.time(),dif)
				--end
			else
				clientsXP[_source] = 0
				--if client then
					TriggerClientEvent("BattlePass:GetMyXP",_source,0,os.time(),dif)
				--end
			end
			Wait(10)
			acabado = true
		end)
		while not acabado do
			Wait(50)
		end
	end
end

function ResetSystem(d,h,m)
	local horita = json.encode(os.date("*t"))
	local def = Config.ResetInDay
	if horita.year == def.year and horita.month == def.month and horita.day == def.day then
		ResetDatabaseXPNR()
	end
end
TriggerEvent('cron:runAt', Config.ResetInDay.hour,Config.ResetInDay.minute, ResetSystem)