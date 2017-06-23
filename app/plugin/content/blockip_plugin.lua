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
    local buffer = require "buffer"
    local blockip_list = buffer.gett("blockip_list")

    for k,v in pairs(blockip_list) do
        if v['RuleItem'] == stream.request.ip then
            ngx.say('blockip')
        end
    end

    for k,v in pairs(self.ip_list) do
        if v == stream.request.ip then
            --ngx.say('blockip')
            --ngx.exit(404)
        end
    end
end

function blockip_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
    self:action(self.sink)
    return self.source, self.sink
end

return blockip_plugin



