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

local ChewbaccaFigure = Object:create("[DA1917]Chewbacca", "", "Component")
local KoTunFeraloFigure = Object:create("Ko-Tun Feralo", "", "Component")
local EliteStormtrooperFigure = Object:create("[DA1917]Stormtrooper", "", "Component")
local StormtrooperFigure = Object:create("Stormtrooper", "", "Component")
local LukeHeroFigure = Object:create("[DA1917]Luke Skywalker", "", "Component")
local LukeJediFigure = Object:create("[DA1917]Luke Skywalker (Jedi)", "", "Component")
local JunkDroidFigure = Object:create("[E6E42B]Junk Droid", "", "Component")

function tests.test_card_id_from_unique_elite_card()
	local id = COMP.getCardId(Chewbacca)
	assertEquals("Chewbacca", id)
end

function tests.test_card_id_from_unique_regular_card()
	local id = COMP.getCardId(KoTunFeralo)
	assertEquals("Ko-Tun Feralo", id)
end

function tests.test_card_id_from_elite_card()
	local id = COMP.getCardId(EliteStormtrooper)
	assertEquals("Elite Stormtrooper", id)
end

function tests.test_card_id_from_regular_card()
	local id = COMP.getCardId(Stormtrooper)
	assertEquals("Stormtrooper", id)
end

function tests.test_card_id_from_luke_hero_card()
	local id = COMP.getCardId(LukeHero)
	assertEquals("Luke Skywalker, Hero of the Rebellion", id)
end

function tests.test_card_id_from_luke_jedi_card()
	local id = COMP.getCardId(LukeJedi)
	assertEquals("Luke Skywalker, Jedi Knight", id)
end

function tests.test_card_id_from_mta_card()
	local id = COMP.getCardId(MercTempAlliance)
	assertEquals("Temporary Alliance, A Common Enemy", id)
end

function tests.test_card_id_from_ita_card()
	local id = COMP.getCardId(ImperialTempAlliance)
	assertEquals("Temporary Alliance, Hired Guns", id)
end

function tests.test_card_id_from_companion_card()
	local id = COMP.getCardId(JunkDroid)
	assertEquals("Junk Droid", id)
end

function tests.test_figure_id_from_unique_elite_card()
	local id = COMP.getFigureId(Chewbacca)
	assertEquals(ChewbaccaFigure.name, id)
end

function tests.test_figure_id_from_unique_regular_card()
	local id = COMP.getFigureId(KoTunFeralo)
	assertEquals(KoTunFeraloFigure.name, id)
end

function tests.test_figure_id_from_elite_card()
	local id = COMP.getFigureId(EliteStormtrooper)
	assertEquals(EliteStormtrooperFigure.name, id)
end

function tests.test_figure_id_from_regular_card()
	local id = COMP.getFigureId(Stormtrooper)
	assertEquals(StormtrooperFigure.name, id)
end

function tests.test_figure_id_from_luke_hero_card()
	local id = COMP.getFigureId(LukeHero)
	assertEquals(LukeHeroFigure.name, id)
end

function tests.test_figure_id_from_luke_jedi_card()
	local id = COMP.getFigureId(LukeJedi)
	assertEquals(LukeJediFigure.name, id)
end

function tests.test_figure_id_from_companion_card()
	local id = COMP.getFigureId(JunkDroid)
	assertEquals(JunkDroidFigure.name, id)
end

function tests.test_figure_id_from_unique_elite_figure()
	local id = COMP.getFigureId(ChewbaccaFigure)
	assertEquals(ChewbaccaFigure.name, id)
end

function tests.test_figure_id_from_unique_regular_figure()
	local id = COMP.getFigureId(KoTunFeraloFigure)
	assertEquals(KoTunFeraloFigure.name, id)
end

function tests.test_figure_id_from_elite_figure()
	local id = COMP.getFigureId(EliteStormtrooperFigure)
	assertEquals(EliteStormtrooperFigure.name, id)
end

function tests.test_figure_id_from_regular_figure()
	local id = COMP.getFigureId(StormtrooperFigure)
	assertEquals(StormtrooperFigure.name, id)
end

function tests.test_figure_id_from_luke_hero_figure()
	local id = COMP.getFigureId(LukeHeroFigure)
	assertEquals(LukeHeroFigure.name, id)
end

function tests.test_figure_id_from_luke_jedi_figure()
	local id = COMP.getFigureId(LukeJediFigure)
	assertEquals(LukeJediFigure.name, id)
end

function tests.test_figure_id_from_companion_figure()
	local id = COMP.getFigureId(JunkDroidFigure)
	assertEquals(JunkDroidFigure.name, id)
end

return tests
