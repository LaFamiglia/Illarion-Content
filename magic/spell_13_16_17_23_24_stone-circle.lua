--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--[[
    Soil circle
    Rune 13 & 16 & 17 & 23 & 24
        SOLH SAV ANTH DUN QWAN

    Item-Spell

    SQL:    INSERT INTO spells VALUES (2^13+2^12+2^15+2^22+2^23,0,'m_13_16_17_23_24_stone-circle.lua');
]]

-- including the main script for item spells
local itemspell = require("magic.base.itemspell")
module("magic.spell_13_16_17_23_24_stone-circle", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_13_16_17_23_24_stone-circle.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =              60,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =             100,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "pervestigatio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "SOLH SAV ANTH DUN QWAN",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 6,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = false  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 35,         -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel und von {PP}n H�nden bilden scheinen kleine gr�ne Laubbl�tter nach unten zu sinken die sich noch vor dem Boden wieder aufl�sen.",
        [Player.english] = "#me starts with a mystical formula and from {PP} hands some small green leaves start falling down, but they disappear before they reach the ground."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -8000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -10,   -- increase of the action points
        ["manapoints"]   = -2000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

Circle = {
    ["gfx"] = 0,                -- gfx shown in case a item is created on this spot
    ["sfx"] = 13,               -- sfx played in case a item is created on this spot
    ["item"] = {                -- informations about the created item
        ["id"] = 287,           -- id of the item that should be created
        ["minSkill"] = {        -- values of the item at the minimal skill
            ["quality"] = 333,  -- Item quality
            ["data"] = 0,       -- Item data
            ["wear"] = 1,       -- Item wear
            ["number"] = 1,     -- Item number
            ["chance"] = 40     -- Chance that this Item is created
        },           -- id of the item that should be created
        ["maxSkill"] = {        -- values of the item at the maximal skill
            ["quality"] = 333,  -- Item quality
            ["data"] = 0,       -- Item data
            ["wear"] = 7,       -- Item wear
            ["number"] = 1,     -- Item number
            ["chance"] = 100    -- Chance that this Item is created
        }
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
