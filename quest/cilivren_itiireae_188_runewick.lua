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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (188, 'quest.cilivren_itiireae_188_runewick');

require("base.common")
require("base.factions")
module("quest.cilivren_itiireae_188_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Rette die �cker"
Title[ENGLISH] = "Save The Field"

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
Description[GERMAN][6] = "Kehre zu Cilivren Itiireae f�r Deine Belohnung zur�ck."
Description[ENGLISH][6] = "Return to Cilivren Itiireae for you reward."

Description[GERMAN][7] = "Kehre zur�ck zur Bereichsw�chterin Cilivren Itiireae, sie hat m�glicherweise noch eine Aufgabe f�r Dich."
Description[ENGLISH][7] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][8] = "Sammle zehn Rattenfelle und bringe sie zu Cilivren Itiireae."
Description[ENGLISH][8] = "Collect ten rat furs and bring them to Cilivren Itiireae."
Description[GERMAN][9] = "Vielleicht hat Cilivren Itiireae eine weitere Aufgabe f�r Dich."
Description[ENGLISH][9] = "Perhaps Cilivren Itiireae has another task to be done."

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
Description[GERMAN][20] = "Kehre zu Cilivren Itiireae f�r Deine Belohnung zur�ck."
Description[ENGLISH][20] = "Return to Cilivren Itiireae for you reward."

Description[GERMAN][21] = "Kehre zur�ck zur Bereichsw�chterin Cilivren Itiireae, sie hat m�glicherweise noch eine Aufgabe f�r Dich."
Description[ENGLISH][21] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][22] = "Sammle zwanzig Rattenfelle und bringe sie zu Cilivren Itiireae."
Description[ENGLISH][22] = "Collect twenty rat furs and bring them to Cilivren Itiireae."
Description[GERMAN][23] = "Vielleicht hat Cilivren Itiireae eine weitere Aufgabe f�r Dich."
Description[ENGLISH][23] = "Perhaps Cilivren Itiireae has another task to be done."

