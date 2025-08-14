-- Script Lua pour ajuster PATH_INFO et SCRIPT_NAME pour MapServer
-- Ce script extrait le base path de l'URL et configure les variables appropriées

function path_info_handler(env)
    local base_path = os.getenv("MAPSERVER_BASE_PATH") or "/"
    local request_uri = env["REQUEST_URI"] or ""
    local script_name = ""
    local path_info = ""

    -- Print pour debug (optionnel)
    lighty.info("MAPSERVER_BASE_PATH: " .. base_path)
    lighty.info("REQUEST_URI: " .. request_uri)
    lighty.info("SCRIPT_NAME: " .. env["SCRIPT_NAME"] or "")

    -- Normaliser le base_path
    if base_path ~= "/" then
        if not string.match(base_path, "^/") then
            base_path = "/" .. base_path
        end
        if string.match(base_path, "/$") then
            base_path = string.gsub(base_path, "/$", "")
        end
    end

    -- Extraire la partie query string
    local uri_without_query = string.gsub(request_uri, "%?.*", "")

    if base_path == "/" then
        -- Si base_path est "/", SCRIPT_NAME est vide et PATH_INFO est l'URI complete
        script_name = ""
        path_info = uri_without_query
    else
        -- Vérifier si l'URI commence par le base_path
        if string.match(uri_without_query, "^" .. base_path) then
            script_name = base_path
            path_info = string.gsub(uri_without_query, "^" .. base_path, "")
            if path_info == "" then
                path_info = "/"
            end
        else
            -- Si l'URI ne correspond pas au base_path, retourner 404
            return 404
        end
    end

    -- Définir les variables d'environnement
    env["SCRIPT_NAME"] = script_name
    env["PATH_INFO"] = path_info

    lighty.info("PATH_INFO: " .. path_info)
    lighty.info("SCRIPT_NAME: " .. script_name)

    -- Log pour debug (optionnel)
    -- lighty.info("MAPSERVER_BASE_PATH: " .. base_path)
    -- lighty.info("REQUEST_URI: " .. request_uri)
    -- lighty.info("SCRIPT_NAME: " .. script_name)
    -- lighty.info("PATH_INFO: " .. path_info)

    return 0  -- Continue le traitement
end

-- Point d'entrée pour lighttpd
return path_info_handler
