-- https://dz-security.live/discord/

local Users = {}
local Players = {}

local points = nil
local kills = nil
local deaths = nil
local kda = nil
local suicide = nil
local deathsp = nil
local master = nil

local kill = nil
local mem = nil
local id = nil 
local playtime = 0

RegisterNetEvent('ys-scoreboard:load')
AddEventHandler('ys-scoreboard:load', function()
    local src = source
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifier = v
            local first = identifier:gsub("discord:", "")
            identifier = first
        end
    end

    if identifier ~= nil then
        local identifierArgs = identifier
        local Finalidentifier = identifierArgs:gsub("discord:", "")
        identifier = tonumber(Finalidentifier)
        PerformHttpRequest("https://discordapp.com/api/guilds/" .. DZ.GuildID .. "/members/"..identifier, function(error, result, header)
            local result = json.decode(result)
            local url = "https://cdn.discordapp.com/avatars/"..result["user"]["id"].."/"..result["user"]["avatar"].."?size=128"
            local username = result["user"]["username"].."#"..result["user"]["discriminator"]
            Users[src] = {id = src, avatar = url, name = username}
        end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot " .. DZ.DiscordBotToken})
    else
      Users[src] = {id = src, avatar = "https://discordapp.com/assets/7c8f476123d28d103efe381543274c25.png", name = GetPlayerName(src)}
    end
end)

AddEventHandler('playerDropped', function()
    Users[source] = nil
end)

RegisterNetEvent('ys-scoreboard:getPlayers')
AddEventHandler('ys-scoreboard:getPlayers', function(live)
    local src = source
    local data = {}
    local PlayerNum = GetNumPlayerIndices()
    local StaffNum = 0

    for k,v in pairs(Users) do
	    table.insert(data, {image = v.avatar, name = v.name, ping = GetPlayerPing(v.id), Players = #GetPlayers()})
        TriggerEvent("es:getPlayerFromId", k, function(user)
            if user.getGroup() ~= "user" then
                StaffNum = StaffNum + 1
            end
        end)
    end

    leaderboard(data)

    if live then
        TriggerClientEvent('ys-scoreboard:live', src, data, PlayerNum, StaffNum)
    else
        TriggerClientEvent('ys-scoreboard:open', src, data, PlayerNum, StaffNum)
    end
end)

------------------------------- here ------------------------

function leaderboard(val)

    MySQL.Async.fetchAll('SELECT * FROM users', {}, function(result)
		final = result[1]

        kills = final.kills
        deaths = final.death
        kda = kills / deaths
        suicide = final.suicide
        deathsp = deaths - suicide
        points = kills - deathsp 
        master = final.name

        TriggerClientEvent('leaderboard:data', -1, final, master, kills, kda, deaths, playtime, val)
    
        print('Data Recieved')
	end)
    MySQL.Async.fetchAll('SELECT * FROM ranking_crew', {}, function(res)
        fin = res[1]

        kill = fin.kills
        mem = fin.members
        id = fin.name

        TriggerClientEvent('leaderboard:crewdata', -1, fin, id, kill, mem)
    end)
end 