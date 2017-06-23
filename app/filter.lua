local rules = require"meta"


local matcher = {}

function matcher.init(self)
    self.action_id = {"404","500","301"}
    self.match_map = {
        matcher_group_get = {args=0, urls=0, cookie=0, useragent=0, post=0 },
        matcher_group_post= {args=0, urls=0, cookie=0, useragent=1, post=0 },
        matcher_group_whiteip= {args=0, urls=0, cookie=0, useragent=0, post=0 }
    }
    self.action_seq =  { 
        {id=1, action="start", method = "GET"} ,
        {id=2, action="start", method = "POST"}, 
        {id=3, action="start", method = "WHITEIP"} 
    }
    self.method_id = {GET="matcher_group_get", POST="matcher_group_post", WHITEIP="matcher_group_whiteip"}
end

function matcher.action(self, m_type, param)
    local group_tbl= self.match_map[m_type]
    for k,v in pairs(group_tbl) do
        if v == 1 then
            --print(k)
            for key, val in pairs(rules[k]) do
                local regular = val["RuleItem"]
                --ngx.say(val["action"])
                --if regular ~= "" and ngx.re.find(request.params.cmd_url, regular, "jo") then
                --    ngx.say("GET")
                      local id = val["action"]
                      print(self.action_id[id])
                      --ngx.say(self.action_id[1])
                --end 
            end 
        end
    end
end

function matcher.match(self, param)
    matcher:init()
    for k,v in pairs(self.action_seq) do
        local idx = v['method']
        local method = self.method_id[idx]
        --print(method)
        matcher:action(method, "param")
    end
end

--matcher:init()
matcher:match("param")
