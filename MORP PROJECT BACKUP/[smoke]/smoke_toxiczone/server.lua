ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("gasmask", function(source) 
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("smoke_gasmask:useItem", source)
    xPlayer.removeInventoryItem('gasmask', 1)
end)

ESX.RegisterUsableItem("antidot", function(source) 
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("smoke_ant:useItem1", source)
    xPlayer.removeInventoryItem('antidot', 1)
end)

--=============================TREASURE========================

local robbableItems = Config.treasurerewards

RegisterServerEvent('SmokeTreasure:searchItem')
AddEventHandler('SmokeTreasure:searchItem', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}

    for i=1, math.random(1, 2) do
        item = robbableItems[math.random(1, #robbableItems)]
        if math.random(1, 10) >= item.chance then
            if tonumber(item.id) == 0 and not gotID[item.id] then
                print('here')
                gotID[item.id] = true
                item.quantity = math.random(50,400)
                xPlayer.addMoney(item.quantity)
                TriggerClientEvent('notification', source, 'You found $'..item.quantity)
            elseif item.isWeapon and not gotID[item.id] then
                print('here2')
                gotID[item.id] = true
                xPlayer.addWeapon(item.id, 50)
                TriggerClientEvent('notification', source, 'You found a '..item.name)
                --PerformHttpRequest('https://discord.com/api/webhooks/838441968462725147/j2VScyrWhAYDB14nAOq-aYY8j1ph5L9LarccmfWDmlOCwu5K6Ti9tmNzYx4Pudc18Ze4', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.isWeapon .. "** **.** "}), { ['Content-Type'] = 'application/json' })
            elseif not gotID[item.id] then
                print('here3')
                gotID[item.id] = true
                xPlayer.addInventoryItem(item.id, item.quantity)
                TriggerClientEvent('notification', source, 'You have found '..item.quantity..'x '..item.name)
                --PerformHttpRequest('https://discord.com/api/webhooks/838442035034849292/2lc0Cgvs5j1SoX7UlIxjeswuqtFAhkIkIysQ9BpDJ49-eWYvXVb23JjUPEI97BCN0gG7', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.id .. "** **.** "}), { ['Content-Type'] = 'application/json' })
            end
        end
    end
end)