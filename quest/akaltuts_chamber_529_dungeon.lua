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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (529, 'quest.Akaltuts_Chamber_529_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_529_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber V"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle 2 Drowschwerter und bringe sie zum 17. Wächter"
Description[ENGLISH][1] = "Collect 2 drow blades for Guardian 17."
Description[GERMAN][2] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][2] = "The next Guardian may have a task for you."

Description[GERMAN][3] = "Töte Drow für den 18. Wächter. Du benötigst noch 15."
Description[ENGLISH][3] = "Kill drow for Guardian 18. You still need 15."
Description[GERMAN][4] = "Töte Drow für den 18. Wächter. Du benötigst noch 14."
Description[ENGLISH][4] = "Kill drow for Guardian 18. You still need 14."
Description[GERMAN][5] = "Töte Drow für den 18. Wächter. Du benötigst noch 13."
Description[ENGLISH][5] = "Kill drow for Guardian 18. You still need 13."
Description[GERMAN][6] = "Töte Drow für den 18. Wächter. Du benötigst noch 12."
Description[ENGLISH][6] = "Kill drow for Guardian 18.  You still need 12."
Description[GERMAN][7] = "Töte Drow für den 18. Wächter. Du benötigst noch 11."
Description[ENGLISH][7] = "Kill drow for Guardian 18.  You still need 11."
Description[GERMAN][8] = "Töte Drow für den 18. Wächter. Du benötigst noch 10."
Description[ENGLISH][8] = "Kill drow for Guardian 18. You still need 10."
Description[GERMAN][9] = "Töte Drow für den 18. Wächter. Du benötigst noch 9."
Description[ENGLISH][9] = "Kill drow for Guardian 18. You still need 9."
Description[GERMAN][10] = "Töte Drow für den 18. Wächter. Du benötigst noch 8."
Description[ENGLISH][10] = "Kill drow for Guardian 18. You still need 8."
Description[GERMAN][11] = "Töte Drow für den 18. Wächter. Du benötigst noch 7."
Description[ENGLISH][11] = "Kill drow for Guardian 18. You still need 7."
Description[GERMAN][12] = "Töte Drow für den 18. Wächter. Du benötigst noch 6."
Description[ENGLISH][12] = "Kill drow for Guardian 18. You still need 6."
Description[GERMAN][13] = "Töte Drow für den 18. Wächter. Du benötigst noch 5."
Description[ENGLISH][13] = "Kill drow for Guardian 18. You still need 5."
Description[GERMAN][14] = "Töte Drow für den 18. Wächter. Du benötigst noch 4."
Description[ENGLISH][14] = "Kill drow for Guardian 18. You still need 4."
Description[GERMAN][15] = "Töte Drow für den 18. Wächter. Du benötigst noch 3."
Description[ENGLISH][15] = "Kill drow for Guardian 18. You still need 3."
Description[GERMAN][16] = "Töte Drow für den 18. Wächter. Du benötigst noch 2."
Description[ENGLISH][16] = "Kill drow for Guardian 18. You still need 2."
Description[GERMAN][17] = "Töte Drow für den 18. Wächter. Du benötigst noch 1."
Description[ENGLISH][17] = "Kill drow for Guardian 18. You still need 1."
Description[GERMAN][18] = "Kehre zurück zum 18. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][18] = "Report back to Guardian 18, you have finished his test."

Description[GERMAN][19] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][19] = "The Next Guardian may have a task for you."

Description[GERMAN][20] = "Sammle 1 Himmelsschild und bringe sie zum 19. Wächter"
Description[ENGLISH][20] = "Collect 1 sky shield for Guardian 19."
Description[GERMAN][21] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][21] = "The next Guardian may have a task for you."

