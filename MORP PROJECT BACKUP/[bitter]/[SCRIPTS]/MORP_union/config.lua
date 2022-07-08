Config = {}

--[[
	Discord Config is inside server/main.lua
]]--

-- Main config
Config.GrabKey = 38 -- Key for release the gold trolley (E).
Config.MinPolice = 0 -- Min Police online to start robbery.
Config.PoliceJobName = 'police' -- Just in case your police job is named different.
Config.Account = 'black_money' -- Just in case your server uses a different name for dirty money.
Config.MoneyTrolley = 10000 -- Amount of cash player will receive per trolley (4 in total), you can use math.random(minimum,maximum).
Config.TriggerAlarm = true -- Set False if you don't want the alarm sound when vault gets hacked.
Config.Blips = true -- Shows the start location on map.
Config.PoliceBlip = true -- Show Blip for Police when robbery starts.


-- Stockade Door, Spawn Position and Item
Config.StockadeDoor = {x = 1005.9342041016, y = -1556.1557617188, z = 30.812805175781, h = 99.10}
Config.StockadeSpawn = {x = 999.98, y = -1556.13, z = 30.76, h = 356.97}
Config.StockadeItem = true -- Ask for an item to spawn the Stockade?
Config.StockadeItemName = 'green_keycard' -- Item needed for spawn Stockade

-- Hacking Options
Config.HackBlocks = 4 -- Number of blocks per side
Config.HackTime = 20 -- Time before hacking minigame ends

-- C4 & Thermite Config
Config.Tunnel = true -- False if you don't want players be able to escape thru the tunnel using C4.
Config.C4ItemName = 'c4' -- Name of item needed to explode the wall.
Config.C4Time = 60 -- Countdown before the C4 explodes (1 min by default).
Config.CooldownTime = 3600 -- Time before the robbery can be triggered again (1 hour by default).
Config.ThermiteItemName = 'thermite'

Config.Lang = {
-- Notifications	
	['cooldown_active'] = "There's no one available at the moment",
	['missing_keycard'] = "You need a keycard",
	['parking_spot'] = "Please clear the parking spot",
	['mission_started'] = "Drive to Union Depository Garage and rob the vault", -- 
	['no_c4'] = "You need C4",
	['money'] = "You stole $",
	['grab_trolley'] = "Grab",
	['countdown'] = "seconds left",
	
-- 3D Text
	['knock_door'] = "Press ~r~[H]~w~ to knock door",
	['open_trunk'] = "Press ~r~[H]~w~ to open trunk",
	['elevator'] = "Press ~r~[H]~w~ to use Elevator",
	['vault_hack'] = "Press ~r~[H]~w~ to Hack",
	['use_thermite'] = "Press ~r~[H]~w~ to use Thermite",
	['trolley_loot'] = "Press ~r~[H]~w~ to Loot",
	['police_vault'] = "Press ~r~[H]~w~ to close the vault",
	['use_c4'] = "Press ~r~[H]~w~ to use C4",
	
-- Police Notification
	['rob_progress'] = "Robbery on progress at Union Depository",
	['rob_c4'] = "Civs reported an explosion inside construction tunnel near Pillbox Hill",
	['rob_cancelled'] = "Robbery at Union Depository got cancelled",
	['rob_blip'] = "Robbery at progress",
}

Config.Doors = {
	door1 = {x = 2.266483, y = -678.5509, z = 15.3586, xt = 1.138, yt = -679.074, zt = 15.130, locked = true},
	door2 = {x = 4.278027, y = -673.0237, z = 15.3586, xt = 3.006, yt = -673.557, zt = 15.130, locked = true},
	door3 = {x = -2.989136, y = -676.6403, z = 15.3586, xt = -2.501, yt = -677.598, zt = 15.130, locked = true},
	door4 = {x = -0.9774065, y = -671.1132, z = 15.3586, xt = -0.349, yt = -672.062, zt = 15.130, locked = true}
}