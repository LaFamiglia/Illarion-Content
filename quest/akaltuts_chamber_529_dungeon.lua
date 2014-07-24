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
Description[GERMAN][1] = "Sammle zwei Drowschwerter und bringe sie zum Siebzehn Wächter"
Description[ENGLISH][1] = "Collect two drow blades for Guardian Seventeen."
Description[GERMAN][2] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][2] = "The next Guardian may have a task for you."

Description[GERMAN][3] = ""
Description[ENGLISH][3] = "Find the lose Hellhound and return it to the animal pit for Guardian Eighteen."
Description[GERMAN][4] = "."
Description[ENGLISH][4] = "Return to Guardian Eighteen for your reward."
Description[GERMAN][5] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][5] = "The Next Guardian may have a task for you."

Description[GERMAN][6] = "Sammle eine Himmelsschild und bringe sie zum Neunzehn Wächter"
Description[ENGLISH][6] = "Collect one sky shield for Guardian Nineteen."
Description[GERMAN][7] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][7] = "The next Guardian may have a task for you."

Description[GERMAN][8] = "Töte Drow für den 20. Wächter. Du benötigst noch 18."
Description[ENGLISH][8] = "Kill drow for Guardian 20. You still need 18."
Description[GERMAN][9] = "Töte Drow für den 20. Wächter. Du benötigst noch 17."
Description[ENGLISH][9] = "Kill drow for Guardian 20. You still need 17."
Description[GERMAN][10] = "Töte Drow für den 20. Wächter. Du benötigst noch 16."
Description[ENGLISH][10] = "Kill drow for Guardian 20. You still need 16."
Description[GERMAN][11] = "Töte Drow für den 20. Wächter. Du benötigst noch 15."
Description[ENGLISH][11] = "Kill drow for Guardian 20. You still need 15."
Description[GERMAN][12] = "Töte Drow für den 20. Wächter. Du benötigst noch 14."
Description[ENGLISH][12] = "Kill drow for Guardian 20. You still need 14."
Description[GERMAN][13] = "Töte Drow für den 20. Wächter. Du benötigst noch 13."
Description[ENGLISH][13] = "Kill drow for Guardian 20. You still need 13."
Description[GERMAN][14] = "Töte Drow für den 20. Wächter. Du benötigst noch 12."
Description[ENGLISH][14] = "Kill drow for Guardian 20.  You still need 12."
Description[GERMAN][15] = "Töte Drow für den 20. Wächter. Du benötigst noch 11."
Description[ENGLISH][15] = "Kill drow for Guardian 20.  You still need 11."
Description[GERMAN][16] = "Töte Drow für den 20. Wächter. Du benötigst noch 10."
Description[ENGLISH][16] = "Kill drow for Guardian 20. You still need 10."
Description[GERMAN][17] = "Töte Drow für den 20. Wächter. Du benötigst noch 9."
Description[ENGLISH][17] = "Kill drow for Guardian 20. You still need 9."
Description[GERMAN][18] = "Töte Drow für den 20. Wächter. Du benötigst noch 8."
Description[ENGLISH][18] = "Kill drow for Guardian 20. You still need 8."
Description[GERMAN][19] = "Töte Drow für den 20. Wächter. Du benötigst noch 7."
Description[ENGLISH][19] = "Kill drow for Guardian 20. You still need 7."
Description[GERMAN][20] = "Töte Drow für den 20. Wächter. Du benötigst noch 6."
Description[ENGLISH][20] = "Kill drow for Guardian 20. You still need 6."
Description[GERMAN][21] = "Töte Drow für den 20. Wächter. Du benötigst noch 5."
Description[ENGLISH][21] = "Kill drow for Guardian 20. You still need 5."
Description[GERMAN][22] = "Töte Drow für den 20. Wächter. Du benötigst noch 4."
Description[ENGLISH][22] = "Kill drow for Guardian 20. You still need 4."
Description[GERMAN][23] = "Töte Drow für den 20. Wächter. Du benötigst noch 3."
Description[ENGLISH][23] = "Kill drow for Guardian 20. You still need 3."
Description[GERMAN][24] = "Töte Drow für den 20. Wächter. Du benötigst noch 2."
Description[ENGLISH][24] = "Kill drow for Guardian 20. You still need 2."
Description[GERMAN][25] = "Töte Drow für den 20. Wächter. Du benötigst noch 1."
Description[ENGLISH][26] = "Kill drow for Guardian 20. You still need 1."
Description[GERMAN][27] = "Kehre zurück zum 20. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][27] = "Report back to Guardian 20, you have finished his test."

Description[GERMAN][28] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][28] = "The Next Guardian may have a task for you."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {423, 815, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(423, 815, -9)}
QuestTarget[2] = {position(423, 815, -9)}

QuestTarget[3] = {position(428, 815, -9)}
QuestTarget[4] = {position(428, 815, -9)}
QuestTarget[5] = {position(428, 815, -9)}

QuestTarget[6] = {position(442, 795, -9)}
QuestTarget[7] =  {position(442, 795, -9)}

QuestTarget[8] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[9] =  {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[10] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[11] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[12] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[13] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[14] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[15] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[16] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[17] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[18] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[19] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[20] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[21] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[22] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[23] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[24] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[25] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[26] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[27] = {position(442, 800, -9), position(430, 805, -9)}
QuestTarget[28] = {position(442, 800, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 28


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
