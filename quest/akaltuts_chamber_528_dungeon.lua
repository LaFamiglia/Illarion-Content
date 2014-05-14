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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (528, 'quest.Akaltuts_Chamber_528_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_528_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber IV"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte Zombies für den 13. Wächter. Du benötigst noch 15."
Description[ENGLISH][1] = "Kill zombies for Guardian 13.  You still need 15."
Description[GERMAN][2] = "Töte Zombies für den 13. Wächter. Du benötigst noch 14."
Description[ENGLISH][2] = "Kill zombies for Guardian 13.  You still need 14."
Description[GERMAN][3] = "Töte Zombies für den 13. Wächter. Du benötigst noch 13."
Description[ENGLISH][3] = "Kill zombies for Guardian 13.  You still need 13."
Description[GERMAN][4] = "Töte Zombies für den 13. Wächter. Du benötigst noch 12."
Description[ENGLISH][4] = "Kill zombies for Guardian 13.  You still need 12."
Description[GERMAN][5] = "Töte Zombies für den 13. Wächter. Du benötigst noch 11."
Description[ENGLISH][5] = "Kill zombies for Guardian 13.  You still need 11."
Description[GERMAN][6] = "Töte Zombies für den 13. Wächter. Du benötigst noch 10."
Description[ENGLISH][6] = "Kill zombies for Guardian 13.  You still need 10."
Description[GERMAN][7] = "Töte Zombies für den 13. Wächter. Du benötigst noch 9."
Description[ENGLISH][7] = "Kill zombies for Guardian 13.  You still need 9."
Description[GERMAN][8] = "Töte Zombies für den 13. Wächter. Du benötigst noch 8."
Description[ENGLISH][8] = "Kill zombies for Guardian 13.  You still need 8."
Description[GERMAN][9] = "Töte Zombies für den 13. Wächter. Du benötigst noch 7."
Description[ENGLISH][9] = "Kill zombies for Guardian 13.  You still need 7."
Description[GERMAN][10] = "Töte Zombies für den 13. Wächter. Du benötigst noch 6."
Description[ENGLISH][10] = "Kill zombies for Guardian 13.  You still need 6."
Description[GERMAN][11] = "Töte Zombies für den 13. Wächter. Du benötigst noch 5"
Description[ENGLISH][11] = "Kill zombies for Guardian 13.  You still need 5."
Description[GERMAN][12] = "Töte Zombies für den 13. Wächter. Du benötigst noch 4."
Description[ENGLISH][12] = "Kill zombies for Guardian 13.  You still need 4."
Description[GERMAN][13] = "Töte Zombies für den 13. Wächter. Du benötigst noch 3."
Description[ENGLISH][13] = "Kill zombies for Guardian 13.  You still need 3."
Description[GERMAN][14] = "Töte Zombies für den 13. Wächter. Du benötigst noch 2."
Description[ENGLISH][14] = "Kill zombies for Guardian 13.  You still need 2."
Description[GERMAN][15] = "Töte Zombies für den 13. Wächter. Du benötigst noch 1."
Description[ENGLISH][15] = "Kill zombies for Guardian 13.  You still need 1."
Description[GERMAN][16] = "Kehre zurück zum 13. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][16] = "Report back to Guardian 13, you have finished his test."

Description[GERMAN][17] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][17] = "The Next Guardian may have a task for you."

