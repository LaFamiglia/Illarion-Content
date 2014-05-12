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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (525, 'quest.Akaltuts_Chamber_525_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_525_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber I"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "Collect 4 elven swords and bring them to Guardian 1."
Description[GERMAN][2] = ""
Description[ENGLISH][2] = "The next Guardian may have a task for you."

Description[GERMAN][3] = ""
Description[ENGLISH][3] = "Collect 2 elven silversteel armour for Guardian 2."
Description[GERMAN][4] = ""
Description[ENGLISH][4] = "The next Guardian may have a task for you."

Description[GERMAN][5] = ""
Description[ENGLISH][5] = "Kill drow archers for Guardian 3.  You still need 5."
Description[GERMAN][6] = ""
Description[ENGLISH][6] = "Kill drow archers for Guardian 3.  You still need 4."
Description[GERMAN][7] = ""
Description[ENGLISH][7] = "Kill drow archers for Guardian 3.  You still need 3."
Description[GERMAN][8] = ""
Description[ENGLISH][8] = "Kill drow archers for Guardian 3.  You still need 2."
Description[GERMAN][9] = ""
Description[ENGLISH][9] = "Kill drow archers for Guardian 3.  You still need 1."
Description[GERMAN][10] = ""
Description[ENGLISH][10] = "Report back to Guardian 3, you have finished his test."

Description[GERMAN][11] = "."
Description[ENGLISH][11] = "The next Guardian may have a task for you."

Description[GERMAN][12] = ""
Description[ENGLISH][12] = "Kill drow for Guardian 4. You still need 8."
Description[GERMAN][13] = ""
Description[ENGLISH][13] = "Kill drow for Guardian 4. You still need 7."
Description[GERMAN][14] = ""
Description[ENGLISH][14] = "Kill drow for Guardian 4. You still need 6."
Description[GERMAN][15] = ""
Description[ENGLISH][15] = "Kill drow for Guardian 4. You still need 5."
Description[GERMAN][16] = ""
Description[ENGLISH][16] = "Kill drow for Guardian 4. You still need 4."
Description[GERMAN][17] = ""
Description[ENGLISH][17] = "Kill drow for Guardian 4. You still need 3."
Description[GERMAN][18] = ""
Description[ENGLISH][18] = "Kill drow for Guardian 4. You still need 2."
Description[GERMAN][19] = ""
Description[ENGLISH][19] = "Kill drow for Guardian 4. You still need 1."
Description[GERMAN][20] = ""
Description[ENGLISH][20] = "Report back to Guardian 4, you have finished his test."

Description[GERMAN][21] = ""
Description[ENGLISH][21] = "The next Guardian may have a task for you."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {482, 835, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(482, 835, -9)}
QuestTarget[2] = {position(482, 835, -9)}

QuestTarget[3] = {position(478, 846, -9)}
QuestTarget[4] = {position(478, 846, -9)}

QuestTarget[5] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[6] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[7] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[8] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[9] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[10] = {position(475, 846, -9), position(451, 860, -9)}
QuestTarget[11] = {position(475, 846, -9), position(451, 860, -9)}

QuestTarget[12] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[13] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[14] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[15] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[16] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[17] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[18] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[19] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[20] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[21] = {position(433, 856, -9), position(451, 860, -9)}
QuestTarget[22] = {position(433, 856, -9), position(451, 860, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 22


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
