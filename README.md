# Wario
一个基于Pipeline模式的OpenResty应用系统
Wario提供不同类型的OpenResty的LUA代码插件，可以在不是很了解OpenResty编写LUA代码的情况下，用现成的插件串接出你想要的功能。


### WAF防火墙插件

文件名：waf_plugin.lua            

描述：简单的过滤用户请求GET POST数据中的攻击型数据。 

IN: waf_plugin_rule.rule

OUT:

### IP黑名单插件

文件名：blockip_plugin.lua        

描述：IP黑名单插件 

IN: blockip.rule

OUT:



### HTTP客户端插件

文件名：httprequest_plugin.lua    

描述：HTTP请求插件

IN:

OUT:


### HTTP请求读取插件

文件名：httpsrc_plugin.lua        

描述：HTTP汇聚源插件  

IN:

OUT:


### PCRE标准正则插件

文件名：pcre_plugin.lua           

描述：使用PCRE正则的过滤插件

IN:

OUT:


### Redirection/Rewrite插件

文件名：rewrite_plugin.lua        

描述：用户请求重定向插件 

IN:

OUT:

### 路由插件

文件名：route_plugin.lua          

描述：路由插件 

IN:

OUT:







