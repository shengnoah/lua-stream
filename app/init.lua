local buffer = require "buffer"
local bjson = require "utils.bjson"
local rulesource = require "init.rulesource_plugin"
--local rulesource = require "plugin.rulesoure.rulesource_plugin"

--local json_text = bjson.loadf("./app/data/rules/testcase", env)
--local t = bjson.decode(json_text)
--buffer.sett("rule", t)
--buffer.set("candylab", "Candylab:Blues")



local json_text = bjson.loadf("./app/data/rules/args.rule", env)
local t = bjson.decode(json_text)

buffer.sett("init_args", t)
--meta = buffer.gett("args")


