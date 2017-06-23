require "log"
local HiLog = require "HiLog"
local utils = require "utils.utils"
local buffer = require "buffer"

local bjson = require "utils.bjson"
local app = require "blues"


app:get("/rule", function(self)
    ngx.say(self.app_id)
    self.app_id = 6
    ngx.say(self.app_id)
end)


app:get("/json", function(self)
    local ret = self.request.params.body
    local t = bjson.decode(ret)
    return t    
end)


return app
