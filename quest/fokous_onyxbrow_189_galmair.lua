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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (189, 'quest.fokous_onyxbrow_189_galmair');

local common = require("base.common")
local factions = require("base.factions")
module("quest.fokous_onyxbrow_189_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Rette das Bierlager"
Title[ENGLISH] = "Save Da Beer"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "T�te in der Zisterne f�nf Ratten, Du musst noch f�nf t�ten."
Description[ENGLISH][1] = "Kill five rats in the Cistern, you still have five left."
Description[GERMAN][2] = "T�te in der Zisterne f�nf Ratten, Du musst noch vier t�ten."
Description[ENGLISH][2] = "Kill five rats in the Cistern, you still have four left."
Description[GERMAN][3] = "T�te in der Zisterne f�nf Ratten, Du musst noch drei t�ten."
Description[ENGLISH][3] = "Kill five rats in the Cistern, you still have three left."
Description[GERMAN][4] = "T�te in der Zisterne f�nf Ratten, Du musst noch zwei t�ten."
Description[ENGLISH][4] = "Kill five rats in the Cistern, you still have two left."
Description[GERMAN][5] = "T�te in der Zisterne f�nf Ratten, Du musst noch eine t�ten."
Description[ENGLISH][5] = "Kill five rats in the Cistern, you still have one left."
Description[GERMAN][6] = "Kehre zu Fokous Onyxbrow f�r Deine Belohnung zur�ck."
Description[ENGLISH][6] = "Return to Fokous Onyxbrow for your reward."

Description[GERMAN][7] = "Kehre zur�ck zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe f�r Dich."
Description[ENGLISH][7] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][8] = "Sammle zehn Rattenfelle und bringe sie als Beweis zu Fokous Onyxbrow."
Description[ENGLISH][8] = "Collect ten rat furs and bring them to Fokous Onyxbrow as evidence."
Description[GERMAN][9] = "Vielleicht hat Fokous Onyxbrow eine weitere Aufgabe f�r Dich."
Description[ENGLISH][9] = "Perhaps Fokous Onyxbrow has another task to be done."

Description[GERMAN][10] = "T�te in der Zisterne zehn Ratten, Du musst noch zehn t�ten."
Description[ENGLISH][10] = "Kill ten rats in the Cistern, you still have ten left."
Description[GERMAN][11] = "T�te in der Zisterne zehn Ratten, Du musst noch neun t�ten."
Description[ENGLISH][11] = "Kill ten rats in the Cistern, you still have nine left."
Description[GERMAN][12] = "T�te in der Zisterne zehn Ratten, Du musst noch acht t�ten."
Description[ENGLISH][12] = "Kill ten rats in the Cistern, you still have eight left."
Description[GERMAN][13] = "T�te in der Zisterne zehn Ratten, Du musst noch sieben t�ten."
Description[ENGLISH][13] = "Kill ten rats in the Cistern, you still have seven left."
Description[GERMAN][14] = "T�te in der Zisterne zehn Ratten, Du musst noch sechs t�ten."
Description[ENGLISH][14] = "Kill ten rats in the Cistern, you still have six left."
Description[GERMAN][15] = "T�te in der Zisterne zehn Ratten, Du musst noch f�nf t�ten."
Description[ENGLISH][15] = "Kill ten rats in the Cistern, you still have five left."
Description[GERMAN][16] = "T�te in der Zisterne zehn Ratten, Du musst noch vier t�ten."
Description[ENGLISH][16] = "Kill ten rats in the Cistern, you still have four left."
Description[GERMAN][17] = "T�te in der Zisterne zehn Ratten, Du musst noch drei t�ten."
Description[ENGLISH][17] = "Kill ten rats in the Cistern, you still have three left."
Description[GERMAN][18] = "T�te in der Zisterne zehn Ratten, Du musst noch zwei t�ten."
Description[ENGLISH][18] = "Kill ten rats in the Cistern, you still have two left."
Description[GERMAN][19] = "T�te in der Zisterne zehn Ratten, Du musst noch eine t�ten."
Description[ENGLISH][19] = "Kill ten rats in the Cistern, you still have one left."
Description[GERMAN][20] = "Kehre zu Fokous Onyxbrow f�r Deine Belohnung zur�ck."
Description[ENGLISH][20] = "Return to Fokous Onyxbrow for your reward."

