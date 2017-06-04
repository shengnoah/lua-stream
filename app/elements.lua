local pipeline = require "pipeline"

local xss_plugin = require"plugin.content.xss_plugin"
local sql_plugin = require"plugin.content.sql_plugin"
local cc_plugin = require"plugin.content.cc_plugin"
local httpsrc_plugin = require"plugin.content.httpsrc_plugin"

local plugin_list= { 
    xss=xss_plugin,
    sql=sql_plugin,
    cc=cc_plugin,
    httpsrc=httpsrc_plugin,
}

pipeline:add(plugin_list)
pipeline:run()

