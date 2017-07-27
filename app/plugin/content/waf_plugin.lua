local buffer = require "buffer" 
local bjson = require "utils.bjson" 


local waf_plugin = {}

local src = {
   args="route args"
}

local sink = {
    name = "route_plugin",
    ver = "0.1"
}

function waf_plugin.output(self, list, flg)
    if flg == 0 then return end
    for k,v in pairs(list) do print(k,v) end
end


function waf_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function waf_plugin.init(self)
    self.source = src
    self.sink = sink
end

function waf_plugin.action(self, stream) 
    local rules = bjson.loadf("./app/data/waf_plugin_rules.rule", env) 
    local meta = bjson.decode(rules)

    for k,v in pairs(meta) do
        local rulematch = ngx.re.find
        if rulematch(stream.request.url, v['RuleItem'], "jo") then
            ngx.say(rulematch(stream.request.url, v['RuleItem'], "jo"))
        end
    end
    return self.source,  self.sink  
end

function waf_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
    self:action(self.sink)
    return self.source, self.sink
end

return waf_plugin
