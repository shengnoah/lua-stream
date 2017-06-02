local sql_rules = require"rules.sql_rules"

local sql_plugin = {}

local src  = {
    args = "sql_args"
}
local sink = {
    name = "sql_plugin",
    ver = "0.1"
}

function sql_plugin.output(self, list, flg)
    if flg == 0 then
        return 
    end 

    for k,v in pairs(list) do
        print(k,v)
    end 
end

function sql_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end
end

function sql_plugin.init(self)
    self.rules=sql_rules
    self.source = src 
    self.sink = sink
end

function sql_plugin.action(self, stream) 
    for k,v in pairs(stream.metadata) do
        print(k,v)
    end 
end

function sql_plugin.match(self, param)
    for k, v in pairs(self.rules) do
        for _,value in pairs(v) do
            --print(value)
        end 
    end
    self.sink['metadata'] = { data=self.source['data'].." sql_plugin add" }
    self:action(self.sink)
    return self.source, self.sink
end

return sql_plugin



