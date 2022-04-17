require 'resty.core'
local mysql = require "resty.mysql"

local db, err = mysql:new()
if not db then
    ngx.say("failed to instantiate mysql: ", err)
    return
end

local ok, err, errcode, sqlstate = db:connect {
    host = "mysql",
    database = "app",
    user = "backend",
    password = "backend",
    charset = "utf8",
    max_packet_size = 1024 * 1024,
}

if not ok then
    ngx.say("failed to connect: ", err, ": ", errcode, " ", sqlstate)
    return
end
ngx.say("connected to mysql.")

random = math.random

function getLinkedUser()
    local user = ngx.req.get_headers()["x-app-key"]
    local res = assert(db:query("select linked_user_id from session where value = ? limit 1" , user))
    if #res ~= 1 then
        return nil
    end
    local result = {}
    result["linked_user_id"] = res[0]["linked_user_id"]
    if res[0] then
        return result
    end

end
if getLinkedUser() == nil then
    ngx.say("no user")
    return
end

local ok, err = db:set_keepalive(10000, 100)
if not ok then
  ngx.log(ngx.ERR, "failed to set keepalive: ", err)
  return
end