resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/index.html"

client_scripts {
	"lang/*",
	"config.lua",
	"client_utils.lua",
	"client.lua"
}

server_scripts {
	-- "@vrp/lib/utils.lua",
	"@mysql-async/lib/MySQL.lua",

	"lang/*",
	"config.lua",
	"server.lua",
	"server_utils.lua",
}

files {
	"nui/lang/*",
	"nui/images/*",
	"nui/images/items/*",
	"nui/images/banner/*",
	"nui/font/*",
	"nui/script.js",
	"nui/jquery-3.5.1.min.js",
	"nui/style.css",
	"nui/transition.css",
	"nui/index.html"
}