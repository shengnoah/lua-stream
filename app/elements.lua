local pipeline = require "pipeline"
local status = pipeline:new {
    require"plugin.content.httpsrc_plugin",
    require"plugin.content.blockip_plugin",
    require"plugin.content.xss_plugin",
    require"plugin.content.sql_plugin",
    require"plugin.content.cc_plugin",
}
local ret = pipeline:run()

