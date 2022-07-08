ESX  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('health', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local smoke = xPlayer.getInventoryItem('health')

    xPlayer.removeInventoryItem('health', 1)
    TriggerClientEvent('esx_chapo:health', source) 


end)

RegisterServerEvent('cant:chao')
AddEventHandler('cant:chao', function()

    TriggerClientEvent('esx_chapo:health', source)
    TriggerClientEvent("pNotify:SendNotification",{
        text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>YOUR WORD HEr</font></p></center>",
        type = "success",
        timeout = (2500),
        layout = "centerleft",
        queue = "killer"
    })
    Citizen.wait(3000)

    

end)


RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 0)
end)