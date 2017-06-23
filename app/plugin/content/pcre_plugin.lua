local pcre_plugin = {}

local src = {
   args="pcre args"
}

local sink = {
    name = "pcre_plugin",
    ver = "0.1"
}

function pcre_plugin.output(self, list, flg)
    if flg == 0 then return end
    for k,v in pairs(list) do print(k,v) end
end


function pcre_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function pcre_plugin.init(self)
    self.source = src
    self.sink = sink
    self.ip_list = ip_list
end

function pcre_plugin.action(self, stream) 
    ngx.say(stream.request.url)
    local pcre = require 'rex_pcre'
    local ret = pcre.find(stream.request.url,'UserName=(.*%5C)?(?:user1)(%40.*|@.*|)&UserId=123456789')

    local buffer = require "buffer"
    local bjson = require "utils.bjson"


    local json_text = bjson.loadf("./app/data/rules/whiteip.rule", env)
    local t = bjson.decode(json_text)

    buffer.sett("r1", t)
    meta = buffer.gett("r1")
    ngx.say(bjson.pprint(meta))

    for k,v in pairs(meta) do 
        ngx.say(v['RuleItem'])
        local ret = pcre.find(stream.request.url,v['RuleItem'])        
        ngx.say(ret)
        if ret then 
            ngx.say(v['RuleType'])
        end
    end
end

function pcre_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
    self:action(self.sink)
    return self.source, self.sink
end

return pcre_plugin
