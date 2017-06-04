local pipeline = require "pipeline"

local xss_plugin = require"plugin.content.xss_plugin"
local sql_plugin = require"plugin.content.sql_plugin"
local cc_plugin = require"plugin.content.cc_plugin"
local httpsrc_plugin = require"plugin.content.httpsrc_plugin"

local plugin_list= { 
    httpsrc_plugin,
    xss_plugin,
    sql_plugin,
    cc_plugin,
}
pipeline:add(plugin_list)
pipeline:run()

