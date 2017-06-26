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
    return 'rule'
end)


app:get("/json", function(self)
    local ret = self.request.params.body
    local t = bjson.decode(ret)
    return t    
end)


app:get("/getjson", function(self)
    return self:json()
end)

app:get("/rest", function(self)
    local http = require "resty.http"
    local httpc = http.new()
    local res, err = httpc:request_uri("http://lua.ren")
    if res.status == ngx.HTTP_OK then
        ngx.header['Content-Type'] = 'text/html; charset=UTF-8'
        ngx.say(res.body)
    else
        ngx.exit(res.status)
    end
    --return "test"
end)



app:get("/pipe", function(self)
    local element = require "elements"
    element:run()
end)

return app
