fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0.0'
repository 'https://github.com/Mythic-Framework/mythic-weed'
client_script "@mythic-base/components/cl_error.lua"
client_script "@mythic-pwnzor/client/check.lua"


client_scripts {
    'config/cl_*.lua',
    'client/**/*.lua',
}

shared_scripts {
    'config/sh_*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'config/sv_*.lua',
    'server/**/*.lua',
}
