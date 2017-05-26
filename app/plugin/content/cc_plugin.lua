local cc_rules = require"rules.sql_rules"

local cc_plugin = {}

function cc_plugin.push(self, param) 
    print("cc_plugin:push "..type(param))
end

function cc_plugin.init(self)
    self.rules=cc_rules
end

function cc_plugin.action(self, param) 
    print("cc_plugin:action")
end

function cc_plugin.match(self, param)
    self:init()
    print("cc_plugin:match")
    for k, v in pairs(self.rules) do
        for _,value in pairs(v) do
            --print(value)
            --if regular ~= "" and ngx.re.find(params, regular, "jo") then
            --end 
        end 
    end 
end

return cc_plugin



