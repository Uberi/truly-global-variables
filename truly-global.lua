do
  local request = require("http.request")
  local json = require("json")

  local base_url = "https://taadt2w2i0.execute-api.us-east-1.amazonaws.com/prod"
  setmetatable(_G, {
    __newindex = function(self, key, value)
      local body = json.encode({variable=key, value=value})
      local req = request.new_from_uri(base_url .. "/SetVariable")
      req.headers:upsert(":method", "POST")
      req:set_body(body)
      local headers, stream = req:go(10)
      assert(headers:get(":status") == "200")
    end,
    __index = function(self, key)
      local body = json.encode({variable=key})
      local req = request.new_from_uri(base_url .. "/GetVariable")
      req.headers:upsert(":method", "POST")
      req:set_body(body)
      local headers, stream = req:go(10)
      local result = json.decode(stream:get_body_as_string())
      return result["value"]
    end,
  })
end
