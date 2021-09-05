-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local COMP = require("swia-skirmish-tts/modules/common/components")

local Figure = require("swia-skirmish-tts/modules/common/figure")

local tests = {}

local Chewbacca = Object:create("[DA1917]Chewbacca", "Loyal Wookiee", "Card")
local KoTunFeralo = Object:create("Ko-Tun Feralo", "", "Card")
local EliteStormtrooper = Object:create("[DA1917]Elite Stormtrooper", "", "Card")
local Stormtrooper = Object:create("Stormtrooper", "", "Card")
local LukeHero = Object:create("[DA1917]Luke Skywalker", "Hero of the Rebellion", "Card")
local LukeJedi = Object:create("[DA1917]Luke Skywalker", "Jedi Knight", "Card")
local MercTempAlliance = Object:create("Temporary Alliance", "A Common Enemy", "Card")
local ImperialTempAlliance = Object:create("Temporary Alliance", "Hired Guns", "Card")
local JunkDroid = Object:create("[E6E42B]Junk Droid", "", "Card")
local RenegadeMando = Object:create("[DA1917]The Mandalorian", "Renegade Hunter - IACP", "Card")
local PhoenixMando = Object:create("[DA1917]The Mandalorian", "Rising Phoenix - IACP", "Card")

local ChewbaccaFigure = Object:create("[DA1917]Chewbacca", "", "Component")
local KoTunFeraloFigure = Object:create("Ko-Tun Feralo", "", "Component")
local EliteStormtrooperFigure = Object:create("[DA1917]Stormtrooper", "", "Component")
local StormtrooperFigure = Object:create("Stormtrooper", "", "Component")
local LukeHeroFigure = Object:create("[DA1917]Luke Skywalker", "", "Component")
local LukeJediFigure = Object:create("[DA1917]Luke Skywalker (Jedi)", "", "Component")
local JunkDroidFigure = Object:create("[E6E42B]Junk Droid", "", "Component")

function tests.test_card_id_from_unique_elite_card()
	local id = COMP.getDeploymentCardId(Chewbacca)
	assertEquals("Chewbacca", id)
end

function tests.test_card_id_from_unique_regular_card()
	local id = COMP.getDeploymentCardId(KoTunFeralo)
	assertEquals("Ko-Tun Feralo", id)
end

function tests.test_card_id_from_elite_card()
	local id = COMP.getDeploymentCardId(EliteStormtrooper)
	assertEquals("Elite Stormtrooper", id)
end

function tests.test_card_id_from_regular_card()
	local id = COMP.getDeploymentCardId(Stormtrooper)
	assertEquals("Stormtrooper", id)
end

function tests.test_card_id_from_luke_hero_card()
	local id = COMP.getDeploymentCardId(LukeHero)
	assertEquals("Luke Skywalker, Hero of the Rebellion", id)
end

function tests.test_card_id_from_luke_jedi_card()
	local id = COMP.getDeploymentCardId(LukeJedi)
	assertEquals("Luke Skywalker, Jedi Knight", id)
end

function tests.test_card_id_from_renegad_mando_card()
	local id = COMP.getDeploymentCardId(RenegadeMando)
	assertEquals("The Mandalorian, Renegade Hunter - IACP", id)
end

function tests.test_card_id_from_phoenix_mando_card()
	local id = COMP.getDeploymentCardId(PhoenixMando)
	assertEquals("The Mandalorian, Rising Phoenix - IACP", id)
end

function tests.test_card_id_from_mta_card()
	local id = COMP.getDeploymentCardId(MercTempAlliance)
	assertEquals("Temporary Alliance, A Common Enemy", id)
end

function tests.test_card_id_from_ita_card()
	local id = COMP.getDeploymentCardId(ImperialTempAlliance)
	assertEquals("Temporary Alliance, Hired Guns", id)
end

function tests.test_card_id_from_companion_card()
	local id = COMP.getDeploymentCardId(JunkDroid)
	assertEquals("Junk Droid", id)
end

function tests.test_figure_id_from_unique_elite_card()
	local id = COMP.getFigureId(Chewbacca)
	assertEquals(ChewbaccaFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_unique_regular_card()
	local id = COMP.getFigureId(KoTunFeralo)
	assertEquals(KoTunFeraloFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_elite_card()
	local id = COMP.getFigureId(EliteStormtrooper)
	assertEquals(EliteStormtrooperFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_regular_card()
	local id = COMP.getFigureId(Stormtrooper)
	assertEquals(StormtrooperFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_luke_hero_card()
	local id = COMP.getFigureId(LukeHero)
	assertEquals(LukeHeroFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_luke_jedi_card()
	local id = COMP.getFigureId(LukeJedi)
	assertEquals(LukeJediFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_companion_card()
	local id = COMP.getFigureId(JunkDroid)
	assertEquals(JunkDroidFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_unique_elite_figure()
	local id = COMP.getFigureId(ChewbaccaFigure)
	assertEquals(ChewbaccaFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_unique_regular_figure()
	local id = COMP.getFigureId(KoTunFeraloFigure)
	assertEquals(KoTunFeraloFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_elite_figure()
	local id = COMP.getFigureId(EliteStormtrooperFigure)
	assertEquals(EliteStormtrooperFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_regular_figure()
	local id = COMP.getFigureId(StormtrooperFigure)
	assertEquals(StormtrooperFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_luke_hero_figure()
	local id = COMP.getFigureId(LukeHeroFigure)
	assertEquals(LukeHeroFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_luke_jedi_figure()
	local id = COMP.getFigureId(LukeJediFigure)
	assertEquals(LukeJediFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

function tests.test_figure_id_from_companion_figure()
	local id = COMP.getFigureId(JunkDroidFigure)
	assertEquals(JunkDroidFigure.name:gsub("%[[%a%d/]*%]", ""), id)
end

return tests
