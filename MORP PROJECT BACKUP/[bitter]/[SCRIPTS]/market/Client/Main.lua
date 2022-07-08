AddEventHandler('playerSpawned', function()
    SendNUIMessage({
        config = Config,
        translate = translate,
        NameResource = GetCurrentResourceName()
    })
end)

AddEventHandler('onResourceStart', function()
    Wait(5000)
    SendNUIMessage({
        config = Config,
        translate = translate,
        NameResource = GetCurrentResourceName()
    })
end)

RegisterNetEvent('lg: loadMarket')
AddEventHandler('lg: loadMarket', function(identifier, result)
    SendNUIMessage({
        open = true,
        list_products = list_products,
        products = result,
        identifier = identifier
    })

    SetNuiFocus(true, true)
end)

RegisterNetEvent('lg: loadPlayerMarket')
AddEventHandler('lg: loadPlayerMarket', function(inventory, result)
    SendNUIMessage({
        myProductsOpen = true,
        list_products = list_products,
        inventory = inventory,
        myProducts = result
    })
end)

RegisterNetEvent('lg: updatePlayerMarket')
AddEventHandler('lg: updatePlayerMarket', function()
    TriggerServerEvent('lg: loadPlayerMarket')
end)


RegisterNetEvent('lg: updateMarket')
AddEventHandler('lg: updateMarket', function()
    TriggerServerEvent('lg: loadMarket')
end)

RegisterNetEvent('lg: marketNotify')
AddEventHandler('lg: marketNotify', function(color, Notify)
    SendNUIMessage({
        Notify = Notify,
        color = color
    })
end)

RegisterNetEvent('lg: marketRefused')
AddEventHandler('lg: marketRefused', function()
    SendNUIMessage({
        Refused = true
    })
end)

RegisterNUICallback('loadAnuncios', function(data, cb)
    TriggerServerEvent('lg: loadMarket')

    cb('ok')
end)

RegisterNUICallback('loadMyAnuncios', function(data, cb)
    TriggerServerEvent('lg: loadPlayerMarket')

    cb('ok')
end)

RegisterNUICallback('anunciarItem', function(data, cb)
    TriggerServerEvent('lg: advertiseItem', data)

    cb('ok')
end)

RegisterNUICallback('buyItem', function(data, cb)
    TriggerServerEvent('lg: buyItem', data)
    cb('ok')
end)

RegisterNUICallback('removeItem', function(data, cb)
    TriggerServerEvent('lg: removeItem', data)
    cb('ok')
end)

RegisterNUICallback('sendNotify', function(data, cb)
    TriggerEvent('lg: marketNotify', data.color, data.Notify)

    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)

    cb('ok')
end)