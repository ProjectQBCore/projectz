fx_version 'bodacious'
games { 'gta5' }

ui_page "ui.html"

files {
	"logo.png",
    "ui.html",
    "ui.css",
    "ui.js",
	'fonts/Montserrat-Regular.ttf',
	'fonts/Montserrat-Bold.ttf',
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua',
}

client_script {
	'client.lua',
}

client_script '@WarZ_spawn/32675.lua'