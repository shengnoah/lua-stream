local xss_plugin = require"plugin.content.xss_plugin"
local sql_plugin = require"plugin.content.sql_plugin"
local cc_plugin = require"plugin.content.cc_plugin"

local plugin_list= { 
    xss=xss_plugin,
    sql=sql_plugin,
    --cc=cc_plugin
}


return plugin_list
