-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local COMP = require("swia-skirmish-tts/modules/common/components")
local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local STRING = require("swia-skirmish-tts/modules/common/string")
local UTILS = require("swia-skirmish-tts/modules/common/utils")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("deployment_card", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
--  Globals
-- -----------------------------------------------------------------------------

local CARD_DESCRIPTION_SEPARATOR = "\n----------\n"

local DeploymentCards = {

  -- FFG, Rebel
  ["Ahsoka Tano"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Alliance Ranger"] = {health = 5, figures = 3, affiliation=DEFS.REBEL, system="FFG"},
  ["Alliance Smuggler"] = {health = 3, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Balance of the Force"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Biv Bodhrik"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["C-3PO"] = {health = 4, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["C1-10P"] = {health = 5, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["CT-1701"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Chewbacca"] = {health = 14, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Combat Suit"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Davith Elso"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Diala Passil"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Drokkatta"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Echo Base Trooper"] = {health = 5, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Alliance Ranger"] = {health = 7, figures = 3, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Alliance Smuggler"] = {health = 5, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Echo Base Trooper"] = {health = 8, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Rebel Saboteur"] = {health = 6, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Rebel Trooper"] = {health = 5, figures = 3, affiliation=DEFS.REBEL, system="FFG"},
  ["Elite Wookiee Warrior"] = {health = 13, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Ezra Bridger"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Fenn Signis"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Fury of Kashyyyk"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Gaarkhan"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Gideon Argus"] = {health = 5, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Han Solo"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Hera Syndulla"] = {health = 7, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Heroic Effort"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Jarrod Kelvin"] = {health = 7, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Jyn Odan"] = {health = 6, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Kanan Jarrus"] = {health = 14, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Ko-Tun Feralo"] = {health = 9, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Lando Calrissian"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Leia Organa"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Loku Kanoloa"] = {health = 4, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Luke Skywalker, Hero of the Rebellion"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Luke Skywalker, Jedi Knight"] = {health = 16, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["MHD-19"] = {health = 7, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Mak Eshka'rey"] = {health = 4, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Murne Rin"] = {health = 6, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Obi-Wan Kenobi"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["On a Diplomatic Mission"] = {health = -1, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["R2-D2"] = {health = 6, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Rebel High Command"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Rebel Saboteur"] = {health = 4, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Rebel Trooper"] = {health = 3, figures = 3, affiliation=DEFS.REBEL, system="FFG"},
  ["Rogue Smuggler"] = {health = -1, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Sabine Wren"] = {health = 11, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Saska Teft"] = {health = 7, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Smuggler's Run"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Spectre Cell"] = {health = -1, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Tress Hacnua"] = {health = 9, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Verena Talos"] = {health = 11, figures = 1, affiliation=DEFS.REBEL, system="FFG"},
  ["Wookiee Avenger"] = {health = nil, figures = 0, affiliation=DEFS.REBEL, system="FFG"},
  ["Wookiee Warrior"] = {health = 11, figures = 2, affiliation=DEFS.REBEL, system="FFG"},
  ["Zeb Orrelios"] = {health = 15, figures = 1, affiliation=DEFS.REBEL, system="FFG"},

  -- FFG, Imperial
  ["0-0-0"] = {health = 8, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Advanced Com Systems"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Agent Blaise"] = {health = 8, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["BT-1"] = {health = 10, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Captain Terro"] = {health = 13, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Cross-Training"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Darth Vader"] = {health = 16, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Death Trooper"] = {health = 5, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Driven by Hatred"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["E-Web Engineer"] = {health = 5, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite AT-DP"] = {health = 16, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite AT-ST"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Death Trooper"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Dewback Rider"] = {health = 9, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite E-Web Engineer"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Heavy Stormtrooper"] = {health = 8, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite ISB Infiltrator"] = {health = 4, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Imperial Officer"] = {health = 5, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Jet Trooper"] = {health = 7, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Probe Droid"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Riot Trooper"] = {health = 7, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Royal Guard"] = {health = 10, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite SC2-M Repulsor Tank"] = {health = 10, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Sentry Droid"] = {health = 8, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Snowtrooper"] = {health = 6, figures = 3, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Elite Stormtrooper"] = {health = 5, figures = 3, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Emperor Palpatine"] = {health = 13, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["General Sorin"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["General Weiss"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Heavy Stormtrooper"] = {health = 6, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["ISB Infiltrator"] = {health = 6, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Imperial Officer"] = {health = 3, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Jet Trooper"] = {health = 3, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Kayn Somos"] = {health = 12, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Probe Droid"] = {health = 5, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Riot Trooper"] = {health = 5, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Royal Guard"] = {health = 8, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Royal Guard Champion"] = {health = 13, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Rule by Fear"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Sentry Droid"] = {health = 5, figures = 2, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Snowtrooper"] = {health = 4, figures = 3, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Stormtrooper"] = {health = 3, figures = 3, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Temporary Alliance, Hired Guns"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["The General's Ranks"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["The Grand Inquisitor"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Thrawn"] = {health = 9, figures = 1, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Vader's Finest"] = {health = nil, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},
  ["Zillo Technique"] = {health = -1, figures = 0, affiliation=DEFS.IMPERIAL, system="FFG"},

  -- FFG, Mercenarz
  ["Beast Tamer"] = {health = -1, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Black Market"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Boba Fett"] = {health = 13, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Bossk"] = {health = 10, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Clawdite Shapeshifter"] = {health = 6, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Dengar"] = {health = 8, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Devious Scheme"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Bantha Rider"] = {health = 21, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Clawdite Shapeshifter"] = {health = 8, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Gamorrean Guard"] = {health = 8, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite HK Assassin Droid"] = {health = 6, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Hired Gun"] = {health = 4, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Jawa Scavenger"] = {health = 5, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Loth-cat"] = {health = 5, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Nexu"] = {health = 8, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Rancor"] = {health = 15, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Trandoshan Hunter"] = {health = 8, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Tusken Raider"] = {health = 7, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Ugnaught Tinkerer"] = {health = 7, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Wampa"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Weequay Pirate"] = {health = 6, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Elite Wing Guard"] = {health = 5, figures = 3, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Explosive Armaments"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["First Strike"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Focused on the Kill"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Gamorrean Guard"] = {health = 5, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Greedo"] = {health = 7, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["HK Assassin Droid"] = {health = 5, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Headhunter"] = {health = -1, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Hired Gun"] = {health = 3, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Hondo Ohnaka"] = {health = 9, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["IG-88"] = {health = 10, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Indentured Jester"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Jabba the Hutt"] = {health = 10, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Jawa Scavenger"] = {health = 3, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Last Resort"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Loth-cat"] = {health = 3, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Maul"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Nexu"] = {health = 6, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Onar Koma"] = {health = 15, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Prey on the Weak"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Punishing Strike"] = {health = -1, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Shyla Varad"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Temporary Alliance, A Common Enemy"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Trandoshan Hunter"] = {health = 6, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Tusken Raider"] = {health = 4, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Ugnaught Tinkerer"] = {health = 4, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Under Duress"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Vinto Hreeda"] = {health = 8, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Wampa"] = {health = 9, figures = 1, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Weequay Pirate"] = {health = 4, figures = 2, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Wing Guard"] = {health = 3, figures = 3, affiliation=DEFS.MERCENARY, system="FFG"},

  -- FFG, Neutral
  ["Channel the Force"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Doubt"] = {health = nil, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Extra Armor"] = {health = nil, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Feeding Frenzy"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Heavy Fire"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Lie in Ambush"] = {health = nil, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Motivation"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Scavenged Weaponry"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Survivalist"] = {health = nil, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Targeting Computer"] = {health = nil, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Trusted Ally"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},
  ["Unshakable"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="FFG"},

  -- FFG, Companion
  ["J4X-7"] = {health = 4, figures = 1, companion=true, affiliation=DEFS.REBEL, system="FFG"},
  ["Junk Droid"] = {health = 1, figures = 1, companion=true, affiliation=DEFS.MERCENARY, system="FFG"},
  ["Salacious B. Crumb"] = {health = 6, figures = 1, companion=true, affiliation=DEFS.MERCENARY, system="FFG"},

  -- IACP, Rebel
  ["Jyn Odan - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Gaarkhan - IACP"] = {health = 13, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Fenn Signis - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Diala Passil - IACP"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Kanan Jarrus - IACP"] = {health = 14, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Ahsoka Tano - IACP"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Luke Skywalker, Hero of the Rebellion - IACP"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Luke Skywalker, Jedi Knight - IACP"] = {health = 16, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Ko-Tun Feralo - IACP"] = {health = 9, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Leia Organa - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite Wookiee Warrior - IACP"] = {health = 13, figures = 2, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite Rebel Trooper - IACP"] = {health = 5, figures = 3, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite Echo Base Trooper - IACP"] = {health = 8, figures = 2, affiliation=DEFS.REBEL, system="IACP"},
  ["Biv Bodhrik - IACP"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Saska Teft - IACP"] = {health = 6, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Yoda - IACP"] = {health = 9, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Obi-Wan Kenobi - IACP"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Loku Kanoloa - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Lando Calrissian - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Jyn Erso - IACP"] = {health = 12, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite AT-RT - IACP"] = {health = 13, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite Rebel Saboteur - IACP"] = {health = 7, figures = 2, affiliation=DEFS.REBEL, system="IACP"},
  ["Elite Rebel Pathfinder - IACP"] = {health = 6, figures = 2, affiliation=DEFS.REBEL, system="IACP"},
  ["Verena Talos - IACP"] = {health = 11, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["Cassian Andor - IACP"] = {health = 10, figures = 1, affiliation=DEFS.REBEL, system="IACP"},
  ["K-2SO - IACP"] = {health = 8, figures = 1, affiliation=DEFS.REBEL, system="IACP"},

  -- IACP, Imperial
  ["Imperial Retrofitting - IACP"] = {health = -1, figures = 0, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["General Weiss - IACP"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["BT-1 - IACP"] = {health = 10, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Kayn Somos - IACP"] = {health = 12, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Stormtrooper - IACP"] = {health = 5, figures = 3, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Sentry Droid - IACP"] = {health = 8, figures = 2, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Probe Droid - IACP"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["The Grand Inquisitor - IACP"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Royal Guard Champion - IACP"] = {health = 13, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite AT-ST - IACP"] = {health = 15, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Scout Trooper - IACP"] = {health = 7, figures = 2, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Royal Guard - IACP"] = {health = 10, figures = 2, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite SC2-M Repulsor Tank - IACP"] = {health = 12, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["General Sorin - IACP"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite E-Web Engineer - IACP"] = {health = 8, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Overwatch - IACP"] = {health = -1, figures = 0, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Shoretrooper - IACP"] = {health = 7, figures = 2, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite Mortar Trooper - IACP"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Director Krennic - IACP"] = {health = 7, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Agent Blaise - IACP"] = {health = 8, figures = 1, affiliation=DEFS.IMPERIAL, system="IACP"},
  ["Elite ISB Infiltrator - IACP"] = {health = 7, figures = 2, affiliation=DEFS.IMPERIAL, system="IACP"},

  -- IACP, Mercenary
  ["Elite Gamorrean Guard - IACP"] = {health = 8, figures = 2, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Elite Rancor - IACP"] = {health = 15, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Shyla Varad - IACP"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Maul - IACP"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Elite Wing Guard - IACP"] = {health = 5, figures = 3, affiliation=DEFS.MERCENARY, system="IACP"},
  ["4-LOM - IACP"] = {health = 9, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Zuckuss - IACP"] = {health = 10, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Boba Fett - IACP"] = {health = 14, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Dengar - IACP"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Elite Tusken Raider - IACP"] = {health = 7, figures = 2, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Bossk - IACP"] = {health = 11, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Elite Trandoshan Hunter - IACP"] = {health = 8, figures = 2, affiliation=DEFS.MERCENARY, system="IACP"},
  ["The Mandalorian - IACP"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["IG-11 - IACP"] = {health = 12, figures = 1, affiliation=DEFS.MERCENARY, system="IACP"},
  ["Clan of Two - IACP"] = {health = nil, figures = 0, affiliation=DEFS.MERCENARY, system="IACP"},

  -- IACP, Neutral
  ["Suppressive Fire - IACP"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="IACP"},
  ["The Darksaber - IACP"] = {health = -1, figures = 0, affiliation=DEFS.NEUTRAL, system="IACP"},

  -- IACP, Companion
  ["The Child - IACP"] = {health = 2, figures = 1, companion=true, affiliation=DEFS.MERCENARY, system="IACP"},
}

-- -----------------------------------------------------------------------------
--  Utilities
-- -----------------------------------------------------------------------------

local function getDeploymentCard(object)
  if not COMP.isCard(object) then
    logger:error({"ERROR: Object is not a card!", object}, "getDeploymentCard")
    return nil, nil
  end
  local id = COMP.getCardId(object) or ""
  local card = DeploymentCards[id]
  if card == nil then
    logger:error({"ERROR: Card ID not found!", id, object}, "getDeploymentCard")
    return nil, nil
  end
  return id, card
end

-- -----------------------------------------------------------------------------
--  Deployment Card
-- -----------------------------------------------------------------------------

local DeploymentCard = {}
DeploymentCard.__index = DeploymentCard

function DeploymentCard.getCardId(object)
  logger:debug({object}, "DeploymentCard.getId")
  local id = COMP.getCardId(object) or ""
  local card = DeploymentCards[id]
  if card == nil then
    id = nil
  end
  logger:debug({id, object}, "DeploymentCard.getId")
  return id
end

function DeploymentCard:create(object)
  logger:debug({object}, "DeploymentCard:create")
  local obj = {}
  setmetatable(obj, DeploymentCard)

  obj.object = object
  obj.id, obj.stats = getDeploymentCard(obj.object)
  if obj.id == nil then
    return nil
  end

  obj.figureId = COMP.getFigureId(object)
  obj.infos = obj:getAllInfo()

  logger:debug({obj}, "DeploymentCard:create")
  return obj
end

function DeploymentCard:getId()
  logger:debug({self}, "DeploymentCard.getId")
  return self.id
end

function DeploymentCard:getFigureId()
  logger:debug({self}, "DeploymentCard.getFigureId")
  return self.figureId
end

function DeploymentCard:getHealthPoints()
  logger:debug({self}, "DeploymentCard.getHealth")
  return self.stats.health
end

function DeploymentCard:getNumberOfFigures()
  logger:debug({self}, "DeploymentCard:getNumberOfFigures")
  return self.stats.figures
end

function DeploymentCard:isExhausted()
  local y = math.floor(self.object.getRotation().y) + 45
  y = math.floor(y / 90) % 4
  return y == 1 or y == 3
end

function DeploymentCard:setExhausted(player, state)
  local rotation = self.object.getRotation()
  rotation.y = 0.0
  if player == "Player1" then
    rotation.y = 180.0
  end
  if state then
    rotation.y = rotation.y + 90.0
  end
  self.object.setRotationSmooth(rotation)
end

function DeploymentCard:setFaceUp(state)
  local rotation = self.object.getRotation()
  rotation.z = 180.0
  if state then
    rotation.z = 0.0
  end
  self.object.setRotationSmooth(rotation)
end

function DeploymentCard:isFaceUp()
  local z = math.floor(self.object.getRotation().z) + 90
  z = math.floor(z / 180) % 2
  return z == 0
end

function DeploymentCard:getAllInfo()
  logger:debug({self}, "DeploymentCard.getAllInfo")
  if self.infos ~= nil then
    return self.infos
  end
  local infos = {}
  local n = self:getNumberOfFigures() or 0
  for i=1,n do
    infos[i] = {}
    infos[i].points = nil
    infos[i].color = nil
  end
  local description = UTILS.safeGetDescription(self.object)
  local lines = STRING.splitChr(description, "\n")
  for _, line in ipairs(lines) do
    n = 0
    for color, points in string.gmatch(line, "(%a*): (%d*) HP") do
      n = n + 1
      infos[n].points = tonumber(points)
      infos[n].color = color
    end
  end
  self.infos = infos
  return infos
end

function DeploymentCard:getInfo(index)
  logger:debug({self, index}, "DeploymentCard.getInfo")
  local n = self:getNumberOfFigures()
  if n == nil or index > n then
    return {}
  end
  infos = self:getAllInfo()
  return infos[index]
end

function DeploymentCard:setInfo(index, points, color)
  logger:debug({self, index, points, color}, "DeploymentCard.setInfo")
  local n = self:getNumberOfFigures()
  if n == nil or index > n then
    return
  end
  local infos = self:getAllInfo()
  infos[index].points = points
  infos[index].color = color
  self:setAllInfo(infos)
end

function DeploymentCard:setAllInfo(infos)
  logger:debug({self, infos}, "DeploymentCard.setAllInfo")
  self.infos = infos
  local description = self:getDescription() or ""
  for i, info in pairs(infos) do
    if i == 1 then
      if description ~= "" then
        description = description .. CARD_DESCRIPTION_SEPARATOR
      end
    else
      description = description .. ", "
    end
    description = description .. (info.color or "Unknown") .. ": " .. (info.points or -1) .. " HP"
  end
  self.object.setDescription(description)
end

function DeploymentCard:getDescription()
  logger:debug({self}, "DeploymentCard.getDescription")
  return COMP.getCardDescription(self.object)
end

function DeploymentCard:isVisible()
  logger:debug({self}, "DeploymentCard:isVisible")
  return self:getHealthPoints() ~= nil
end

return DeploymentCard
