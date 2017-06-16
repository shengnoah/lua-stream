require "log"
local HiLog = require "HiLog"
local utils = require "utils.utils"
local json = require "cjson"
local buffer = require "buffer"
local bjson = require "utils.bjson"
local Application = require "orc"
app = Application.new()
--local rulesource = require "init.rulesource_plugin"
--local xss_plugin= require "init.rulesource_plugin"


app:get("/rule", function(request,id)
    local ret = buffer.get("init_args123456")
    ngx.say(ret)
end)

app:get("/decode", function(request,id)
    ngx.say("==============")
    local t = utils:to_json(request)
    return t 
end)

app:get("/hilua", function(request,id)

    meta_info = { 
        key = "test key:",
        values = { 
            k = "key",
            v = "value"
        },  
        testcase = "null"
    }

    --ngx.say(utils:pprint(meta_info))
    --ret = HiLog:log()
    --ngx.say(ret)
    --ngx.say(request.params.body)
    local ret = request.params.body
    ngx.say(ret)
    local json = require "cjson"
    local util = require "cjson.util"
    local t = json.decode(ret)
    ngx.say(util.serialise_value(t))
    --ngx.say(request.params.cmd_url)
    --return {k='key', v='value'}
    --return ret
    return t
     
end)


app:get("/blockip", function(request,id)
    --ngx.say(request.params['cmd_url'])
    require "elements"
end)

app:get("/json", function(request,id)
    local json = require "cjson"
    local util = require "cjson.util"

    --local json_text = util.file_load("./app/data/rules/url.rule", env)
    local json_text = util.file_load("./app/data/rules/test.rule", env)
    local t = bjson.decode(json_text)
    ngx.say(util.serialise_value(t))


    function write_rule(var, rule)
        ngx.say("testcase")
        rulepath = "/home/tangguo/lab/hiwaf/app/data/rules/testcase"  
        file = io.open(rulepath,"aw")
        if file==nil then
            return
        end
   
        ret = file:write(rule)
        ngx.say(ret)
        
        file:close()
        return(t)
    
    end

    local graylog = {fields='username', limit=3, query='*', from='2017-01-05 00:00:00', to='2017-01-06 00:00:00', filter='streams'}
    --local graylog = {stream="123", input="abc", status={a=1,b=2}}
    local jsondata = json.encode(graylog)
    write_rule("testcase", jsondata )    
    ngx.say(type(jsondata))
    ngx.say(jsondata)


    --local json_text = util.file_load("./app/data/rules/testcase", env)
    --local t = json.decode(json_text)
    --ngx.say(util.serialise_value(t))


end)

app:get("/getrule", function(request,id)
    local meta = buffer.gett("rule") 
    ngx.say(bjson.pprint(meta))
end)

app:get("/data", function(request,id)
    local json_text = bjson.loadf("./app/data/rules/whiteip.rule", env)
    local t = bjson.decode(json_text)

    buffer.sett("r1", t)
    meta = buffer.gett("r1")
    ngx.say(bjson.pprint(meta))
end)

app:get("/http", function(request,id)


      local http = require "resty.http"
      local httpc = http.new()
      local res, err = httpc:request_uri("http://www.baidu.com", {
        method = "GET",
        body = "a=1&b=2",
        headers = {
          ["Content-Type"] = "application/x-www-form-urlencoded",
        }
      })

      if not res then
        ngx.say("failed to request: ", err)
        return
      end
    ngx.say(type(res))
    local json = require "cjson"
    local util = require "cjson.util"
    ngx.say(util.serialise_value(res))
    --body = res['read_body']()

    ngx.say(type(body))

end)

app:get("/resty", function(request,id)
            local http = require "resty.http"
            local httpc = http.new()
            local res, err = httpc:request_uri("http://www.baidu.com")
            if res.status == ngx.HTTP_OK then
                ngx.say(res.body)
            else
                ngx.exit(res.status)
            end

end)

app:get("/xwaf", function(request,id)
    local json_text = bjson.loadf("./app/data/rules/args.rule", env)
    local ret = bjson.decode(json_text)
    for _,rule in pairs(ret) do
        regular = rule["RuleItem"]
        if regular ~= "" and ngx.re.find(request.params.cmd_url, regular, "jo") then
            ngx.say("MATCH!")
        end
    end
end)

app:get("/greatball", function(request,id)
    meta = buffer.gett("init_args")
    --ngx.say(bjson.pprint(meta))
    ngx.say(request.params.cmd_url)
end)

return app
