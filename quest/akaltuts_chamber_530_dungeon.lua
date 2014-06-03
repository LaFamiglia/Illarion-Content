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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (530, 'quest.Akaltuts_Chamber_530_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_530_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber VI"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte Drow für den 21. Wächter. Du benötigst noch 20."
Description[ENGLISH][1] = "Kill drow for Guardian 21.  You still need 20."
Description[GERMAN][2] = "Töte Drow für den 21. Wächter. Du benötigst noch 19."
Description[ENGLISH][2] = "Kill drow for Guardian 21.  You still need 19."
Description[GERMAN][3] = "Töte Drow für den 21. Wächter. Du benötigst noch 18."
Description[ENGLISH][3] = "Kill drow for Guardian 21. You still need 18."
Description[GERMAN][4] = "Töte Drow für den 21. Wächter. Du benötigst noch 17."
Description[ENGLISH][4] = "Kill drow for Guardian 21. You still need 17."
Description[GERMAN][5] = "Töte Drow für den 21. Wächter. Du benötigst noch 16."
Description[ENGLISH][5] = "Kill drow for Guardian 21. You still need 16."
Description[GERMAN][6] = "Töte Drow für den 21. Wächter. Du benötigst noch 15."
Description[ENGLISH][6] = "Kill drow for Guardian 21. You still need 15."
Description[GERMAN][7] = "Töte Drow für den 21. Wächter. Du benötigst noch 14."
Description[ENGLISH][7] = "Kill drow for Guardian 21. You still need 14."
Description[GERMAN][8] = "Töte Drow für den 21. Wächter. Du benötigst noch 13."
Description[ENGLISH][8] = "Kill drow for Guardian 21. You still need 13."
Description[GERMAN][9] = "Töte Drow für den 21. Wächter. Du benötigst noch 12."
Description[ENGLISH][9] = "Kill drow for Guardian 21.  You still need 12."
Description[GERMAN][10] = "Töte Drow für den 21. Wächter. Du benötigst noch 11"
Description[ENGLISH][10] = "Kill drow for Guardian 21.  You still need 11."
Description[GERMAN][11] = "Töte Drow für den 21. Wächter. Du benötigst noch 10."
Description[ENGLISH][11] = "Kill drow for Guardian 21. You still need 10."
Description[GERMAN][12] = "Töte Drow für den 21. Wächter. Du benötigst noch 9."
Description[ENGLISH][12] = "Kill drow for Guardian 21. You still need 9."
Description[GERMAN][13] = "Töte Drow für den 21. Wächter. Du benötigst noch 8."
Description[ENGLISH][13] = "Kill drow for Guardian 21. You still need 8."
Description[GERMAN][14] = "Töte Drow für den 21. Wächter. Du benötigst noch 7."
Description[ENGLISH][14] = "Kill drow for Guardian 21. You still need 7."
Description[GERMAN][15] = "Töte Drow für den 21. Wächter. Du benötigst noch 6."
Description[ENGLISH][15] = "Kill drow for Guardian 21. You still need 6."
Description[GERMAN][16] = "Töte Drow für den 21. Wächter. Du benötigst noch 5."
Description[ENGLISH][16] = "Kill drow for Guardian 21. You still need 5."
Description[GERMAN][17] = "Töte Drow für den 21. Wächter. Du benötigst noch 4."
Description[ENGLISH][17] = "Kill drow for Guardian 21. You still need 4."
Description[GERMAN][18] = "Töte Drow für den 21. Wächter. Du benötigst noch 3."
Description[ENGLISH][18] = "Kill drow for Guardian 21. You still need 3."
Description[GERMAN][19] = "Töte Drow für den 21. Wächter. Du benötigst noch 2."
Description[ENGLISH][19] = "Kill drow for Guardian 21. You still need 2."
Description[GERMAN][20] = "Töte Drow für den 21. Wächter. Du benötigst noch 1."
Description[ENGLISH][20] = "Kill drow for Guardian 21. You still need 1."
Description[GERMAN][21] = "Kehre zurück zum 21. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][21] = "Report back to Guardian 21, you have finished his test."

Description[GERMAN][22] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][22] = "The Next Guardian may have a task for you."

