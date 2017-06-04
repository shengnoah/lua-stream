--local cc_rules = require"rules.sql_rules"
local httpsrc_plugin = {}
local src = {
   args="httpsrc args"
}

local sink = {
    name = "httpsrc_plugin",
    ver = "0.1"
}

function httpsrc_plugin.output(self, list, flg)
    if flg == 0 then
        return
    end

    for k,v in pairs(list) do
        print(k,v)
    end
end


function httpsrc_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function  httpsrc_plugin.init(self)
    self.source = src
    self.sink = sink
end

function httpsrc_plugin.action(self, stream) 
    for k,v in pairs(stream.request) do
       print(k,v)
    end
    local params = require "nginx"
    self.sink['request']['url'] = params['cmd_url']
    self.sink['request']['ip'] = '127.0.0.1'
--    self.sink['metadata'] = { data=self.source['data'].." httpsrc add ",uri="http://candylab.net" }
end

function  httpsrc_plugin.match(self, param)
    self.sink['found_flg']=false
    for kn,kv in pairs(self.source) do
         self.sink[kn] = kv
    end
    self.sink['metadata'] = { data=self.source['data'].." httpsrc add " }
    self:action(self.sink)
    return self.source, self.sink
end

return  httpsrc_plugin



