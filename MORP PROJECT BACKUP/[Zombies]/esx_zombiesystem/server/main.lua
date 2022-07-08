ESX  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

players = {}

RegisterServerEvent("esx_zombiesystem:newplayer")
AddEventHandler("esx_zombiesystem:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("esx_zombiesystem:clear", -1)
end)

RegisterServerEvent('esx_zombiesystem:moneyloot')
AddEventHandler('esx_zombiesystem:moneyloot', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
--    print(amount)
--	local random = math.random(50, 500)
    xPlayer.addMoney(amount)
    TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. amount .. ' dollars'))
end)

RegisterServerEvent('esx_zombiesystem:itemloot')
AddEventHandler('esx_zombiesystem:itemloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(1,20)
    
    -- item single count
    local catsing = { 
        '2jzengine_blueprint',
        'WEAPON_ADVANCEDRIFLE_blueprint',
        'WEAPON_APPISTOL_blueprint',
        'WEAPON_ASSAULTRIFLE_MK2_blueprint',
        'WEAPON_ASSAULTSHOTGUN_blueprint',
        'WEAPON_ASSUALTRIFLE_blueprint',
        'WEAPON_ASSUALTSMG_blueprint',
        'WEAPON_AUTOSHOTGUN_blueprint',
        'WEAPON_BULLPUPRIFLE_MK2_blueprint',
        'WEAPON_BULLPUPRIFLE_blueprint',
        'WEAPON_BULLPUPSHOTGUN_blueprint',
        'WEAPON_BZGAS_blueprint',
        'WEAPON_CARBINERIFLE_MK2_blueprint',
        'WEAPON_CARBINERIFLE_blueprint',
        'WEAPON_CERAMICPISTOL_blueprint',
        'WEAPON_COMBATMG_MK2_blueprint',
        'WEAPON_COMBATMG_blueprint',
        'WEAPON_COMBATPDW_blueprint',
        'WEAPON_COMBATPISTOL_blueprint',
        'WEAPON_COMBATSHOTGUN_blueprint',
        'WEAPON_COMPACTLAUNCHER_blueprint',
        'WEAPON_COMPACTRIFLE_blueprint',
        'WEAPON_DBSHOTGUN_blueprint',
        'WEAPON_DOUBLEACTION_blueprint',
        'WEAPON_FIREWORK_blueprint',
        'WEAPON_GRENADELAUNCHER_blueprint',
        'WEAPON_GRENADE_blueprint',
        'WEAPON_GUSENBERG_blueprint',
        'WEAPON_HEAVYPISTOL_blueprint',
        'WEAPON_HEAVYSHOTGUN_blueprint',
        'WEAPON_HEAVYSNIPER_blueprint',
        'WEAPON_HOMINGLAUNCHER_blueprint',
        'WEAPON_MACHINEPISTOL_blueprint',
        'WEAPON_MARKSMANPISTOL_blueprint',
        'WEAPON_MARKSMANRIFLE_MK2_blueprint',
        'WEAPON_MARKSMANRIFLE_blueprint',
        'WEAPON_MG_blueprint',
        'WEAPON_MICROSMG_blueprint',
        'WEAPON_MILITARYRIFLE_blueprint',
        'WEAPON_MINIGUN_blueprint',
        'WEAPON_MINISMG_blueprint',
        'WEAPON_MOLOTOV_blueprint',
        'WEAPON_MUSKET_blueprint',
        'WEAPON_NAVYREVOLVER_blueprint',
        'WEAPON_PIPEBOMB_blueprint',
        'WEAPON_PISTOL50_blueprint',
        'WEAPON_PISTOL_blueprint',
        'WEAPON_PROXMINE_blueprint',
        'WEAPON_PUMPSHOTGUN_MK2_blueprint',
        'WEAPON_PUMPSHOTGUN_blueprint',
        'WEAPON_REVOLVER_blueprint',
        'WEAPON_RPG_blueprint',
        'WEAPON_SAWNOFFSHOTGUN_blueprint',
        'WEAPON_SMG_MK2_blueprint',
        'WEAPON_SMG_blueprint',
        'WEAPON_SNIPERRIFLE_blueprint',
        'WEAPON_SNSPISTOL_MK2_blueprint',
        'WEAPON_SNSPISTOL_blueprint',
        'WEAPON_SPEACIALCARBINERIFLE_blueprint',
        'WEAPON_SPECIALCARBINE_MK2_blueprint',
        'WEAPON_STICKYBOMB_blueprint',
        'WEAPON_VINTAGEPISTOL_blueprint',
        'antidot',
        'bombshell',
        'heavyshell',
        'mgshell',
        'michelin_tires_blueprint',
        'nos_blueprint',
        'oxygenmask_blueprint',
        'pistol_clip',
        'pistolshell',
        'race_brakes_blueprint',
        'race_suspension_blueprint',
        'race_transmition_blueprint',
        'repairkit_blueprint',
        'rifle_clip',
        'rifleshell',
        'shell_oil_blueprint',
        'shotgun_clip',
        'shotgunshell',
        'smg_clip',
        'smgshell',
        'sniper_clip',
        'snipershell',
        'turbo_lvl_1_blueprint',
        'v8engine_blueprint'
    }

    -- item multi count
    local catmp = {
        'scrap'
    }

    for i,v in pairs(catsing) do
        if v == item then
            random = 1
        end
    end

    for i,v in pairs(catmp) do
        if v == item then
            random = math.random(100, 300)
        end
    end

    --if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. item))
    --else
        --xPlayer.showNotification('You cannot pickup that because your inventory is full!')
    --end
end)

entitys = {}

RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
	TriggerClientEvent("ZombieSync", -1, entity)
	table.insert(entitys, entity)
end)

-- xp for kills
AddEventHandler("baseevents:onPlayerKilled", function(killer, reason)
    TriggerClientEvent('esx_xp:Add', killer, 250)
end)

--godmode
RegisterCommand("godmode",function(source)
    local user = ESX.GetPlayerFromId(source)
    local group = user.getGroup()
    if group == "admin" or group == "superadmin" then
        TriggerClientEvent("ronhomo:godmode",source)
    end
end)

RegisterServerEvent("esx_zombiesystem:rank")
AddEventHandler("esx_zombiesystem:rank", function(id)
    print(id)
end)

-- In Detectable
ESX.RegisterUsableItem('godsblood', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('godsblood', 1)

	TriggerClientEvent('smoke:blood', source)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification("You Drank God's Blood!")
end)