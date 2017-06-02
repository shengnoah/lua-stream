--local cc_rules = require"rules.sql_rules"

local cc_plugin = {}

local src = {
   args="cc args"
}

local sink = {
    name = "cc_plugin",
    ver = "0.1"
}

function cc_plugin.output(self, list, flg)
    if flg == 0 then
        return
    end

    for k,v in pairs(list) do
        print(k,v)
    end
end


function cc_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function cc_plugin.init(self)
    self.source = src
    self.sink = sink
end

function cc_plugin.action(self, stream) 
    for k,v in pairs(stream.metadata) do
        print(k,v)
    end
end

function cc_plugin.match(self, param)
    self.sink['found_flg']=false
    for kn,kv in pairs(self.source) do
         self.sink[kn] = kv
    end
    self.sink['metadata'] = { data=self.source['data'].." cc_plugin add " }
    self:action(self.sink)
    return self.source, self.sink
end

return cc_plugin



