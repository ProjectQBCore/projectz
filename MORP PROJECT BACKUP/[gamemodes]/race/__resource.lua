fx_version 'cerulean'
game 'gta5'


resource_type 'gametype' { name = 'Race' }

dependencies {
    "spawnmanager",
    "mapmanager"
}

client_script 'race_client.lua'
server_script 'race_server.lua'
