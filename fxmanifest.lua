fx_version 'cerulean'
game 'gta5'

author 'Geza88'
description 'Give New Owned Vehicle to Player'
version '1.0.0'

client_script 'client.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}

shared_script '@es_extended/imports.lua'
