--local cc_rules = require"rules.sql_rules"

local blockip_plugin = {}

local src = {
   args="blockip args"
}

local sink = {
    name = "blockip_plugin",
    ver = "0.1"
}

local ip_list = {
    '218.30.113.34',
    '127.0.0.1'
}

function blockip_plugin.output(self, list, flg)
    if flg == 0 then return end
    for k,v in pairs(list) do print(k,v) end
end


function blockip_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function blockip_plugin.init(self)
    self.source = src
    self.sink = sink
    self.ip_list = ip_list
end

function blockip_plugin.action(self, stream) 
    for k,v in pairs(self.ip_list) do
        if v == stream.request.ip then
            ngx.say("block")
        end
    end
    --self.sink['request']['ip'] = '127.0.0.1'
end

function blockip_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
    self.sink['metadata'] = { data=self.source['data'].." cc_plugin add " }
    self:action(self.sink)
    return self.source, self.sink
end

return blockip_plugin



