ESX = nil
local final = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('kill_log:playerDied')
AddEventHandler('kill_log:playerDied', function(v1, name, serveridd, reason, v2, v3, weapon)
    local user = ESX.GetPlayerFromId(serveridd)

    MySQL.Async.fetchAll('SELECT * FROM users where identifier = @user', { 
        ['@user'] = user.identifier 
    }, function(result)
		final = result[1]

        if reason == 'suicide' then
            MySQL.Async.execute('UPDATE users SET suicide = @suicide, death = @death WHERE identifier = @identifier', {
                ['@identifier'] = user.identifier,
                ['@death'] = final.death + 1,
                ['@suicide'] = final.suicide + 1
            })
        else
            MySQL.Async.execute('UPDATE users SET death = @death WHERE identifier = @identifier', {
                ['@identifier'] = user.identifier,
                ['@death'] = final.death + 1
            })
        end

	end)
end)

RegisterNetEvent('morp_leaderboard:onKillS')
AddEventHandler('morp_leaderboard:onKillS', function(serveridr)
    local user = ESX.GetPlayerFromId(serveridr)

    MySQL.Async.fetchAll('SELECT * FROM users where identifier = @user', { 
        ['@user'] = user.identifier 
    }, function(result)
		final = result[1]

        MySQL.Async.execute('UPDATE users SET kills = @kills WHERE identifier = @identifier', {
            ['@identifier'] = user.identifier,
            ['@kills'] = final.kills + 1
        })
    
        print('kill updated')
	end)

    TriggerClientEvent('morp_leaderboard:onKillC', user)
    print('triggered event')
    
end)

--------------------------------------UPTO HERE READY------------------------------------------------