Description[GERMAN][18] = "Töte Skelette für den 14. Wächter. Du benötigst noch 15."
Description[ENGLISH][18] = "Kill skeletons for Guardian 14.  You still need 15."
Description[GERMAN][19] = "Töte Skelette für den 14. Wächter. Du benötigst noch 14."
Description[ENGLISH][19] = "Kill skeletons for Guardian 14.  You still need 14."
Description[GERMAN][20] = "Töte Skelette für den 14. Wächter. Du benötigst noch 13."
Description[ENGLISH][20] = "Kill skeletons for Guardian 14.  You still need 13."
Description[GERMAN][21] = "Töte Skelette für den 14. Wächter. Du benötigst noch 12."
Description[ENGLISH][21] = "Kill skeletons for Guardian 14.  You still need 12."
Description[GERMAN][22] = "Töte Skelette für den 14. Wächter. Du benötigst noch 11."
Description[ENGLISH][22] = "Kill skeletons for Guardian 14.  You still need 11."
Description[GERMAN][23] = "Töte Skelette für den 14. Wächter. Du benötigst noch 10."
Description[ENGLISH][23] = "Kill skeletons for Guardian 14.  You still need 10."
Description[GERMAN][24] = "Töte Skelette für den 14. Wächter. Du benötigst noch 9."
Description[ENGLISH][24] = "Kill skeletons for Guardian 14.  You still need 9."
Description[GERMAN][25] = "Töte Skelette für den 14. Wächter. Du benötigst noch 8."
Description[ENGLISH][25] = "Kill skeletons for Guardian 14.  You still need 8."
Description[GERMAN][26] = "Töte Skelette für den 14. Wächter. Du benötigst noch 7."
Description[ENGLISH][26] = "Kill skeletons for Guardian 14.  You still need 7."
Description[GERMAN][27] = "Töte Skelette für den 14. Wächter. Du benötigst noch 6."
Description[ENGLISH][27] = "Kill skeletons for Guardian 14.  You still need 6."
Description[GERMAN][28] = "Töte Skelette für den 14. Wächter. Du benötigst noch 5."
Description[ENGLISH][28] = "Kill skeletons for Guardian 14.  You still need 5."
Description[GERMAN][29] = "Töte Skelette für den 14. Wächter. Du benötigst noch 4."
Description[ENGLISH][29] = "Kill skeletons for Guardian 14.  You still need 4."
Description[GERMAN][30] = "Töte Skelette für den 14. Wächter. Du benötigst noch 3."7
Description[ENGLISH][30] = "Kill skeletons for Guardian 14.  You still need 3."
Description[GERMAN][31] = "Töte Skelette für den 14. Wächter. Du benötigst noch 2."
Description[ENGLISH][31] = "Kill skeletons for Guardian 14.  You still need 2."
Description[GERMAN][32] = "Töte Skelette für den 14. Wächter. Du benötigst noch 1."
Description[ENGLISH][32] = "Kill skeletons for Guardian 14.  You still need 1."
Description[GERMAN][33] = "Kehre zurück zum 14. Wächter. Du hast seinen Test bestanden."
Description[ENGLISH][33] = "Report back to Guardian 14, you have finished his test."

Description[GERMAN][34] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][34] = "The Next Guardian may have a task for you."

Description[GERMAN][35] = "Sammle 20 weiße Stoffeballen und bringe sie zum 15. Wächter"
Description[ENGLISH][35] = "Collect 20 white cloth for Guardian 15."
Description[GERMAN][36] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][36] = "The next Guardian may have a task for you."

Description[GERMAN][37] = "Sammle 25 große leere Flaschen und bringe sie zum 16. Wächter"
Description[ENGLISH][37] = "Collect 25 large empty bottles for Guardian 16."
Description[GERMAN][38] = "Der nächste Wächter hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][38] = "The next Guardian may have a task for you."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {516, 803, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[2] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[3] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[4] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[5] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[6] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[7] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[8] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[9] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[10] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[11] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[12] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[13] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[14] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[15] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[16] = {position(516, 803, -9), position(509, 798, -9)}
QuestTarget[17] = {position(516, 803, -9), position(509, 798, -9)}

QuestTarget[18] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[19] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[20] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[21] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[22] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[23] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[24] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[25] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[26] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[27] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[28] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[29] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[30] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[31] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[32] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[33] = {position(511, 803, -9), position(509, 798, -9)}
QuestTarget[34] = {position(511, 803, -9), position(509, 798, -9)}
 
QuestTarget[35] = {position(491, 825, -9)}
QuestTarget[36] = {position(491, 825, -9)}

QuestTarget[37] = {position(491, 820, -9)}
QuestTarget[38] = {position(491, 820, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 38


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
