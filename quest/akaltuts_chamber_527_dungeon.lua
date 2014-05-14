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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (527, 'quest.Akaltuts_Chamber_527_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_527_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber III"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "Collect 1 drow armour for Guardian 9."
Description[GERMAN][2] = ""
Description[ENGLISH][2] = "The next Guardian may have a task for you."

Description[GERMAN][3] = ""
Description[ENGLISH][3] = "Kill drow leader for Guardian 10.  You still need 2."
Description[GERMAN][4] = ""
Description[ENGLISH][4] = "Kill drow leader for Guardian 10.  You still need 1."
Description[GERMAN][5] = ""
Description[ENGLISH][5] = "Report back to Guardian 10, you have finished his test."

Description[GERMAN][6] = ""
Description[ENGLISH][6] = "The next Guardian may have a task for you."

Description[GERMAN][7] = ""
Description[ENGLISH][7] = "Collect 5 elven rainbow swords for Guardian 11."
Description[GERMAN][8] = ""
Description[ENGLISH][8] = "The next Guardian may have a task for you."

Description[GERMAN][9] = ""
Description[ENGLISH][9] = "Collect 4 drow helmets for Guardian 12."
Description[GERMAN][10] = ""
Description[ENGLISH][10] = "The next Guardian may have a task for you."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {476, 782, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(476, 782, -9)}
QuestTarget[2] = {position(476, 782, -9)}

QuestTarget[3] = {position(427, 783, -9), position(431, 802, -9)}
QuestTarget[4] = {position(427, 783, -9), position(431, 802, -9)}
QuestTarget[5] = {position(427, 783, -9), position(431, 802, -9)}
QuestTarget[6] = {position(427, 783, -9), position(431, 802, -9)}

QuestTarget[7] = {position(424, 783, -9)}
QuestTarget[8] = {position(424, 783, -9)}

QuestTarget[9] = {position(441, 761, -9)}
QuestTarget[10] = {position(441, 761, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 20


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function QuestAvailability(user, status)
    return Player.questAvailable
end
