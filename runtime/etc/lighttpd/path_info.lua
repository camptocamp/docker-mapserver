local base_path = os.getenv("MAPSERVER_BASE_PATH", "")
local path = lighty.r.req_attr["uri.path"]
local result = path:gsub("^" .. base_path, "")
lighty.r.req_attr["request.path-info"] = result
