local sql_rules = require"rules.sql_rules"

local sql_plugin = {}

local src  = {
    args = "sql_args"
}
local sink = {
    name = "sql_plugin",
    ver = "0.1"
}

function sql_plugin.push(self, stream) 
    print("sql_plugin:push "..type(stream.metadata))
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
        print(k,v)
    end
end

function sql_plugin.init(self)
    self.rules=sql_rules
    self.source = src 
    self.sink = sink
end

function sql_plugin.action(self, param) 
end

function sql_plugin.match(self, param)
    for k, v in pairs(self.rules) do
        for _,value in pairs(v) do
            --print(value)
        end 
    end
    self.sink['metadata'] = { data=self.source['data'] }
    self:action(self.sink)
    return self.source, self.sink
end

return sql_plugin



