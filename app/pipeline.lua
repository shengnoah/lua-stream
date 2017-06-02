local pipeline = {}

function pipeline.output(self, list, flg)
    if flg == 0 then
        return 
    end

    for k,v in pairs(list) do
        print(k,v)
    end
end

function pipeline.add(self, elements)
    self.element_list = elements
    self:output(elements, 0)
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
        if type(sink) == "table" then
            self:output(sink, 0)
        end
        src = sink
    end
end

return pipeline

