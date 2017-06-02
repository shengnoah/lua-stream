local plugin_list = require "plugin_config"

local pipeline = {}

function pipeline:start(params)
    local src = {
        metadata= { 
            data="http data"
        }
    }
    for k,v in pairs(plugin_list) do
        v:init()
        v:push(src)
        src, sink = v:match('params')
        print("[s]====================")
---[[
        if type(sink) == "table" then
            for key, value in pairs(sink) do
                print(key, value)
            end
        end
--]]
        print("[e]====================")
        src = sink
    end
end

return pipeline:start("params")
