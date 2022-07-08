ESX = nil   
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

local isJudge = false
local isPolice = false
local ismvd = false
local isMedic = false
local isDoctor = false
local isNews = false
local isDead = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}


rootMenuConfig =  {
    

--[[
    {
        id = "general",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"police:putinvehicle", "police:outofvehicle",  "cuffing:steal", "police:cuff", "police:uncuff", "police:drag", "cuffing:stealplayer", "general:wash", "general:emotes", "general:bills",'general:flipveh', 'house:housekey' }
    },]]

    {
        id = "general",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {'weapon:equipment', 'cred:menu', 'xp:check', 'ems:revive'}
    }, 

    {
        id = "crew",
        displayName = "Crew",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead 
        end,
        subMenus = {'crew:menu', 'crew:joincrew', 'crew:createcrew', 'crew:leftcrew' ,'crew:rank'}
    },

    {
        id = "animations",
        displayName = "Walking Styles",
        icon = "#walking",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
    },

    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },

    {
        id = "vehicle",
        displayName = "Vehicle Control",
        icon = "#vehicle",
        functionName = "veh:options",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },

    {
        id = "mechanic",
        displayName = "Mechanic",
        icon = "#mechanic",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            return not isDead
        end,
        subMenus = { "mech:inspect" ,"mech:tool"}
    },
	
	

    {
        id = "taxi",
        displayName = "Taxi-Bill",
        icon = "#ems-bill",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            return (not isDead and Data.job ~= nil and Data.job.name == "taxi")
        end,
        functionName = "menu:taxi",
        functionParameters =  { "billing" }
    },

    {
        id = "police",
        displayName = "Officer Actions",
        icon = "#police",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name == "police")
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name == "mvd")
            end
        end,
        subMenus = { "police:bill", "police:putinvehicle", "police:outofvehicle", "police:cuff", "police:uncuff", "police:drag", "police:officerisdown", "police:needhelp"}
    },
    
    {
        id = "police-check",
        displayName = "Officer Checks",
        icon = "#police-check",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name == "police")
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name == "mvd")
            end
        end,
        subMenus = {"police:checkbank", "police:search", 'police:mdt', "ems:billcustom", "police:clamp", "police:lock", "police:impound"} --, "police:bills" }
    },

    {
        id = "gang",
        displayName = 'Gang',
        icon = "#gang",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            return (not isDead and Data.job ~= nil and (Data.job.name == "vagos" or Data.job.name == "ballas" or Data.job.name == "unicorn" or Data.job.name == "grove" or Data.job.name == "marabunta" or Data.job.name == "families" or Data.job.name == "dealer" ))
        end,
        subMenus = { "police:putinvehicle", "police:outofvehicle",  "police:cuff", "police:uncuff", "police:drag","mechanic:hijack", "cuffing:steal"}
    },

    {
        id = "police-objects",
        displayName = "Police Objects",
        icon = "#police-objects",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name == "police")
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name == "mvd")
            end
        end,
        subMenus = { "police:cone", "police:barier", "police:light", 'police:deleteObject'}
    },

--[[
    {
        id = "sell_vehicle",
        displayName = "Sell Vehicle",
        icon = "#vehicle-sell",
        enableMenu =function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()))
        end,
        functionName = "MF_VehSales:SellCar"
    },
]]

    {
        id = "news",
        displayName = "News",
        icon = "#news",
        enableMenu =function()
            local Data = ESX.GetPlayerData()
            return (not isDead and Data.job ~= nil and Data.job.name == "reporter")
        end,
        subMenus = { "news:boom", "news:mic", "news:cam" }
    },

    {
        id = "ems",
        displayName = "EMS Actions",
        icon = "#ems-ambulance",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            return (not isDead and Data.job ~= nil and Data.job.name == "ambulance")
        end,
        subMenus = { "ems:bill", "ems:revive", 'ems:heal', "police:putinvehicle", "police:outofvehicle", 'police:drag'  }
    }
}

