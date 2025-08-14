local base_path = os.getenv("MAPSERVER_BASE_PATH") or "/"

print("MAPSERVER_BASE_PATH: " .. base_path)

if lighty.r.req_attr["request.path-info"] then
    print("path-info: " .. lighty.r.req_attr["request.path-info"]  or "")
    print("path: " .. lighty.r.req_attr["uri.path"]  or "")
    lighty.r.req_attr["uri.path"] = base_path .. lighty.r.req_attr["request.path-info"]
    lighty.r.req_attr["uri.path-raw"] = base_path .. lighty.r.req_attr["request.path-info"]
    lighty.r.req_attr["request.path-info"] = base_path .. lighty.r.req_attr["request.path-info"]
    lighty.r.req_env["PATH_INFO"] = base_path .. lighty.r.req_attr["request.path-info"]
    print("path: " .. lighty.r.req_attr["uri.path"]  or "")
    print("path-info: " .. lighty.r.req_attr["request.path-info"]  or "")
end
