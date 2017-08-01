# Wario
一个基于Pipeline模式的OpenResty应用系统
Wario提供不同类型的OpenResty的LUA代码插件，可以在不是很了解OpenResty编写LUA代码的情况下，用现成的插件串接出你想要的功能。


### waf_plugin.lua            
简单的过滤用户请求GET POST数据中的攻击型数据。 

IN: waf_plugin_rule.rule

OUT:

### blockip_plugin.lua        

IP黑名单插件 

IN: blockip.rule

OUT:

httprequest_plugin.lua    HTTP请求插件

IN:

OUT:

httpsrc_plugin.lua        HTTP汇聚源插件  

pcre_plugin.lua           使用PCRE正则的过滤插件

rewrite_plugin.lua        用户请求重定向插件 

route_plugin.lua          路由插件 







