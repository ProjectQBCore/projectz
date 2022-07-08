fx_version 'adamant'

game 'gta5'

description 'Disc Base'

version '1.1.0'

client_scripts {
    'client/main.lua',
    'utils.lua',
    'config.lua',
    'shared/sh_queue.lua',
    'client/markers.lua'
}

server_scripts {
    'utils.lua',
    'config.lua',
    'server/items.lua',
    'server/main.lua',
    'server/cron.lua',
    'shared/sh_queue.lua',
    'server/sv_queue_config.lua',
    'connectqueue.lua'
}
