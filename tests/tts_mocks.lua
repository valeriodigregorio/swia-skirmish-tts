-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Logging
-- -----------------------------------------------------------------------------

local logging_enabled = {}

function logStyle(tag)
    logging_enabled[tag] = true
end

function log(element, label, tag)
    if logging_enabled[tag] == true then
        print("["..tag.."]["..label.."] "..stringify(element))
    end
end

-- -----------------------------------------------------------------------------
-- UI
-- -----------------------------------------------------------------------------

local json = require("JSON")
JSON = {}

function JSON.encode(lua_data)
    return json:encode(lua_data)
end

function JSON.decode(json_string)
    return json:decode(json_string)
end

-- -----------------------------------------------------------------------------
-- UI
-- -----------------------------------------------------------------------------

UI = {}
UI.attributes = {}

function UI.setAttribute(id, name, value)
    UI.attributes[id] = UI.attributes[id] or {}
    UI.attributes[id][name] = value
end

function UI.getAttribute(id, name)
    UI.attributes[id] = UI.attributes[id] or {}
    return UI.attributes[id][name]
end

-- -----------------------------------------------------------------------------
-- Broadcast
-- -----------------------------------------------------------------------------

function broadcastToColor(msg, color)
    print("[BROADCAST] "..color.." <= \""..msg.."\"")
end

function broadcastToAll(msg)
    print("[BROADCAST] ALL <= \""..msg.."\"")
end

-- -----------------------------------------------------------------------------
-- Print
-- -----------------------------------------------------------------------------

function printToAll(msg)
    print("[PRINT] ALL <= \""..msg.."\"")
end

-- -----------------------------------------------------------------------------
-- Global
-- -----------------------------------------------------------------------------

Global = {}

function Global.call(fn, args)
    return _G[fn](args)
end

-- -----------------------------------------------------------------------------
-- Object
-- -----------------------------------------------------------------------------

function getObjectFromGUID(guid)
    return {
        ["guid"] = guid
    }
end

function getAllObjects()
    return {}
end

function destroyObject(obj)
end

-- -----------------------------------------------------------------------------
-- Wait
-- -----------------------------------------------------------------------------

Wait = {}

function Wait.condition(end_fn, cond_fn)
    while not cond_fn() do
    end
    end_fn()
end

function Wait.frames(fn, n)
    fn()
end

-- -----------------------------------------------------------------------------
-- self
-- -----------------------------------------------------------------------------

self = {}
self.UI = UI

function self.getGUID()
    return nil
end

function self.getValue()
    return os.clock()
end

-- -----------------------------------------------------------------------------
-- Object
-- -----------------------------------------------------------------------------

Object = {}
Object.__index = Object

function Object:create(name, description, tag, position, rotation)
    local obj = {}
    setmetatable(obj, Object)
    obj.name = name
    obj.description = description
    obj.tag = tag
    obj.getName = function() return name end
    obj.getDescription = function() return description end
    obj.getPosition = function() return position or {x=0.0, y=0.0, z=0.0} end
    obj.getRotation = function() return rotation or {x=0.0, y=0.0, z=0.0} end
    obj.getTag = function() return tag end
    obj.UI = {}
    obj.UI.setXml = function(xml)
        obj.xml = xml
    end
    return obj
end

-- -----------------------------------------------------------------------------
-- Grid
-- -----------------------------------------------------------------------------

Grids = {}
