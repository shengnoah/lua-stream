local pipeline = require "pipeline"

local status = pipeline:new {
    xss_plugin = require"plugin.content.xss_plugin",
    sql_plugin = require"plugin.content.sql_plugin",
    cc_plugin = require"plugin.content.cc_plugin",
    httpsrc_plugin = require"plugin.content.httpsrc_plugin",
    blockip_plugin = require"plugin.content.blockip_plugin",
}

local ret = pipeline:run()

