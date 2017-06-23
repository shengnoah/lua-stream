local ruler = {}

function ruler.read(self, var)
    print(var)
    file = io.open(var,"r")
    if file==nil then
        return
    end
    t = {}
    for line in file:lines() do
        table.insert(t,line)
    end
    file:close()
    return(t)
end

function ruler.write(self,var, rule)
    file = io.open(var,"aw")
    if file==nil then
        return
    end

    file:write(rule,"\n")    
    file:close()
    return(t)
end

function ruler.dump(self, in_name, out_name)
    print(name)
    local ret = self:read(in_name)
    rules = {}
    local idx = 0
    for k,v in pairs(ret) do
        idx = idx + 1
        item = {Id=idx, RuleType="args", RuleItem=v, Action=1}
        table.insert(rules,item)
    end
    
    for k,v in pairs(rules) do
         for key,value in pairs(v) do
             print(key, value)
         end
    end 
    self:export(out_name, rules)
end

function ruler.export(self, filename, rule_name)
    local json = require"cjson"
    local ret = json.encode(rule_name)
    self:write(filename, ret)
end

function ruler.loading(self, filename)
    local json = require"cjson"
    local util = require "cjson.util"
    local ret = util.file_load(filename, env)
    local data = json.decode(ret)
    print(util.serialise_value(data))
end


return ruler 
--ruler:dump("args.rule")
