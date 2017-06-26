local html_plugin = {}

local src = {
   args="HTML ARGS"
}

local sink = {
    name = "HTML_PLUGIN",
    ver = "0.1"
}

function html_plugin.output(self, list, flg)
    if flg == 0 then return end
    for k,v in pairs(list) do print(k,v) end
end


function html_plugin.push(self, stream) 
    for k,v in pairs(stream.metadata) do
        self.source[k]=v
    end 
end

function html_plugin.init(self)
    self.source = src
    self.sink = sink
    self.ip_list = ip_list
end

function html_plugin.action(self, stream)
    local http = require "resty.http"
    local httpc = http.new()
    local res, err = httpc:request_uri("http://lua.ren")
    if res.status == ngx.HTTP_OK then
        ngx.header['Content-Type'] = 'text/html; charset=UTF-8'
        ngx.say(res.body)
    else
        ngx.exit(res.status)
    end
   -- ngx.say(stream.request.url)
end

function html_plugin.match(self, param)
    self.sink['found_flg']=false
    for k,v in pairs(self.source) do
         self.sink[k] = v
    end
 
    self:action(self.sink)
    return self.source, self.sink
end

return html_plugin
