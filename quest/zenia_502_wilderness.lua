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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (520, 'quest.zenia_502_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Praise Zelphia"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "Show the rope to the Mother by praying (using) the alter, to show your devotion and willingness to help her servant Zenia."
Description[GERMAN][2] = "Kehre zu Zenia zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][2] = "Return to Zenia, you have finished her task."

Description[GERMAN][3] = "Rede mit Zenia, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][3] = "Check with Zenia, she may have another task for you."

Description[GERMAN][4] = 
Description[ENGLISH][4] = "Collect 20 logs for Zenia to help her and gather supplies for your raft."
Description[GERMAN][5] = "Rede mit Zenia, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][5] = "Check with Zenia, she may have another task for you."

Description[GERMAN][6] = ""
Description[ENGLISH][6] = "Collect 20 shovels full of mud for Zenia to help her and gather supplies for your raft."
Description[GERMAN][7] = "Rede mit Zenia, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][7] = "Check with Zenia, she may have another task for you."

Description[GERMAN][8] = ""
Description[ENGLISH][8] = "Place all materials on the altar and pray to the Mother for help with your raft. (You will need ropes, logs, mud and fish)."

Description[GERMAN][9] = ""
Description[ENGLISH][9] = "With the help of the Mother you have successfully built a raft and left the island.  Zenia may be able to assist should you land there again."

Description[GERMAN][10] = ""
Description[ENGLISH][10] = "You must pray again at the altar with your offering to summon your raft."

local npcPos = position(760, 339, -9);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
for i = 1, 132 do
  QuestTarget[i] = {npcPos};
end

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 10