Description[GERMAN][24] = "T�te in der Zisterne 20 Ratten, Du musst noch 20 t�ten."
Description[ENGLISH][24] = "Kill 20 rats in the Cistern, you still have 20 left."
Description[GERMAN][25] = "T�te in der Zisterne 20 Ratten, Du musst noch 19 t�ten."
Description[ENGLISH][25] = "Kill 20 rats in the Cistern, you still have 19 left."
Description[GERMAN][26] = "T�te in der Zisterne 20 Ratten, Du musst noch 18 t�ten."
Description[ENGLISH][26] = "Kill 20 rats in the Cistern, you still have 18 left."
Description[GERMAN][27] = "T�te in der Zisterne 20 Ratten, Du musst noch 17 t�ten."
Description[ENGLISH][27] = "Kill 20 rats in the Cistern, you still have 17 left."
Description[GERMAN][28] = "T�te in der Zisterne 20 Ratten, Du musst noch 16 t�ten."
Description[ENGLISH][28] = "Kill 20 rats in the Cistern, you still have 16 left."
Description[GERMAN][29] = "T�te in der Zisterne 20 Ratten, Du musst noch 15 t�ten."
Description[ENGLISH][29] = "Kill 20 rats in the Cistern, you still have 15 left."
Description[GERMAN][30] = "T�te in der Zisterne 20 Ratten, Du musst noch 14 t�ten."
Description[ENGLISH][30] = "Kill 20 rats in the Cistern, you still have 14 left."
Description[GERMAN][31] = "T�te in der Zisterne 20 Ratten, Du musst noch 13 t�ten."
Description[ENGLISH][31] = "Kill 20 rats in the Cistern, you still have 13 left."
Description[GERMAN][32] = "T�te in der Zisterne 20 Ratten, Du musst noch 12 t�ten."
Description[ENGLISH][32] = "Kill 20 rats in the Cistern, you still have 12 left."
Description[GERMAN][33] = "T�te in der Zisterne 20 Ratten, Du musst noch 11 t�ten."
Description[ENGLISH][33] = "Kill 20 rats in the Cistern, you still have 11 left."
Description[GERMAN][34] = "T�te in der Zisterne 20 Ratten, Du musst noch 10 t�ten."
Description[ENGLISH][34] = "Kill 20 rats in the Cistern, you still have 10 left."
Description[GERMAN][35] = "T�te in der Zisterne 20 Ratten, Du musst noch 9 t�ten."
Description[ENGLISH][35] = "Kill 20 rats in the Cistern, you still have 9 left."
Description[GERMAN][36] = "T�te in der Zisterne 20 Ratten, Du musst noch 8 t�ten."
Description[ENGLISH][36] = "Kill 20 rats in the Cistern, you still have 8 left."
Description[GERMAN][37] = "T�te in der Zisterne 20 Ratten, Du musst noch 7 t�ten."
Description[ENGLISH][37] = "Kill 20 rats in the Cistern, you still have 7 left."
Description[GERMAN][38] = "T�te in der Zisterne 20 Ratten, Du musst noch 6 t�ten."
Description[ENGLISH][38] = "Kill 20 rats in the Cistern, you still have 6 left."
Description[GERMAN][39] = "T�te in der Zisterne 20 Ratten, Du musst noch 5 t�ten."
Description[ENGLISH][39] = "Kill 20 rats in the Cistern, you still have 5 left."
Description[GERMAN][40] = "T�te in der Zisterne 20 Ratten, Du musst noch 4 t�ten."
Description[ENGLISH][40] = "Kill 20 rats in the Cistern, you still have 4 left."
Description[GERMAN][41] = "T�te in der Zisterne 20 Ratten, Du musst noch 3 t�ten."
Description[ENGLISH][41] = "Kill 20 rats in the Cistern, you still have 3 left."
Description[GERMAN][42] = "T�te in der Zisterne 20 Ratten, Du musst noch 2 t�ten."
Description[ENGLISH][42] = "Kill 20 rats in the Cistern, you still have 2 left."
Description[GERMAN][43] = "T�te in der Zisterne 20 Ratten, Du musst noch 1 t�ten."
Description[ENGLISH][43] = "Kill 20 rats in the Cistern, you still have 1 left."
Description[GERMAN][44] = "Kehre zu Cilivren Itiireae f�r Deine Belohnung zur�ck."
Description[ENGLISH][44] = "Return to Cilivren Itiireae for you reward."
Description[GERMAN][45] = "Kehre zur�ck zur Bereichsw�chterin Cilivren Itiireae, sie hat m�glicherweise noch eine Aufgabe f�r Dich."
Description[ENGLISH][45] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][46] = "T�te in der Zisterne der Rattenmenschen"
Description[ENGLISH][46] = "Kill the Ratman boss in the Cistern."
Description[GERMAN][47] = "Kehre zu Cilivren Itiireae f�r Deine Belohnung zur�ck."
Description[ENGLISH][47] = "Return to Cilivren Itiireae for you reward."
Description[GERMAN][48] = "Du hast alle Aufgaben von Cilivren Itiireae erf�llt."
Description[ENGLISH][48] = "You have fulfilled all of Cilivren Itiireae's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {843, 844, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there

QuestTarget = {}
QuestTarget[1] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[2] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[3] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[4] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[5] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[6] = {position(843, 844, 0), position(832,832,-3)}

QuestTarget[7] = {position(843, 844, 0)}

QuestTarget[8] = {position(843, 844, 0)}
QuestTarget[9] = {position(843, 844, 0)}

QuestTarget[10] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[11] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[12] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[13] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[14] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[15] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[16] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[17] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[18] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[19] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[20] = {position(843, 844, 0), position(840,840,-6)}

QuestTarget[21] = {position(843, 844, 0)}

QuestTarget[22] = {position(843, 844, 0)}
QuestTarget[23] = {position(843, 844, 0)}

QuestTarget[24] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[25] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[26] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[27] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[28] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[29] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[30] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[31] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[32] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[33] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[34] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[35] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[36] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[37] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[38] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[39] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[40] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[41] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[42] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[43] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[44] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[45] = {position(843, 844, 0)}

QuestTarget[46] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[47] = {position(843, 844, 0)}
QuestTarget[48] = {position(843, 844, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 48


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
    if base.factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
