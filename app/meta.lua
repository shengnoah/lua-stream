local metadata = [[
    local args = {
        {Id=1, RuleType="args", RuleItem="\.\./", action=1},
        {Id=2, RuleType="args", RuleItem="\:\$", action=1},
        {Id=3, RuleType="args", RuleItem="\$\{", action=1},
        {Id=4, RuleType="args", RuleItem="select.+(from|limit)", action=1},
        {Id=5, RuleType="args", RuleItem="(?:(union(.*?)select))", action=1},
        {Id=6, RuleType="args", RuleItem="having|rongjitest", action=1},
        {Id=7, RuleType="args", RuleItem="sleep\((\s*)(\d*)(\s*)\)", action=1},
        {Id=8, RuleType="args", RuleItem="benchmark\((.*)\,(.*)\)", action=1},
        {Id=9, RuleType="args", RuleItem="base64_decode\(", action=1},
        {Id=10, RuleType="args", RuleItem="(?:from\W+information_schema\W)", action=1},
        {Id=11, RuleType="args", RuleItem="(?:(?:current_)user|database|schema|connection_id)\s*\(", action=1},
        {Id=12, RuleType="args", RuleItem="(?:etc\/\W*passwd)", action=1},
        {Id=13, RuleType="args", RuleItem="into(\s+)+(?:dump|out)file\s*", action=1},
        {Id=14, RuleType="args", RuleItem="group\s+by.+\(", action=1},
        {Id=15, RuleType="args", RuleItem="xwork.MethodAccessor", action=1},
        {Id=16, RuleType="args", RuleItem="(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\(", action=1},
        {Id=17, RuleType="args", RuleItem="xwork\.MethodAccessor", action=1},
        {Id=18, RuleType="args", RuleItem="(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\:\/", action=1},
        {Id=19, RuleType="args", RuleItem="java\.lang", action=1},
        {Id=20, RuleType="args", RuleItem="\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)\[", action=1},
        {Id=21, RuleType="args", RuleItem="\<(iframe|script|body|img|layer|div|meta|style|base|object|input)", action=1},
        {Id=22, RuleType="args", RuleItem="(onmouseover|onerror|onload)\=", action=1},
    }

    local urls = {
        {Id=1, RuleType="url", RuleItem="\.(htaccess|bash_history)", action=1},
        {Id=2, RuleType="url", RuleItem="\.(bak|inc|old|mdb|sql|backup|java|class|tgz|gz|tar|zip)$", action=1},
        {Id=3, RuleType="url", RuleItem="(phpmyadmin|jmx-console|admin-console|jmxinvokerservlet)", action=1},
        {Id=4, RuleType="url", RuleItem="java\.lang", action=1},
        {Id=5, RuleType="url", RuleItem="\.svn\/", action=1},
        {Id=6, RuleType="url", RuleItem="/(attachments|upimg|images|css|uploadfiles|html|uploads|templets|static|template|data|inc|forumdata|upload|includes|cache|avatar)/(\\w+).(php|jsp)", action=1},
    }

    local cookie = {
        {Id=1, RuleType="cookie", RuleItem="\.\./", action=1},
        {Id=2, RuleType="cookie", RuleItem="\:\$", action=1},
        {Id=3, RuleType="cookie", RuleItem="\$\{", action=1},
        {Id=4, RuleType="cookie", RuleItem="select.+(from|limit)", action=1},
        {Id=5, RuleType="cookie", RuleItem="(?:(union(.*?)select))", action=1},
        {Id=6, RuleType="cookie", RuleItem="having|rongjitest", action=1},
        {Id=7, RuleType="cookie", RuleItem="sleep\((\s*)(\d*)(\s*)\)", action=1},
        {Id=8, RuleType="cookie", RuleItem="benchmark\((.*)\,(.*)\)", action=1},
        {Id=9, RuleType="cookie", RuleItem="base64_decode\(", action=1},
        {Id=10, RuleType="cookie", RuleItem="(?:from\W+information_schema\W)", action=1},
        {Id=11, RuleType="cookie", RuleItem="(?:(?:current_)user|database|schema|connection_id)\s*\(", action=1},
        {Id=12, RuleType="cookie", RuleItem="(?:etc\/\W*passwd)", action=1},
        {Id=13, RuleType="cookie", RuleItem="into(\s+)+(?:dump|out)file\s*", action=1},
        {Id=14, RuleType="cookie", RuleItem="group\s+by.+\(", action=1},
        {Id=15, RuleType="cookie", RuleItem="xwork.MethodAccessor", action=1},
        {Id=16, RuleType="cookie", RuleItem="(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\(", action=1},
        {Id=17, RuleType="cookie", RuleItem="xwork\.MethodAccessor", action=1},
        {Id=18, RuleType="cookie", RuleItem="(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\:\/", action=1},
        {Id=19, RuleType="cookie", RuleItem="java\.lang", action=1},
        {Id=20, RuleType="cookie", RuleItem="\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)\[", action=1},
    }

    local useragent = {
        {Id=1, RuleType="useragent", RuleItem="(HTTrack|harvest|audit|dirbuster|pangolin|nmap|sqln|-scan|hydra|Parser|libwww|BBBike|sqlmap|w3af|owasp|Nikto|fimap|havij|PycURL|zmeu|BabyKrokodil|netsparker|httperf|bench)", action=1},
    }

    local post = {
        {Id=1, RuleType="post", RuleItem="\.\./", action=1},
        {Id=2, RuleType="post", RuleItem="select.+(from|limit)", action=1},
        {Id=3, RuleType="post", RuleItem="(?:(union(.*?)select))", action=1},
        {Id=4, RuleType="post", RuleItem="having|rongjitest", action=1},
        {Id=5, RuleType="post", RuleItem="sleep\((\s*)(\d*)(\s*)\)", action=1},
        {Id=6, RuleType="post", RuleItem="benchmark\((.*)\,(.*)\)", action=1},
        {Id=7, RuleType="post", RuleItem="base64_decode\(", action=1},
        {Id=8, RuleType="post", RuleItem="(?:from\W+information_schema\W)", action=1},
        {Id=9, RuleType="post", RuleItem="(?:(?:current_)user|database|schema|connection_id)\s*\(", action=1},
        {Id=10, RuleType="post", RuleItem="(?:etc\/\W*passwd)", action=1},
        {Id=11, RuleType="post", RuleItem="into(\s+)+(?:dump|out)file\s*", action=1},
        {Id=12, RuleType="post", RuleItem="group\s+by.+\(", action=1},
        {Id=13, RuleType="post", RuleItem="xwork.MethodAccessor", action=1},
        {Id=14, RuleType="post", RuleItem="(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\(", action=1},
        {Id=15, RuleType="post", RuleItem="xwork\.MethodAccessor", action=1},
        {Id=16, RuleType="post", RuleItem="(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\:\/", action=1},
        {Id=17, RuleType="post", RuleItem="java\.lang", action=1},
        {Id=18, RuleType="post", RuleItem="\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)\[", action=1},
        {Id=19, RuleType="post", RuleItem="\<(iframe|script|body|img|layer|div|meta|style|base|object|input)", action=1},
        {Id=20, RuleType="post", RuleItem="(onmouseover|onerror|onload)\=", action=1},
    }
 
    return {args=args, urls=urls, cookie=cookie, useragent=useragent, post=post}
]]


local script = metadata 
local rules = assert(loadstring(script))()

--[[
for _, values in pairs(rules) do
    for k,v in pairs(values) do
        for ke, va in pairs(v) do
        print(ke,va)
        end 
    end 
end
--]]

return rules
