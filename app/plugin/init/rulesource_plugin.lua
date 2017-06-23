local buffer = require "buffer"
local bjson = require "utils.bjson"

local src = {
    args = bjson.loadf("./app/data/rules/args.rule", env)
}

local sink = nil

local rulesource_plugin = {}

function rulesource_plugin.init(self)
    self.source = src 
    self.sink = sink
end

function rulesource_plugin.action(self, param) 
    self:init()
    local t = bjson.decode(self.source['args'])
    buffer.sett("rule_args", t)
    return self.source,  self.sink
end

function rulesource_plugin.match(self, param)
end

return rulesource_plugin:action("param")



