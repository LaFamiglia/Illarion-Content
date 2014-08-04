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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (526, 'quest.Akaltuts_Chamber_526_dungeon');

require("base.common")
module("quest.Akaltuts_Chamber_526_dungeon", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = ""
Title[ENGLISH] = "Akaltuts Chamber II"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle 20 Kelche und bringe sie zum Defensor Sancio."
Description[ENGLISH][1] = "Collect 20 goblets for Defensor Sancio."
Description[GERMAN][2] = "Der Defensor Mando hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][2] = "The Defensor Mando may have a task for you."

Description[GERMAN][3] = "Töte Drow für den Defensor Mando Du benötigst noch zehn."
Description[ENGLISH][3] = "Kill drow for Defensor Mando.  You still need ten."
Description[GERMAN][4] = "Töte Drow für den Defensor Mando. Du benötigst noch neun."
Description[ENGLISH][4] = "Kill drow for Defensor Mando.  You still need nine."
Description[GERMAN][5] = "Töte Drow für den Defensor Mando. Du benötigst noch acht."
Description[ENGLISH][5] = "Kill drow for Defensor Mando.  You still need eight."
Description[GERMAN][6] = "Töte Drow für den Defensor Mando. Du benötigst noch sieben."
Description[ENGLISH][6] = "Kill drow for Defensor Mando.  You still need seven."
Description[GERMAN][7] = "Töte Drow für den Defensor Mando. Du benötigst noch sech."
Description[ENGLISH][7] = "Kill drow for Defensor Mando.  You still need six."
Description[GERMAN][8] = "Töte Drow für den Defensor Mando. Du benötigst noch fünf."
Description[ENGLISH][8] = "Kill drow for Defensor Mando.  You still need five."
Description[GERMAN][9] = "Töte Drow für den Defensor Mando. Du benötigst noch vier."
Description[ENGLISH][9] = "Kill drow for Defensor Mando.  You still need four."
Description[GERMAN][10] = "Töte Drow für den Defensor Mando. Du benötigst noch drei."
Description[ENGLISH][10] = "Kill drow for Defensor Mando.  You still need three."
Description[GERMAN][11] = "Töte Drow für den Defensor Mando. Du benötigst noch zwei."
Description[ENGLISH][11] = "Kill drow for Defensor Mando.  You still need two."
Description[GERMAN][12] = "Töte Drow für den Defensor Mando. Du benötigst noch ein."
Description[ENGLISH][12] = "Kill drow for Defensor Mando.  You still need one."
Description[GERMAN][13] = "Kehre zurück zum Defensor Mando. Du hast seinen Test bestanden."
Description[ENGLISH][13] = "Report back to Defensor Mando, you have finished his test."

Description[GERMAN][14] = "Der Defensor Confirmo hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][14] = "The Defensor Confirmo may have a task for you."

Description[GERMAN][15] = ""
Description[ENGLISH][15] = "Find the copy of 'The Reign of Akaltut' in the library and read it for Defensor Confirmo."
Description[GERMAN][16] = ""
Description[ENGLISH][16] = "Return to Defensor Confirmo for your reward."
Description[GERMAN][17] = "Der Defensor Prohibeo hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][17] = "The Defensor Prohibeo may have a task for you."

Description[GERMAN][18] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch zehn."
Description[ENGLISH][18] = "Kill drow warrior for Defensor Prohibeo. You still need ten."
Description[GERMAN][19] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch neun."
Description[ENGLISH][19] = "Kill drow warrior for Defensor Prohibeo. You still need nine."
Description[GERMAN][20] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch acht."
Description[ENGLISH][20] = "Kill drow warrior for Defensor Prohibeo. You still need eight."
Description[GERMAN][21] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch sieben."
Description[ENGLISH][21] = "Kill drow warrior for Defensor Prohibeo. You still need seven."
Description[GERMAN][22] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch sech."
Description[ENGLISH][22] = "Kill drow warrior for Defensor Prohibeo. You still need six."
Description[GERMAN][23] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch fünf."
Description[ENGLISH][23] = "Kill drow warrior for Defensor Prohibeo. You still need five."
Description[GERMAN][24] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch vier."
Description[ENGLISH][24] = "Kill drow warrior for Defensor Prohibeo. You still need four."
Description[GERMAN][25] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch drei."
Description[ENGLISH][25] = "Kill drow warrior for Defensor Prohibeo. You still need three."
Description[GERMAN][26] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch zwei."
Description[ENGLISH][26] = "Kill drow warrior for Defensor Prohibeo You still need two."
Description[GERMAN][27] = "Töte zehn Drow Krieger für den Defensor Prohibeo. Du benötigst noch ein."
Description[ENGLISH][27] = "Kill drow warrior for Defensor Prohibeo. You still need one."
Description[GERMAN][28] = "Kehre zurück zum Defensor Prohibeo. Du hast seinen Test bestanden."
Description[ENGLISH][28] = "Report back to Defensor Prohibeo, you have finished his test."

Description[GERMAN][29] = "Der Defensor Affligo hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][29] = "The Defensor Affligo may have a task for you."

Description[GERMAN][30] = ""
Description[ENGLISH][30] = "You have finished part two of the testing."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {438, 856, -9}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(438, 856, -9)}
QuestTarget[2] = {position(438, 856, -9)}

QuestTarget[3] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[4] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[5] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[6] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[7] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[8] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[9] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[10] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[11] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[12] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[13] = {position(466, 843, -9), position(464, 842, -9)}
QuestTarget[14] = {position(466, 843, -9), position(464, 842, -9)}

QuestTarget[15] = {position(462, 840, -9)}
QuestTarget[16] = {position(462, 840, -9)}
QuestTarget[17] = {position(462, 840, -9)}

QuestTarget[18] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[19] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[20] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[21] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[22] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[23] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[24] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[25] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[26] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[27] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[28] = {position(462, 847, -9), position(464, 842, -9)}
QuestTarget[29] = {position(462, 847, -9), position(464, 842, -9)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 30


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
