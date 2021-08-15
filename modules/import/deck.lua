-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DeploymentCard = require("swia-skirmish-tts/modules/common/deployment_card")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("deck", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- Deck
-- -----------------------------------------------------------------------------

local Deck = {}
Deck.__index = Deck
Deck.DECK_CLONE_POSITION = {0.00, -500.00, 0.00}

function Deck:create(player, guids)
  logger:debug({player, guids}, "Deck:create")
  local obj = {}
  setmetatable(obj, Deck)
  obj.player = player
  obj.guids = guids
  return obj
end

function Deck:search(name)
  logger:debug({name}, "Deck:search")
  for _, guid in ipairs(self.guids) do
    local deck = getObjectFromGUID(guid)
    logger:debug({guid, deck}, "Deck:search")
    for _, entry in pairs(deck.getObjects()) do
      local id = DeploymentCard.getCardId(entry) or entry.name
      logger:debug({entry, id}, "Deck:search")
      if id ~= nil and id == name then
        logger:debug({name, id, entry}, "Deck:search")
        return deck, entry.index
      end
    end
  end
  return nil, nil
end

function Deck:take(name, position, rotation, callback)
  logger:debug({name, position, rotation}, "Deck:take")
  local deck, index = self:search(name)
  if deck ~= nil then
    local cloned = deck.clone({position = Deck.DECK_CLONE_POSITION})
    cloned.takeObject({
      index = index,
      position = position,
      rotation = rotation,
      smooth = false,
      callback_function = callback
    })
    cloned.destruct()
  end
end

return Deck
