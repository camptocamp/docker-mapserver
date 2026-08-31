local base_path = os.getenv("MAPSERVER_BASE_PATH", "")
local path = lighty.r.req_attr["uri.path"]
local base_index = path:find(base_path, 1, true)
local base_length = base_path:len()

if base_index == 1 and path:len() > base_length then
    lighty.r.req_attr["request.path-info"] = path:sub(base_length + 1)
end
