```lua
local bjson = require "utils.bjson"
local app = require "blues"
```

GET方法请求
```
app:get("/tang", function(self)
    return "tang"
end)
```

POST方法请求
```lua

app:post("/send", function(self)
    local t = bjson.decode(self.req.body)
    return t
end)

return app
```

客户端调用方式
```
curl -X POST http://0.0.0.0:8888/send -d '{"key":"value"}'
```
