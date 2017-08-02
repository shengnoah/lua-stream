local header_plugin = {}

local src = {
   args="pcre args"
}

local sink = {
    name = "pcre_plugin",
    ver = "0.1"
}

function header_plugin.output(self, list, flg)
    if flg == 0 then return end
    for k,v in pairs(list) do print(k,v) end
end


function header_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function header_plugin.init(self)
    self.source = src
    self.sink = sink
    self.ip_list = ip_list
end

function header_plugin.action(self, stream) 
    for k,v in pairs(stream.request.headers) do
	ngx.log(ngx.ERR, "###["..k..":"..v.."]###")	
    end
    if stream.request.headers['key'] then
        ngx.log(ngx.ERR, "###["..stream.request.headers['key'].."]###")
    end
    
    if not stream.request.headers['key'] then
        local tpl = require "render"
        ngx.header['Content-Type'] = 'text/html; charset=UTF-8'
        ngx.say(tpl.render("waff.html", {timestamp=ngx.localtime()}))
    end
end

function header_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
    self:action(self.sink)
    return self.source, self.sink
end

return header_plugin
