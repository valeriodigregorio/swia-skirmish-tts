-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local m = {}

function m.safeGetName(object)
    if object.getName ~= nil then
        return object.getName()
    end
    return object.name
end

function m.safeGetDescription(object)
    if object.getDescription ~= nil then
        return object.getDescription() or ""
    end
    return object.description or ""
end

function m.clone_array(array)
    local cloned = {}
    for _, elem in ipairs(array) do
        table.insert(cloned, elem)
    end
    return cloned
end

function m.getOrDefault(tbl, idx, def, fn)
    local v = tbl[idx]
    if v == nil then
        return def
    end
    if fn == nil then
        return v
    end
    return fn(v)
end

return m
