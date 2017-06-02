local pipeline = {}

function pipeline.add(self, elements)
    self.element_list = elements
    for k,v in pairs(self.element_list) do
        print(k,v)
    end
end

function pipeline.run(self)
    local src = {
        metadata= { 
            data="http data"
        }
    }
    for k,v in pairs(self.element_list) do
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

--return pipeline:start("params")
return pipeline

