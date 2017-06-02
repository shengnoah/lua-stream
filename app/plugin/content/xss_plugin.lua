--local buffer = require "buffer"
local xss_plugin = {}

local src = {
    --args = buffer.get("rule_args")
   args="xss args"

}

local sink = {
    name = "xss_plugin",
    ver = "0.1"
}

function xss_plugin.output(self, list, flg)
    if flg == 0 then
        return 
    end 

    for k,v in pairs(list) do
        print(k,v)
    end 
end


function xss_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
        --print(k,v)
    end
end

function xss_plugin.init(self)
    self.source = src
    self.sink = sink
end

function xss_plugin.term(self, stream)
    for k,v in pairs(stream.metadata) do
        self.sink[k]=v
    end
end

function xss_plugin.action(self, stream) 
    for k,v in pairs(stream.metadata) do
        print(k,v)
    end
    --stream.metadata.data = stream.metadata.data.."append" 
    local tmp_data = stream.metadata.data
    --modified metadata.data
    stream.metadata.data = "append "..tmp_data 
    return self:term(stream)
end

function xss_plugin.match(self, param)
    self.sink['found_flg']=false
    for kn,kv in pairs(self.source) do
         self.sink[kn] = kv
    end
    self.sink['metadata'] = { data=self.source['data'].." xss_plugin add " }
    self:action(self.sink)
    return self.source, self.sink
end

return xss_plugin



