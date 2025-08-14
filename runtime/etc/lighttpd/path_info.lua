if lighty.r.req_attr["request.path-info"] then
    local base_path = os.getenv("MAPSERVER_BASE_PATH", "")
    local path_info = lighty.r.req_attr["request.path-info"]
    lighty.r.req_attr["uri.path"] = base_path .. path_info
end
