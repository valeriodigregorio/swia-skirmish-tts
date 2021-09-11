-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("overlay", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- XML templating
-- -----------------------------------------------------------------------------

local XML_HEADER = [[
<Defaults>
    <Button onClick="onClick" fontStyle="Bold" textColor="black" color="#00000000" />
</Defaults>
]]

local XML_PANEL = [[
<Panel position="0 0 -%d" rotation="%d 270 90" scale="0.2 0.2">
    <Panel height="%d" width="%d" position="0 %d 0">
        <HorizontalLayout spacing="5">%s</HorizontalLayout>
    </Panel>
</Panel>
]]

local XML_BUTTON = [[
<Button id="%s" color="#FFFFFF00" active="true"><Image image="%s" preserveAspect="true"></Image></Button>
]]

-- -----------------------------------------------------------------------------
-- Overlay
-- -----------------------------------------------------------------------------

local Overlay = {}
Overlay.__index = Overlay
Overlay.CURRENT_VERSION = "1.0.0"

Overlay.FOCUSED  = "token_condition_beneficial_focused"
Overlay.HIDDEN   = "token_condition_beneficial_hidden"
Overlay.BLEEDING = "token_condition_harmful_bleeding"
Overlay.STUNNED  = "token_condition_harmful_stunned"
Overlay.WEAKENED = "token_condition_harmful_weakened"
Overlay.BLOCK    = "token_power_block"
Overlay.DAMAGE   = "token_power_damage"
Overlay.EVADE    = "token_power_evade"
Overlay.SURGE    = "token_power_surge"
Overlay.RECON    = "token_recon"

Overlay.POWER    = "token_power"

function Overlay:create(json)
    logger:debug({json}, "Overlay:create")
    local obj = {}
    setmetatable(obj, Overlay)
    obj.symbols = {}
    if json ~= nil then
        data = JSON.decode(json) or {}
        if data.version == Overlay.CURRENT_VERSION then
            obj.symbols = data.symbols
        end
    end
    return obj
end

function Overlay:toJson()
    return JSON.encode({
        version = Overlay.CURRENT_VERSION,
        symbols = self.symbols
    })
end

function Overlay:_allowMultiple(symbol)
    return string.match(symbol, Overlay.POWER) ~= nil
end

function Overlay:add(symbol)
    logger:debug({self, #self.symbols, symbol}, "Overlay:add")
    if not self:_allowMultiple(symbol) then
        for _, sym in ipairs(self.symbols) do
            if symbol == sym then
                return false
            end
        end
    end
    table.insert(self.symbols, symbol)
    logger:debug({self, symbol}, "Overlay:add")
    return true
end

function Overlay:remove(symbol)
    logger:debug({self, symbol}, "Overlay:remove")
    for i, sym in ipairs(self.symbols) do
        if symbol == sym then
            table.remove(self.symbols, i)
            logger:debug({self, symbol, i}, "Overlay:remove")
            return true
        end
    end
    return false
end

function Overlay:size()
    logger:debug({self}, "Overlay:size")
    return #self.symbols
end

function Overlay:_createPanelXML(height, width, rotation)
    table.sort(self.symbols)
    logger:debug({self, #self.symbols, height, rotation}, "Overlay:_createPanelXML")

    local btn_xml1 = ""
    local btn_xml2 = ""
    for _, symbol in ipairs(self.symbols) do
        local button = string.format(XML_BUTTON, symbol, symbol)
        btn_xml1 = btn_xml1..button
        btn_xml2 = button..btn_xml2
    end

    local xml = XML_HEADER
    local size = self:size()
    xml = xml..string.format(XML_PANEL, height, rotation, width, size*width, height, btn_xml1)
    rotation = UTILS.round(math.fmod(rotation + 180, 360), 1)
    xml = xml..string.format(XML_PANEL, height, rotation, width, size*width, height, btn_xml2)
    return xml
end

function Overlay:apply(object, height, width)
    logger:debug({self, object, height}, "Overlay:apply")
    if object ~= nil then
        local rotation = UTILS.round(math.fmod(object.getRotation().y + 270, 360), 1)
        local xml = self:_createPanelXML(height, width, rotation)
        logger:debug({xml}, "Overlay:apply")
        object.UI.setXml(xml)
    end
end

return Overlay
