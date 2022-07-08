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

RegisterNetEvent('cyber:camping')
AddEventHandler('cyber:camping',function()
    local b=PlayerPedId()
    local c=GetEntityCoords(PlayerPedId())
--    local d=GetDistanceBetweenCoords(2952.8,5325.69,101.02,c.x,c.y,c.z)
    local d = 50
    if IsPedInAnyVehicle(b)then 
        exports['mythic_notify']:DoHudText('inform','This operation cannot be performed in the vehicle.')
    else 
        if d<100 then 
            crouch()
            TriggerEvent("mythic_progbar:client:progress",{name="campsetup",duration=9000,label="The tent is being set up...",useWhileDead=false,canCancel=true,controlDisables={disableMovement=true,disableCarMovement=true,disableMouse=false,disableCombat=true}},function(e)if not e then TriggerEvent("mythic_progbar:client:progress",{name="campfire",duration=4000,label="Camp fire is lit...",useWhileDead=false,canCancel=true,controlDisables={disableMovement=true,disableCarMovement=true,disableMouse=false,disableCombat=true}},function(e)if not e then else print("iptal")end end)else print("iptal")end;ClearPedTasks(PlayerPedId(-1))end)            
            Citizen.Wait(13000)
            TriggerServerEvent('cyber:campingcontrol')
        else 
            exports['mythic_notify']:DoHudText('inform','You can camp only in designated areas.')
        end 
    end 
end)
    
RegisterNetEvent("cyber-campingcreateobject")
AddEventHandler("cyber-campingcreateobject",function(f,g,h,u)
    local i=PlayerPedId()
    local j=GetEntityCoords(i)
    local k=ObjToNet(CreateObject(GetHashKey(f),j.x-1,j.y-1.5,j.z-1.6,true,false))
    local l=ObjToNet(CreateObjectNoOffset(GetHashKey(g),j.x-1.5,j.y-3.5,j.z-0.5,true,false))
    local m=ObjToNet(CreateObjectNoOffset(GetHashKey(h),j.x-2.5,j.y+0.3,j.z-0.6,true,false))
    local n=ObjToNet(CreateObjectNoOffset(GetHashKey(u),j.x+1.0,j.y+0.3,j.z-0.6,true,false))
end) 

function crouch()
    TaskStartScenarioInPlace(GetPlayerPed(-1),'world_human_gardener_plant',0,false)
end

local isindim = false
local isinmadim = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        local entity = GetClosestObjectOfType(pcoords, 1.0, `prop_beach_fire`, false, false, false)
        local entityCoords = GetEntityCoords(entity)

        if DoesEntityExist(entity) and #(pcoords-entityCoords) < 3.5 then
            if isindim == false then
                startAnim()
                exports['mythic_notify']:SendAlert('success', 'You are warming up')
                Citizen.Wait(1000)
                isindim = true
                isinmadim = false
            end
        else
            if isindim == true and isinmadim == false then
                exports['mythic_notify']:SendAlert('error', 'You went away from the fire!')
                ClearPedTasks(ped)
                isindim = false
                isinmadim = true
            end
        end
    end
end)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("bs_2a_mcs_10-6")
        while not HasAnimDictLoaded("bs_2a_mcs_10-6") do
            Citizen.Wait(0)
        end
        TaskPlayAnim(GetPlayerPed(-1),"bs_2a_mcs_10-6","hc_hacker_dual-6",8.0,-8.0,-1,50,0,false,false,false)
    end)
end 

--[[
local a={{title="Camping area",colour=5,id=417,x=2948.568,y=5326.274,z=101.27}}
Citizen.CreateThread(function()
    for a,b in pairs(a) do
        b.blip=AddBlipForCoord(b.x,b.y,b.z)
        SetBlipSprite(b.blip,b.id)
        SetBlipDisplay(b.blip,4)
        SetBlipScale(b.blip,0.7)
        SetBlipColour(b.blip,b.colour)
        SetBlipAsShortRange(b.blip,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(b.title)
        EndTextCommandSetBlipName(b.blip)
    end 
end)
]]