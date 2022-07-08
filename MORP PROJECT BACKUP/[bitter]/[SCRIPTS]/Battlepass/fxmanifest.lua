fx_version 'cerulean'
games { 'gta5' }

author 'Smoke'
description 'BattlePass System'
version '1.0.0'

server_scripts {
    "config.lua",
	"server/main.lua",
    '@mysql-async/lib/MySQL.lua',
}

client_scripts {
	"@NativeUILua_Reloaded/src/NativeUIReloaded.lua",
	"config.lua",
	"client/main.lua",
}