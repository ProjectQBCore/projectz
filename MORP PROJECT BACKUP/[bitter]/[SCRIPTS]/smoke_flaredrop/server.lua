ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("flared", function(source) 
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("smoke_flare:useItem", source)
    xPlayer.removeInventoryItem('flared', 1)
end)