Description[GERMAN][23] = "Töte Drow für den 22. Wächter. Du benötigst noch 25."
Description[ENGLISH][23] = "Kill drow for Guardian 22.  You still need 25."
Description[GERMAN][24] = "Töte Drow für den 22. Wächter. Du benötigst noch 24."
Description[ENGLISH][24] = "Kill drow for Guardian 22.  You still need 24."
Description[GERMAN][25] = "Töte Drow für den 22. Wächter. Du benötigst noch 23."
Description[ENGLISH][25] = "Kill drow for Guardian 22.  You still need 23."
Description[GERMAN][26] = "Töte Drow für den 22. Wächter. Du benötigst noch 22."
Description[ENGLISH][26] = "Kill drow for Guardian 22.  You still need 22."
Description[GERMAN][27] = "Töte Drow für den 22. Wächter. Du benötigst noch 21"
Description[ENGLISH][27] = "Kill drow for Guardian 22.  You still need 21."
Description[GERMAN][28] = "Töte Drow für den 22. Wächter. Du benötigst noch 20."
Description[ENGLISH][28] = "Kill drow for Guardian 22.  You still need 20."
Description[GERMAN][29] = "Töte Drow für den 22. Wächter. Du benötigst noch 19."
Description[ENGLISH][29] = "Kill drow for Guardian 22.  You still need 19."
Description[GERMAN][30] = "Töte Drow für den 22. Wächter. Du benötigst noch 18."
Description[ENGLISH][30] = "Kill drow for Guardian 22. You still need 18."
Description[GERMAN][31] = "Töte Drow für den 22. Wächter. Du benötigst noch 17."
Description[ENGLISH][31] = "Kill drow for Guardian 22. You still need 17."
Description[GERMAN][32] = "Töte Drow für den 22. Wächter. Du benötigst noch 16."
Description[ENGLISH][32] = "Kill drow for Guardian 22. You still need 16."
Description[GERMAN][33] = "Töte Drow für den 22. Wächter. Du benötigst noch 15."
Description[ENGLISH][33] = "Kill drow for Guardian 22. You still need 15."
Description[GERMAN][34] = "Töte Drow für den 22. Wächter. Du benötigst noch 14."
Description[ENGLISH][34] = "Kill drow for Guardian 22. You still need 14."
Description[GERMAN][35] = "Töte Drow für den 22. Wächter. Du benötigst noch 13."
Description[ENGLISH][35] = "Kill drow for Guardian 22. You still need 13."
Description[GERMAN][36] = "Töte Drow für den 22. Wächter. Du benötigst noch 12."
Description[ENGLISH][36] = "Kill drow for Guardian 22.  You still need 12."
Description[GERMAN][37] = "Töte Drow für den 22. Wächter. Du benötigst noch 11."
Description[ENGLISH][37] = "Kill drow for Guardian 22.  You still need 11."
Description[GERMAN][38] = "Töte Drow für den 22. Wächter. Du benötigst noch 10."
Description[ENGLISH][38] = "Kill drow for Guardian 22. You still need 10."
Description[GERMAN][39] = "Töte Drow für den 22. Wächter. Du benötigst noch 9."
Description[ENGLISH][39] = "Kill drow for Guardian 22. You still need 9."
Description[GERMAN][40] = "Töte Drow für den 22. Wächter. Du benötigst noch 8."
Description[ENGLISH][40] = "Kill drow for Guardian 22. You still need 8."
Description[GERMAN][41] = "Töte Drow für den 22. Wächter. Du benötigst noch 7."
Description[ENGLISH][41] = "Kill drow for Guardian 22. You still need 7."
Description[GERMAN][42] = "Töte Drow für den 22. Wächter. Du benötigst noch 6."
Description[ENGLISH][42] = "Kill drow for Guardian 22. You still need 6."
Description[GERMAN][43] = "Töte Drow für den 22. Wächter. Du benötigst noch 5."
Description[ENGLISH][43] = "Kill drow for Guardian 22. You still need 5."
Description[GERMAN][44] = "Töte Drow für den 22. Wächter. Du benötigst noch 4."
Description[ENGLISH][44] = "Kill drow for Guardian 22. You still need 4."
Description[GERMAN][45] = "Töte Drow für den 22. Wächter. Du benötigst noch 3."
Description[ENGLISH][45] = "Kill drow for Guardian 22. You still need 3."
Description[GERMAN][46] = "Töte Drow für den 22. Wächter. Du benötigst noch 2."
Description[ENGLISH][46] = "Kill drow for Guardian 22. You still need 2."
Description[GERMAN][47] = "Töte Drow für den 22. Wächter. Du benötigst noch 1."
Description[ENGLISH][47] = "Kill drow for Guardian 22. You still need 1."
Description[GERMAN][48] = "Kehre zurück zum 22. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][48] = "Report back to Guardian 22, you have finished his test."

Description[GERMAN][49] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][49] = "The Next Guardian may have a task for you."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {461, 807, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[2] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[3] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[4] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[5] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[6] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[7] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[8] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[9] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[10] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[11] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[12] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[13] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[14] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[15] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[16] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[17] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[18] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[19] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[20] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[21] = {position(461, 807, -9), position(479, 794, -9)}
QuestTarget[22] = {position(461, 807, -9), position(479, 794, -9)}

QuestTarget[23] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[24] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[25] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[26] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[27] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[28] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[29] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[30] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[31] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[32] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[33] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[34] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[35] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[36] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[37] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[38] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[39] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[40] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[41] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[42] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[43] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[44] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[45] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[46] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[47] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[48] = {position(464, 807, -9), position(479, 794, -9)}
QuestTarget[49] = {position(464, 807, -9), position(479, 794, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 49


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
