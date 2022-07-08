local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

ESX = nil

local labels = {}
local craftingQueue = {}

local job = ""
local grade = 0

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = ESX.GetPlayerData().job.name
        grade = ESX.GetPlayerData().job.grade

        ESX.TriggerServerCallback(
            "core_crafting:getItemNames",
            function(info)
                labels = info
            end
        )

        for _, v in ipairs(Config.Workbenches) do
            if v.blip then
                local blip = AddBlipForCoord(v.coords)

                SetBlipSprite(blip, Config.BlipSprite)
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, Config.BlipColor)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.BlipText)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(j)
        job = j.name
        grade = j.grade
    end
)

function isNearWorkbench()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local near = false

    for _, v in ipairs(Config.Workbenches) do
        local dst = #(coords - v.coords)
        if dst < v.radius then
            near = true
        end
    end

    if near then
        return true
    else
        return false
    end
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)

            if craftingQueue[1] ~= nil then
                if not Config.CraftingStopWithDistance or (Config.CraftingStopWithDistance and isNearWorkbench()) then
                    craftingQueue[1].time = craftingQueue[1].time - 1

                    SendNUIMessage(
                        {
                            type = "addqueue",
                            item = craftingQueue[1].item,
                            time = craftingQueue[1].time,
                            id = craftingQueue[1].id
                        }
                    )

                    if craftingQueue[1].time == 0 then
                        TriggerServerEvent("core_crafting:itemCrafted", craftingQueue[1].item, craftingQueue[1].count)
                        table.remove(craftingQueue, 1)
                    end
                end
            end
        end
    end
)

function openWorkbench(val)
    ESX.TriggerServerCallback(
        "core_crafting:getXP",
        function(xp)
            SetNuiFocus(true, true)
            TriggerScreenblurFadeIn(1000)

            local inv = {}
            for _, v in ipairs(ESX.GetPlayerData().inventory) do
                inv[v.name] = v.count
            end

            local recipes = {}
            local esxp = exports.esx_xp:ESXP_GetRank()
--            print(esxp)

            if #val.recipes > 0 then
                for _, g in ipairs(val.recipes) do
                    recipes[g] = Config.Recipes[g]
                end
            else
                recipes = Config.Recipes
            end

            SendNUIMessage(
                {
                    type = "open",
                    recipes = recipes,
                    names = labels,
                    level = xp * 100, --esxp
                    inventory = inv,
                    job = job,
                    grade = grade,
                    hidecraft = Config.HideWhenCantCraft,
                    categories = Config.Categories
                }
            )
        end
    )
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)

            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            for _, v in ipairs(Config.Workbenches) do
                local dst = #(coords - v.coords)
                if dst < 20 then
                    DrawText3D(v.coords[1], v.coords[2], v.coords[3] - 0.8, Config.Text["workbench_hologram"])
                end
                if dst < 2 then
                    if IsControlJustReleased(0, Keys["E"]) then
                        local open = false
                        for _, g in ipairs(v.jobs) do
                            if g == job then
                                open = true
                            end
                        end

                        if open or #v.jobs == 0 then
                            openWorkbench(v)
                        else
                            SendTextMessage(Config.Text["wrong_job"])
                        end
                    end
                end
            end
        end
    end
)

RegisterNetEvent("core_crafting:craftStart")
AddEventHandler(
    "core_crafting:craftStart",
    function(item, count)
        local id = math.random(000, 999)
        table.insert(craftingQueue, {time = Config.Recipes[item].Time, item = item, count = 1, id = id})

        SendNUIMessage(
            {
                type = "crafting",
                item = item
            }
        )

        SendNUIMessage(
            {
                type = "addqueue",
                item = item,
                time = Config.Recipes[item].Time,
                id = id
            }
        )
    end
)

RegisterNetEvent("core_crafting:sendMessage")
AddEventHandler(
    "core_crafting:sendMessage",
    function(msg)
        SendTextMessage(msg)
    end
)

RegisterNUICallback(
    "close",
    function(data)
        TriggerScreenblurFadeOut(1000)
        SetNuiFocus(false, false)
    end
)

RegisterNUICallback(
    "craft",
    function(data)
        local item = data["item"]
        TriggerServerEvent("core_crafting:craft", item, false)
    end
)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100

    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)

        SetTextDropshadow(1, 1, 1, 1, 255)

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

Citizen.CreateThread(function()
	while true do
	    Wait(0)
        local v = GetHashKey(Config.ObjectsLoot)
		local player = GetPlayerPed(-1)
		local distanceobject = 2.2
		local obj = GetClosestObjectOfType(GetEntityCoords(player).x, GetEntityCoords(player).y, GetEntityCoords(player).z, distanceobject, v, false, true ,true)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(obj), true)
		if distance <= distanceobject then
		    local ObjectCoords = GetEntityCoords(obj)
		    ESX.Game.Utils.DrawText3D(ObjectCoords + vector3(0.0, 0.0, 0.5), '~c~PRESS ~b~[E]~c~ TO Craft', 1, 4)
		    if IsControlJustReleased(0, 38) then
                for _, r in ipairs(Config.Workbenches) do
                    openWorkbench(r)
                end
            end
        end
    end
end)

RegisterNetEvent('smoke:crafting')
AddEventHandler('smoke:crafting',function()
    local b=PlayerPedId()
    local c=GetEntityCoords(PlayerPedId())
--    local d=GetDistanceBetweenCoords(2952.8,5325.69,101.02,c.x,c.y,c.z)
    local d = 50
    if IsPedInAnyVehicle(b)then 
        exports['mythic_notify']:DoHudText('inform','This operation cannot be performed in the vehicle.')
    else 
        if d<100 then 
            crouch()
            TriggerEvent("mythic_progbar:client:progress",{name="craftsetup",duration=9000,label="The Table is being set up...",useWhileDead=false,canCancel=true,controlDisables={disableMovement=true,disableCarMovement=true,disableMouse=false,disableCombat=true}},function(e)if not e then TriggerEvent("mythic_progbar:client:progress",{name="equip",duration=4000,label="Gathering Equipment...",useWhileDead=false,canCancel=true,controlDisables={disableMovement=true,disableCarMovement=true,disableMouse=false,disableCombat=true}},function(e)if not e then else print("here")end end)else print("here")end;ClearPedTasks(PlayerPedId(-1))end)            
            Citizen.Wait(13000)
            TriggerServerEvent('smoke:create')
        else 
            exports['mythic_notify']:DoHudText('inform','You can camp only in designated areas.')
        end 
    end 
end)

RegisterNetEvent("smoke-craftspawn")
AddEventHandler("smoke-craftspawn",function(obj)
    local ped=PlayerPedId()
    local pos=GetEntityCoords(ped)
    local tbl=ObjToNet(CreateObjectNoOffset(GetHashKey(obj),pos.x-0.5,pos.y-0.5,pos.z-1.0,true,false))
end) 

function crouch()
    TaskStartScenarioInPlace(GetPlayerPed(-1),'world_human_gardener_plant',0,false)
end