newSubMenus = {
    ['general:emotes'] = {
        title = "Animations",
        icon = "#more",
        functionName = "emotes:OpenMenu"
    },

    ['general:flipveh'] = {
        title = "Turning-vehicle",
        icon = "#general-flip-vehicle",
        functionName = "vehicle:flip"
    },

    ['weapon:equipment'] = {
        title = "Check Equipment",
        icon = "#general-flip-vehicle",
        functionName = "weapon:equip"
    },

    ['xp:check'] = {
        title = "Show XP",
        icon = "#general-flip-vehicle",
        functionName = "xp:checkop"
    },

    ['cred:menu'] = {
        title = "Open Zole Shop",
        icon = "#general-flip-vehicle",
        functionName = "cred:menuop"
    },

    ['crew:menu'] = {
        title = "Open Crew Menu",
        icon = "#general-flip-vehicle",
        functionName = "crew:menuop"
    },

    ['crew:rank'] = {
        title = "Check Rank",
        icon = "#general-flip-vehicle",
        functionName = "crew:rankop"
    },

    ['crew:joincrew'] = {
        title = "Join Crew",
        icon = "#general-flip-vehicle",
        functionName = "crew:joincrewop"
    },

    ['crew:createcrew'] = {
        title = "Create Crew",
        icon = "#general-flip-vehicle",
        functionName = "crew:createcrewop"
    },

    ['crew:leftcrew'] = {
        title = "Leave Crew",
        icon = "#general-flip-vehicle",
        functionName = "crew:leftcrewop"
    },

    ['crew:deletecrew'] = {
        title = "Delete Crew",
        icon = "#general-flip-vehicle",
        functionName = "crew:deletecrewop"
    },

    ["general:emotes"] = {
        title = "emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu",
    },

    ['general:bills'] = {
        title = "Reports",
        icon = "#police-bills",
        functionName = "esx_billing:openMenu"
    },

    -- Cuff
    ['cuffing:searchDeath'] = {
        title = "Look for a body",
        icon = "#cuffs-rob",
        functionName = "menu:loot",
    },

    ['cuffing:drag'] = {
        title = "Drag-player",
        icon = "#cuffs-drag",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police" and not IsPedInAnyVehicle(ped, true))
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd" and not IsPedInAnyVehicle(ped, true))
            end
        end,
        functionName = "menu:thief",
        functionParameters =  { "drag" }
    },

    ['cuffing:drag'] = {
        title = "Drag-player",
        icon = "#cuffs-drag",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police" and not IsPedInAnyVehicle(ped, true))
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd" and not IsPedInAnyVehicle(ped, true))
            end
        end,
        functionName = "menu:thief",
        functionParameters =  { "drag" }
    },

    ['cuffing:cuff'] = {
        title = "Search",
        icon = "#cuffs-cuff",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police" and not IsPedInAnyVehicle(ped, true))
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd" and not IsPedInAnyVehicle(ped, true))
            end
        end,
        functionName = "robPlayer",
        functionParameters =  { "cuff" }
    },
	
	['cuffing:stealplayer'] = {
        title = "Rob a player",
        icon = "#cuffs-cuff",
        functionName = "robPlayer",
        functionParameters =  { "cuff" }
    },

    ['cuffing:uncuff'] = {
        title = "Uncuff",
        icon = "#cuffs-uncuff",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police" and not IsPedInAnyVehicle(ped, true))
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd" and not IsPedInAnyVehicle(ped, true))
            end
        end,
        functionName = "menu:thief",
        functionParameters =  { "uncuff" }
    },

    ['cuffing:search'] = {
        title = "Search",
        icon = "#cuffs-search",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police" and not IsPedInAnyVehicle(ped, true))
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd" and not IsPedInAnyVehicle(ped, true))
            end
        end,
        functionName = "robPlayer",
        functionParameters =  { "search" }
    },

    --------------------------------------
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },

    ['mech:inspect'] = {
        title = "Inspect Vehicle",
        icon = "#mechanic",
        functionName = "mech:inspectop"
    },

    ['mech:tool'] = {
        title = "Use Tool Box",
        icon = "#mechanic",
        functionName = "mech:toolop"
    },

    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry"
    },

    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },

    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },

    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },

    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },

    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },

    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },

    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },

    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },

    ['animations:nonchalant'] = {
        title = "nonchalant",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
	
	['house:housekey'] = {
        title = "Give house key",
        icon = "#animation-nonchalant",
        functionName = "qb-houses:client:giveHouseKey"
    },


    ['animations:hobo'] = {
        title = "hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },

    ['animations:money'] = {
        title = "money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },

    ['animations:swagger'] = {
        title = "swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },

    ['animations:shady'] = {
        title = "shady",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },

    ['animations:maneater'] = {
        title = "maneater",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },

    ['animations:chichi'] = {
        title = "chichi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },

    ['animations:default'] = {
        title = "default",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },

    ["expressions:angry"] = {
        title="angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },

    ["expressions:drunk"] = {
        title="drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },

    ["expressions:dumb"] = {
        title="dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },

    ["expressions:electrocuted"] = {
        title="electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },

    ["expressions:grumpy"] = {
        title="grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },

    ["expressions:happy"] = {
        title="happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },

    ["expressions:injured"] = {
        title="injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },

    ["expressions:joyful"] = {
        title="joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },

    ["expressions:mouthbreather"] = {
        title="mouthbreather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },

    ["expressions:normal"]  = {
        title="normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },

    ["expressions:oneeye"]  = {
        title="oneeye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },

    ["expressions:shocked"]  = {
        title="shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },

    ["expressions:sleeping"]  = {
        title="sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },

    ["expressions:smug"]  = {
        title="smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },

    ["expressions:speculative"]  = {
        title="speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },

    ["expressions:stressed"]  = {
        title="stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },

    ["expressions:sulking"]  = {
        title="sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },

    ["expressions:weird"]  = {
        title="weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },

    ["expressions:weird2"]  = {
        title="weird2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
     },    


    --------------------------------------
    ["emotes:smoke"] = {
        title = "smoke",
        icon = "#emotes-smoke",
        functionName = 'menu:dpemotes:cmd',
        functionParameters =  { "emote" ,"smoke" }
    },

    ["emotes:lean"] = {
        title = "lean",
        icon = "#emotes-lean",
        functionName = 'menu:dpemotes:cmd',
        functionParameters =  { "emote" ,"lean" }
    },

    ["emotes:sitchair"] = {
        title = "sitchair",
        icon = "#emotes-sitchair",
        functionName = 'menu:dpemotes:cmd',
        functionParameters =  { "emote" ,"sitchair" }
    },

    ["emotes:dance"] = {
        title = "dance",
        icon = "#emotes-dance",
        functionName = 'menu:dpemotes:cmd',
        functionParameters =  { "dance" ,"dance" }
    },
   
    ["emotes:surr"] = {
        title = "surr",
        icon = "#emotes-surr",
        functionName = 'menu:dpemotes:cmd',
        functionParameters =  { "emote" , "surrender" }
    },

    --------------------------------------

    ['vehicle:callMechanic'] = {
        title = "callMechanic",
        icon = "#vehicle-callmec",
        functionName = "menu:general:callmechanic"
    },
	
	

    ['vehicle:engine'] = {
        title = "engine",
        icon = "#vehicle-engine",
        functionName = "menu:hotwire:openOwner"
    },

    ['vehicle:search'] = {
        title = "search",
        icon = "#vehicle-search",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police")
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd")
            end
        end,
        functionName = "menu:hotwire",
        functionParameters =  { "search" }
    },

    ['vehicle:hotwire'] = {
        title = "hotwire",
        icon = "#vehicle-hotw",
        enableMenu = function()
            local Data = ESX.GetPlayerData()
            if Data.job.name == "police" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "police")
            elseif Data.job.name == "mvd" then
                return (not isDead and Data.job ~= nil and Data.job.name ~= "ambulance" and Data.job.name ~= "mvd")
            end
        end,
        functionName = "menu:hotwire",
        functionParameters =  { "hotw" }
    },

    --------------------------------------
    
    ['police:cone'] = {
        title = "Cone",
        icon = "#object-cone",
        functionName = "police:client:spawnCone",
    },
    
    ['police:barier'] = {
        title = "Barier",
        icon = "#police",
        functionName = 'police:client:spawnBarier',
    },
    
    ['police:light'] = {
        title = "Light",
        icon = "#object-light",
        functionName = "police:client:spawnLight",
    },
        
    ['police:deleteObject'] = {
        title = "Remove",
        icon = "#object-delete",
        functionName = "police:client:deleteObject",
    },

    ['police:search'] = {
        title = "search",
        icon = "#police-search",
        functionName = "robPlayer"
    },
    ['police:checkbank'] = {
        title = "checkbank",
        icon = "#police-check-bank",
        functionName = "police:client:checkBank"
    },
    ['police:impound'] = {
        title = "impound",
        icon = "#police-jail",
        functionName = "impound"
    },

    ['police:bill'] = {
        title = "bill",
        icon = "#ems-bill",
        functionName = "police:client:fineMenu",
    },

    ['police:bills'] = {
        title = "bills",
        icon = "#police-bills",
        functionName = "police:client:finesMenu",
    },

    ['police:cuff'] = {
        title = "cuff",
        icon = "#police-cuff",
        functionName = "police:client:CuffPlayerSoft"
    },

    ['police:uncuff'] = {
        title = "uncuff",
        icon = "#police-uncuff",
        functionName = "police:client:UnCuffPlayer"
    },

    ['police:mdt'] = {
        title = "mdt",
        icon = "#police-mdt",
        functionName = "menu:police:mdt"
    },

    ['police:putinvehicle'] = {
        title = "putinvehicle",
        icon = "#general-put-in-veh",
        functionName = "police:client:PutPlayerInVehicle",
    },

    ['police:outofvehicle'] = {
        title = "outofvehicle",
        icon = "#general-unseat-nearest",
        functionName = "police:out:player",
    }, 
	
	['police:officerisdown'] = {
        title = "Officer Down",
        icon = "#police-drag",
        functionName = "OfficerDown",
    },
	
	['police:needhelp'] = {
        title = "10-32",
        icon = "#police-drag",
        functionName = "needbackup",
    },

    ['police:clamp'] = {
        title = "Seize Menu",
        icon = "#ems-bill",
        functionName = "clamp",
    },

    ['police:lock'] = {
        title = "lockpick",
        icon = "#police-jail",
        functionName = "lock"
    },

    ['police:drag'] = {
        title = "drag",
        icon = "#police-drag",
        functionName = "police:client:EscortPlayer",
    },

    --------------------------------------

    ['ems:bill'] = {
        title = "bill",
        icon = "#ems-bill",
        functionName = "menu:ems",
        functionParameters =  { "bill" }
    },

    ['ems:billcustom'] = {
        title = "billcustom",
        icon = "#ems-bill",
        functionName = "menu:ems",
        functionParameters =  { "billcustom" }
    },

    ['ems:revive'] = {
        title = "revive",
        icon = "#ems-revive",
        functionName = "menu:ems",
        functionParameters =  { "revive" }
    },

    ['ems:heal'] = {
        title = "heal",
        icon = "#ems-heal",
        functionName = "menu:ems",
        functionParameters =  { "heal" }
    },

    ['ems:drag'] = {
        title = "drag",
        icon = "#ems-drag",
        functionName = "Carry:Event"
    },

    ['ems:med'] = {
        title = "med",
        icon = "#ems-heal",
        functionName = "menu:ems",
        functionParameters =  { "medsystem" }
    },

    ['ems:putinvehicle'] = {
        title = "putinvehicle",
        icon = "#ems-putinveh",
        functionName = "menu:ems",
        functionParameters =  { "piv" }
    },

    --------------------------------------
	['news:boom'] = {
        title = "boom",
        icon = "#news-boom",
        functionName = "Mic:ToggleBMic"
    },

    ['news:cam'] = {
        title = "cam",
        icon = "#news-cam",
        functionName = "Cam:ToggleCam"
    },

    ['news:mic'] = {
        title = "mic",
        icon = "#news-mic",
        functionName = "Mic:ToggleMic"
    },


    --------------------------------------
    ["mechanic:bill"] = {
        title = "bill",
        icon = "#ems-bill",
        functionName = "mechanic:bill"
    },

    ["mechanic:lookupvehicle"] = {
        title = "lookupvehicle",
        icon = "#general-search",
        functionName = "menu:police:lookupvehicle"
    },

    ["mechanic:hijack"] = {
        title = "hijack",
        icon = "#mechanic-hijack",
        functionName = "esx_mechanicjob:onHijack",
    },
	
	["mechanic:clean"] = {
        title = "clean",
        icon = "#wash",
        functionName = "V:clean",
    },

    ["mechanic:repair"] = {
        title = "repair",
        icon = "#mechanic-repair",
        functionName = "mechanic:repair"
    },

    ["mechanic:wash"] = {
        title = "wash",
        icon = "#mechanic-wash",
        functionName = "mechanic:clean"
    },

    ["mechanic:impound"] = {
        title = "impound",
        icon = "#mechanic-impound",
        functionName = "menu:impound"
    },

    --------------------------------------
    ["accessories:mask"] = {
        title = "mask",
        icon = "#accessories-mask",
        functionName = 'esx_accessories:SetUnsetAccessory',
        functionParameters =  { "Mask" }
    },

    ["accessories:glasses"] = {
        title = "glasses",
        icon = "#accessories-glasses",
        functionName = 'esx_accessories:SetUnsetAccessory',
        functionParameters =  { "Glasses" }
    },

    ["accessories:helmet"] = {
        title = "helmet",
        icon = "#accessories-helmet",
        functionName = 'esx_accessories:SetUnsetAccessory',
        functionParameters =  { "Helmet" }
    },

    ["accessories:ears"] = {
        title = "ears",
        icon = "#accessories-ears",
        functionName = 'esx_accessories:SetUnsetAccessory',
        functionParameters =  { "Ears" }
    }
}


function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end

