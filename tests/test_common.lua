-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Figure = require("swia-skirmish-tts/modules/common/figure")
local DeploymentCard = require("swia-skirmish-tts/modules/common/deployment_card")

local tests = {}

function tests.test_figure_matching_unique_ffg_match()
	local name = "[DA1917]Chewbacca"
	local description = "Loyal Wookiee"
	local card = Object:create(name, description, "Card")
	card = DeploymentCard:create(card)
	local figure = Figure:create({["name"] = name})
	assertTrue(figure:matchCard(card))
end

function tests.test_figure_matching_unique_ffg_mismatch()
	local name = "[DA1917]Chewbacca"
	local description = "Loyal Wookiee"
	local card = Object:create(name, description, "Card")
	card = DeploymentCard:create(card)
	local figure = Figure:create({["name"] = "Darth Vader"})
	assertFalse(figure:matchCard(card))
end

return tests
