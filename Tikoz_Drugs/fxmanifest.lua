fx_version('cerulean')
games({ 'gta5' })

server_scripts({
    "server.lua"
});

client_scripts({
    "dependencies/pmenu.lua",
    "config.lua",
    "client/weed.lua",
    "client/coke.lua",
    "client/meth.lua",
    "client/opium.lua"
});