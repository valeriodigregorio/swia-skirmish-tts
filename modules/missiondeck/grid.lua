-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("grid", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- Grid
-- -----------------------------------------------------------------------------

local Grid = {}
Grid.__index = Grid

function Grid:create()
  logger:debug({}, "Grid:create")
  local obj = {}
  setmetatable(obj, Grid)
  obj:enable(1.0, 1.0, 0.0, 0.0)
  Grid.type = 1
  Grid.color = "Black"
  Grid.opacity = 0.75
  Grid.thick_lines = false
  obj:disable()
  return obj
end

function Grid:enable(sizeX, sizeY, offsetX, offsetY)
  logger:debug({sizeX, sizeY, offsetX, offsetY}, "Grid:enable")
  Grid.sizeX = sizeX
  Grid.sizeY = sizeY
  Grid.offsetX = offsetX
  Grid.offsetY = offsetY
  Grid.snapping = 3
  Grid.show_lines = true
end

function Grid:disable()
  logger:debug({}, "Grid:disable")
  Grid.snapping = 1
  Grid.show_lines = false
end

return Grid
