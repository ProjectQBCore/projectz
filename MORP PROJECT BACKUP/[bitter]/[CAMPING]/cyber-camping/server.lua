
-- _______                   __  __                            __       
--/       \                 /  |/  |                          /  |      
--$$$$$$$  |  ______    ____$$ |$$ |____    ______    ______  $$ |   __ 
--$$ |__$$ | /      \  /    $$ |$$      \  /      \  /      \ $$ |  /  |
--$$    $$< /$$$$$$  |/$$$$$$$ |$$$$$$$  |/$$$$$$  |/$$$$$$  |$$ |_/$$/ 
--$$$$$$$  |$$    $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$   $$<  
--$$ |  $$ |$$$$$$$$/ $$ \__$$ |$$ |  $$ |$$ \__$$ |$$ \__$$ |$$$$$$  \ 
--$$ |  $$ |$$       |$$    $$ |$$ |  $$ |$$    $$/ $$    $$/ $$ | $$  |
--$$/   $$/  $$$$$$$/  $$$$$$$/ $$/   $$/  $$$$$$/   $$$$$$/  $$/   $$/ 
--@Bu script mike tarafından kodlanıp, redhook dev takımı tarafından geliştirilmiştir.by base64
                                                                                                                                    
ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('campingset', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('campingset', 1)
    TriggerClientEvent('cyber:camping', source)    
end)

RegisterServerEvent('cyber:campingcontrol')
AddEventHandler('cyber:campingcontrol',function()
    TriggerClientEvent("cyber-campingcreateobject",source,'prop_beach_fire','prop_skid_tent_01','prop_skid_chair_02','prop_tool_bench02')
end)
