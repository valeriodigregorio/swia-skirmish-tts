-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local TTA = require("swia-skirmish-tts/modules/import/ttadmiral")

local tests = {}

local function test_army(url, dep_cards, cmd_cards, card_sys)
    local result, system = TTA.getArmy(url)

    assertIn(DEFS.DEPLOYMENT_CARD, result)
    assertEquals(dep_cards, result[DEFS.DEPLOYMENT_CARD])

    assertIn(DEFS.COMMAND_CARD, result)
    assertEquals(cmd_cards, result[DEFS.COMMAND_CARD])

    assertEquals(card_sys, system)
end

function tests.test_ttadmiral_get_army_generic()
	test_army("http://classic.tabletopadmiral.com/imperialassault/nuc017002205129063005062102122149150000000000ncc023018028001119235214128159053056158161057141", {
		[1] = 'Chewbacca',
		[2] = 'Han Solo',
		[3] = 'Jyn Odan - IACP',
		[4] = 'Hera Syndulla',
		[5] = 'R2-D2',
		[6] = 'Gideon Argus',
		[7] = 'C-3PO',
		[8] = 'Rebel High Command',
		[9] = 'Heroic Effort',
		[10] = 'Rogue Smuggler',
		[11] = 'Wookiee Avenger'
	}, {
		[1] = 'Celebration',
		[2] = 'Debts Repaid',
		[3] = 'Element of Surprise',
		[4] = 'Heart of Freedom',
		[5] = 'Negation',
		[6] = 'On the Lam - IACP',
		[7] = 'Second Chance',
		[8] = 'Set for Stun',
		[9] = 'Stimulants',
		[10] = 'Take Initiative',
		[11] = 'To the Limit',
		[12] = 'Tools for the Job',
		[13] = 'Toxic Dart',
		[14] = 'Urgency',
		[15] = 'Wild Fury'
	}, DEFS.IACP)
end

function tests.test_ttadmiral_get_army_simple()
	test_army("http://classic.tabletopadmiral.com/imperialassault/nuc017000000000000000000000000000000000000000ncc000000000000000000000000000000000000000000000", {
		[1] = 'Chewbacca'
	}, {
	}, DEFS.FFG)
end

return tests