Description[GERMAN][21] = "Kehre zur�ck zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe f�r Dich."
Description[ENGLISH][21] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][22] = "Sammle f�nfzehn Rattenfelle und bringe sie als Beweis zu Fokous Onyxbrow."
Description[ENGLISH][22] = "Collect fifteen rat furs and bring them to Fokous Onyxbrow as evidence."
Description[GERMAN][23] = "Vielleicht hat Fokous Onyxbrow eine weitere Aufgabe f�r Dich"
Description[ENGLISH][23] = "Perhaps Fokous Onyxbrow has another task to be done."

Description[GERMAN][24] = "T�te in der Zisterne zehn Ratten, Du musst noch zehn t�ten."
Description[ENGLISH][24] = "Kill ten rats in the Cistern, you still have ten left."
Description[GERMAN][25] = "T�te in der Zisterne zehn Ratten, Du musst noch neun t�ten."
Description[ENGLISH][25] = "Kill ten rats in the Cistern, you still have nine left."
Description[GERMAN][26] = "T�te in der Zisterne zehn Ratten, Du musst noch acht t�ten."
Description[ENGLISH][26] = "Kill ten rats in the Cistern, you still have eight left."
Description[GERMAN][27] = "T�te in der Zisterne zehn Ratten, Du musst noch sieben t�ten."
Description[ENGLISH][27] = "Kill ten rats in the Cistern, you still have seven left."
Description[GERMAN][28] = "T�te in der Zisterne zehn Ratten, Du musst noch sechs t�ten."
Description[ENGLISH][28] = "Kill ten rats in the Cistern, you still have six left."
Description[GERMAN][29] = "T�te in der Zisterne zehn Ratten, Du musst noch f�nf t�ten."
Description[ENGLISH][29] = "Kill ten rats in the Cistern, you still have five left."
Description[GERMAN][30] = "T�te in der Zisterne zehn Ratten, Du musst noch vier t�ten."
Description[ENGLISH][30] = "Kill ten rats in the Cistern, you still have four left."
Description[GERMAN][31] = "T�te in der Zisterne zehn Ratten, Du musst noch drei t�ten."
Description[ENGLISH][31] = "Kill ten rats in the Cistern, you still have three left."
Description[GERMAN][32] = "T�te in der Zisterne zehn Ratten, Du musst noch zwei  t�ten."
Description[ENGLISH][32] = "Kill ten rats in the Cistern, you still have two left."
Description[GERMAN][33] = "T�te in der Zisterne zehn Ratten, Du musst noch eine t�ten."
Description[ENGLISH][33] = "Kill ten rats in the Cistern, you still have one left."
Description[GERMAN][34] = "Kehre zu Fokous Onyxbrow f�r Deine Belohnung zur�ck."
Description[ENGLISH][34] = "Return to Fokous Onyxbrow for your reward."

Description[GERMAN][35] = "Kehre zur�ck zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe f�r Dich."
Description[ENGLISH][35] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][36] = "T�te in der Zisterne den Rattenmenschen"
Description[ENGLISH][36] = "Kill the Ratman boss in the Cistern."
Description[GERMAN][37] = "Kehre zu Fokous Onyxbrow f�r Deine Belohnung zur�ck."
Description[ENGLISH][37] = "Return to Fokous Onyxbrow for your reward."

Description[GERMAN][38] = "Du hast alle Aufgaben von Fokous Onyxbrow erf�llt."
Description[ENGLISH][38] = "You have fulfilled all of Fokous Onyxbrow's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {348, 273, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[2] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[3] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[4] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[5] = {position(348, 273, 0), position(359,273,0)} 
QuestTarget[6] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[7] = {position(348, 273, 0)}
QuestTarget[8] = {position(348, 273, 0)}
QuestTarget[9] = {position(348, 273, 0)}
QuestTarget[10] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[11] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[12] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[13] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[14] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[15] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[16] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[17] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[18] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[19] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[20] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[21] = {position(348, 273, 0)}
QuestTarget[22] = {position(348, 273, 0)}
QuestTarget[23] = {position(348, 273, 0)}
QuestTarget[24] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[25] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[26] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[27] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[28] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[29] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[30] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[31] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[32] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[33] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[34] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[35] = {position(348, 273, 0)}
QuestTarget[36] = {position(348, 273, 0), position(359,273,0)}
QuestTarget[37] = {position(348, 273, 0)}
QuestTarget[38] = {position(348, 273, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 38


function QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
