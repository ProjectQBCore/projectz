ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	RequestWeaponAsset(GetHashKey("weapon_flare")) -- flare won't spawn later in the script if we don't request it right now
    while not HasWeaponAssetLoaded(GetHashKey("weapon_flare")) do
        Wait(0)
    end

end)

-- ===================ESX LOAD==================

RegisterNetEvent('smoke_flare:useItem')
AddEventHandler('smoke_flare:useItem', function()
	local playerCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 10.0, 0.0)

	ShootSingleBulletBetweenCoords(playerCoords, playerCoords - vector3(0.0001, 0.0001, 0.0001), 0, false, GetHashKey("weapon_flare"), 0, true, false, -1.0)
	
	local weapon = Config.weapons[math.random(1, #Config.weapons)]
	local ammo = math.random(100, 250)
	local roofCheck = true
	local planeSpawnDistance = 400

	TriggerEvent("crateDrop", weapon, ammo, roofCheck, planeSpawnDistance, {["x"] = playerCoords.x, ["y"] = playerCoords.y, ["z"] = playerCoords.z}) --args[1], tonumber(args[2]), args[3] or false, args[4] or 400.0, {["x"] = playerCoords.x, ["y"] = playerCoords.y, ["z"] = playerCoords.z})

	Wait()

	while DoesObjectOfTypeExistAtCoords(parachuteCoords, 10.0, GetHashKey("w_am_flare"), true) do
        Wait(0)
        local prop = GetClosestObjectOfType(parachuteCoords, 10.0, GetHashKey("w_am_flare"), false, false, false)
        RemoveParticleFxFromEntity(prop)
        SetEntityAsMissionEntity(prop, true, true)
        DeleteObject(prop)
    end

	RemoveWeaponAsset(GetHashKey("weapon_flare"))

end)

-- Notif("~c~YOU ~g~LEFT ~c~A TOXIC ZONE")
function Notif( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end