Description[GERMAN][22] = "Töte Drow für den 20. Wächter. Du benötigst noch 18."
Description[ENGLISH][22] = "Kill drow for Guardian 20. You still need 18."
Description[GERMAN][23] = "Töte Drow für den 20. Wächter. Du benötigst noch 17."
Description[ENGLISH][23] = "Kill drow for Guardian 20. You still need 17."
Description[GERMAN][24] = "Töte Drow für den 20. Wächter. Du benötigst noch 16."
Description[ENGLISH][24] = "Kill drow for Guardian 20. You still need 16."
Description[GERMAN][25] = "Töte Drow für den 20. Wächter. Du benötigst noch 15."
Description[ENGLISH][25] = "Kill drow for Guardian 20. You still need 15."
Description[GERMAN][26] = "Töte Drow für den 20. Wächter. Du benötigst noch 14."
Description[ENGLISH][26] = "Kill drow for Guardian 20. You still need 14."
Description[GERMAN][27] = "Töte Drow für den 20. Wächter. Du benötigst noch 13."
Description[ENGLISH][27] = "Kill drow for Guardian 20. You still need 13."
Description[GERMAN][28] = "Töte Drow für den 20. Wächter. Du benötigst noch 12."
Description[ENGLISH][28] = "Kill drow for Guardian 20.  You still need 12."
Description[GERMAN][29] = "Töte Drow für den 20. Wächter. Du benötigst noch 11."
Description[ENGLISH][29] = "Kill drow for Guardian 20.  You still need 11."
Description[GERMAN][30] = "Töte Drow für den 20. Wächter. Du benötigst noch 10."
Description[ENGLISH][30] = "Kill drow for Guardian 20. You still need 10."
Description[GERMAN][31] = "Töte Drow für den 20. Wächter. Du benötigst noch 9."
Description[ENGLISH][31] = "Kill drow for Guardian 20. You still need 9."
Description[GERMAN][32] = "Töte Drow für den 20. Wächter. Du benötigst noch 8."
Description[ENGLISH][32] = "Kill drow for Guardian 20. You still need 8."
Description[GERMAN][33] = "Töte Drow für den 20. Wächter. Du benötigst noch 7."
Description[ENGLISH][33] = "Kill drow for Guardian 20. You still need 7."
Description[GERMAN][34] = "Töte Drow für den 20. Wächter. Du benötigst noch 6."
Description[ENGLISH][34] = "Kill drow for Guardian 20. You still need 6."
Description[GERMAN][35] = "Töte Drow für den 20. Wächter. Du benötigst noch 5."
Description[ENGLISH][35] = "Kill drow for Guardian 20. You still need 5."
Description[GERMAN][36] = "Töte Drow für den 20. Wächter. Du benötigst noch 4."
Description[ENGLISH][36] = "Kill drow for Guardian 20. You still need 4."
Description[GERMAN][37] = "Töte Drow für den 20. Wächter. Du benötigst noch 3."
Description[ENGLISH][37] = "Kill drow for Guardian 20. You still need 3."
Description[GERMAN][38] = "Töte Drow für den 20. Wächter. Du benötigst noch 2."
Description[ENGLISH][38] = "Kill drow for Guardian 20. You still need 2."
Description[GERMAN][39] = "Töte Drow für den 20. Wächter. Du benötigst noch 1."
Description[ENGLISH][39] = "Kill drow for Guardian 20. You still need 1."
Description[GERMAN][40] = "Kehre zurück zum 20. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][40] = "Report back to Guardian 20, you have finished his test."

Description[GERMAN][41] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][41] = "The Next Guardian may have a task for you."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {423, 815, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(423, 815, -9)}
QuestTarget[2] = {position(423, 815, -9)}

QuestTarget[3] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[4] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[5] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[6] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[7] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[8] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[9] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[10] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[11] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[12] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[13] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[14] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[15] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[16] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[17] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[18] = {position(428, 815, -9), position(429, 805, -9)}
QuestTarget[19] = {position(428, 815, -9), position(429, 805, -9)}

QuestTarget[20] = {position(442, 795, -9)}
QuestTarget[21] = {position(442, 795, -9)}

QuestTarget[22] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[23] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[24] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[25] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[26] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[27] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[28] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[29] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[30] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[31] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[32] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[33] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[34] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[35] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[36] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[37] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[38] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[39] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[40] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[41] = {position(442, 800, -9), position(430, 805, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 41


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
