-- Manifest Version
fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files {
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
    'client/html/sounds/demo.ogg',
    'client/html/sounds/cuff.ogg',
	
	'client/html/sounds/lock.ogg',
	'client/html/sounds/unlock.ogg',
	'client/html/sounds/lock2.ogg',
	'client/html/sounds/unlock2.ogg',
    'client/html/sounds/lockpick.ogg',
    'client/html/sounds/ATTENTION_ALL_UNITS_GENERIC_01.ogg',
	"client/html/sounds/zmoan01.ogg",
	"client/html/sounds/zmoan02.ogg",
	"client/html/sounds/zmoan03.ogg",
	"client/html/sounds/zmoan04.ogg",
	"client/html/sounds/groan.ogg",
	"client/html/sounds/groan2.ogg",
	"client/html/sounds/groan3.ogg",
	"client/html/sounds/groan4.ogg",
	"client/html/sounds/groan5.ogg",
	"client/html/sounds/groan6.ogg",
	"client/html/sounds/lowgroan.ogg",
	"client/html/sounds/lowgroan2.ogg",
	"client/html/sounds/alerted.ogg",
}


