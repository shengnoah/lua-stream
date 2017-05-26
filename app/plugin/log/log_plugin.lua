local xss_rules = require "rules.xss_rules"
local xss_plugin = {}

function xss_plugin.init(self)
    self.rules=xss_rules
end


function xss_plugin.action(self, param) 
    print("xss_plugin:action")
end

function xss_plugin.match(self, param)
    self:init()
    print("xss_plugin:match")
    for k, v in pairs(self.rules) do
        for _,value in pairs(v) do
	    print(value)
	end
    end
end

return xss_plugin



