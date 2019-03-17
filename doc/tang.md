
POST方法请求

```lua
local bjson = require "utils.bjson"
local app = require "blues"

app:post("/send", function(self)
    local t = bjson.decode(self.req.body)
    return t
end)

return app
```


curl -X POST http://0.0.0.0:8888/send -d '{"key":"value"}'

