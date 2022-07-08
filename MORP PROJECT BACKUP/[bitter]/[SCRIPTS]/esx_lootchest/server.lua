ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("lootchest", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems)

    for k,v in pairs(Config.LootChestitems[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest2", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems2)

    for k,v in pairs(Config.LootChestitems2[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest3", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems3)

    for k,v in pairs(Config.LootChestitems3[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest4", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems4)

    for k,v in pairs(Config.LootChestitems4[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest5", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems5)

    for k,v in pairs(Config.LootChestitems5[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest6", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems6)

    for k,v in pairs(Config.LootChestitems6[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)

ESX.RegisterUsableItem("lootchest7", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems7)

    for k,v in pairs(Config.LootChestitems7[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)