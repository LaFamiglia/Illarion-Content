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
Title[ENGLISH] = "Akaltuts Chamber"

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

Description[GERMAN][11] = ""
Description[ENGLISH][11] = "Kill drow for Guardian 4. You still need 8."
Description[GERMAN][12] = ""
Description[ENGLISH][12] = "Kill drow for Guardian 4. You still need 7."
Description[GERMAN][13] = ""
Description[ENGLISH][13] = "Kill drow for Guardian 4. You still need 6."
Description[GERMAN][14] = ""
Description[ENGLISH][14] = "Kill drow for Guardian 4. You still need 5."
Description[GERMAN][15] = ""
Description[ENGLISH][15] = "Kill drow for Guardian 4. You still need 4."
Description[GERMAN][16] = ""
Description[ENGLISH][16] = "Kill drow for Guardian 4. You still need 3."
Description[GERMAN][17] = ""
Description[ENGLISH][17] = "Kill drow for Guardian 4. You still need 2."
Description[GERMAN][18] = ""
Description[ENGLISH][18] = "Kill drow for Guardian 4. You still need 1."
Description[GERMAN][19] = ""
Description[ENGLISH][19] = "Report back to Guardian 4, you have finished his test."

Description[GERMAN][20] = ""
Description[ENGLISH][20] = "Collect 20 silver goblets for Guardian 5."
Description[GERMAN][21] = ""
Description[ENGLISH][21] = "The next Guardian may have a task for you."

Description[GERMAN][22] = ""
Description[ENGLISH][22] = "Kill drow for Guardian 6.  You still need 10."
Description[GERMAN][23] = ""
Description[ENGLISH][23] = "Kill drow for Guardian 6.  You still need 9."
Description[GERMAN][24] = ""
Description[ENGLISH][24] = "Kill drow for Guardian 6.  You still need 8."
Description[GERMAN][25] = ""
Description[ENGLISH][25] = "Kill drow for Guardian 6.  You still need 7."
Description[GERMAN][26] = ""
Description[ENGLISH][26] = "Kill drow for Guardian 6.  You still need 6."
Description[GERMAN][27] = ""
Description[ENGLISH][27] = "Kill drow for Guardian 6.  You still need 5."
Description[GERMAN][28] = ""
Description[ENGLISH][28] = "Kill drow for Guardian 6.  You still need 4."
Description[GERMAN][29] = ""
Description[ENGLISH][29] = "Kill drow for Guardian 6.  You still need 3."
Description[GERMAN][30] = ""
Description[ENGLISH][30] = "Kill drow for Guardian 6.  You still need 2."
Description[GERMAN][31] = ""
Description[ENGLISH][31] = "Kill drow for Guardian 6.  You still need 1."
Description[GERMAN][32] = ""
Description[ENGLISH][32] = "Report back to Guardian 6, you have finished his test."

Description[GERMAN][33] = ""
Description[ENGLISH][33] = "Collect 10 golden goblets for Guardian 7."
Description[GERMAN][34] = ""
Description[ENGLISH][34] = "The next Guardian may have a task for you."

Description[GERMAN][35] = ""
Description[ENGLISH][35] = "Kill drow warrior for Guardian 8. You still need 10."
Description[GERMAN][36] = ""
Description[ENGLISH][36] = "Kill drow warrior for Guardian 8. You still need 9."
Description[GERMAN][37] = ""
Description[ENGLISH][37] = "Kill drow warrior for Guardian 8. You still need 8."
Description[GERMAN][38] = ""
Description[ENGLISH][38] = "Kill drow warrior for Guardian 8. You still need 7."
Description[GERMAN][39] = ""
Description[ENGLISH][39] = "Kill drow warrior for Guardian 8. You still need 6."
Description[GERMAN][40] = ""
Description[ENGLISH][40] = "Kill drow warrior for Guardian 8. You still need 5."
Description[GERMAN][41] = ""
Description[ENGLISH][41] = "Kill drow warrior for Guardian 8. You still need 4."
Description[GERMAN][42] = ""
Description[ENGLISH][42] = "Kill drow warrior for Guardian 8. You still need 3."
Description[GERMAN][43] = ""
Description[ENGLISH][43] = "Kill drow warrior for Guardian 8. You still need 2."
Description[GERMAN][44] = ""
Description[ENGLISH][44] = "Kill drow warrior for Guardian 8. You still need 1."
Description[GERMAN][45] = ""
Description[ENGLISH][45] = "Report back to Guardian 8, you have finished his test."

Description[GERMAN][46] = ""
Description[ENGLISH][46] = "Collect 1 drow armour for Guardian 9."
Description[GERMAN][47] = ""
Description[ENGLISH][47] = "The next Guardian may have a task for you."

Description[GERMAN][48] = ""
Description[ENGLISH][48] = "Kill drow for Guardian 10.  You still need 12."
Description[GERMAN][49] = ""
Description[ENGLISH][49] = "Kill drow for Guardian 10.  You still need 11."
Description[GERMAN][50] = ""
Description[ENGLISH][50] = "Kill drow for Guardian 10. You still need 10."
Description[GERMAN][51] = ""
Description[ENGLISH][51] = "Kill drow for Guardian 10. You still need 9."
Description[GERMAN][52] = ""
Description[ENGLISH][52] = "Kill drow for Guardian 10. You still need 8."
Description[GERMAN][53] = ""
Description[ENGLISH][53] = "Kill drow for Guardian 10. You still need 7."
Description[GERMAN][54] = ""
Description[ENGLISH][54] = "Kill drow for Guardian 10. You still need 6."
Description[GERMAN][55] = ""
Description[ENGLISH][55] = "Kill drow for Guardian 10. You still need 5."
Description[GERMAN][56] = ""
Description[ENGLISH][56] = "Kill drow for Guardian 10. You still need 4."
Description[GERMAN][57] = ""
Description[ENGLISH][57] = "Kill drow for Guardian 10. You still need 3."
Description[GERMAN][58] = ""
Description[ENGLISH][58] = "Kill drow for Guardian 10. You still need 2."
Description[GERMAN][59] = ""
Description[ENGLISH][59] = "Kill drow for Guardian 10. You still need 1."
Description[GERMAN][60] = ""
Description[ENGLISH][60] = "Report back to Guardian 10, you have finished his test."

Description[GERMAN][61] = ""
Description[ENGLISH][61] = "Collect 5 elven rainbow swords for Guardian 11."
Description[GERMAN][62] = ""
Description[ENGLISH][62] = "The next Guardian may have a task for you."

Description[GERMAN][63] = ""
Description[ENGLISH][63] = "Collect 4 drow helmets for Guardian 12."
Description[GERMAN][64] = ""
Description[ENGLISH][64] = "The next Guardian may have a task for you."

Description[GERMAN][65] = ""
Description[ENGLISH][65] = "Kill mummies for Guardian 13.  You still need 15."
Description[GERMAN][66] = ""
Description[ENGLISH][66] = "Kill mummies for Guardian 13.  You still need 14."
Description[GERMAN][67] = ""
Description[ENGLISH][67] = "Kill mummies for Guardian 13.  You still need 13."
Description[GERMAN][68] = ""
Description[ENGLISH][68] = "Kill mummies for Guardian 13.  You still need 12."
Description[GERMAN][69] = ""
Description[ENGLISH][69] = "Kill mummies for Guardian 13.  You still need 11."
Description[GERMAN][70] = ""
Description[ENGLISH][70] = "Kill mummies for Guardian 13.  You still need 10."
Description[GERMAN][71] = ""
Description[ENGLISH][71] = "Kill mummies for Guardian 13.  You still need 9."
Description[GERMAN][72] = ""
Description[ENGLISH][72] = "Kill mummies for Guardian 13.  You still need 8."
Description[GERMAN][73] = ""
Description[ENGLISH][73] = "Kill mummies for Guardian 13.  You still need 7."
Description[GERMAN][74] = ""
Description[ENGLISH][74] = "Kill mummies for Guardian 13.  You still need 6."
Description[GERMAN][75] = ""
Description[ENGLISH][75] = "Kill mummies for Guardian 13.  You still need 5."
Description[GERMAN][76] = ""
Description[ENGLISH][76] = "Kill mummies for Guardian 13.  You still need 4."
Description[GERMAN][77] = ""
Description[ENGLISH][77] = "Kill mummies for Guardian 13.  You still need 3."
Description[GERMAN][78] = ""
Description[ENGLISH][78] = "Kill mummies for Guardian 13.  You still need 2."
Description[GERMAN][79] = ""
Description[ENGLISH][79] = "Kill mummies for Guardian 13.  You still need 1."
Description[GERMAN][80] = ""
Description[ENGLISH][80] = "Report back to Guardian 13, you have finished his test."

Description[GERMAN][81] = ""
Description[ENGLISH][81] = "Kill skeletons for Guardian 14.  You still need 15."
Description[GERMAN][82] = ""
Description[ENGLISH][82] = "Kill skeletons for Guardian 14.  You still need 14."
Description[GERMAN][83] = ""
Description[ENGLISH][83] = "Kill skeletons for Guardian 14.  You still need 13."
Description[GERMAN][84] = ""
Description[ENGLISH][84] = "Kill skeletons for Guardian 14.  You still need 12."
Description[GERMAN][85] = ""
Description[ENGLISH][85] = "Kill skeletons for Guardian 14.  You still need 11."
Description[GERMAN][86] = ""
Description[ENGLISH][86] = "Kill skeletons for Guardian 14.  You still need 10."
Description[GERMAN][87] = ""
Description[ENGLISH][87] = "Kill skeletons for Guardian 14.  You still need 9."
Description[GERMAN][88] = ""
Description[ENGLISH][88] = "Kill skeletons for Guardian 14.  You still need 8."
Description[GERMAN][89] = ""
Description[ENGLISH][89] = "Kill skeletons for Guardian 14.  You still need 7."
Description[GERMAN][90] = ""
Description[ENGLISH][90] = "Kill skeletons for Guardian 14.  You still need 6."
Description[GERMAN][91] = ""
Description[ENGLISH][91] = "Kill skeletons for Guardian 14.  You still need 5."
Description[GERMAN][92] = ""
Description[ENGLISH][92] = "Kill skeletons for Guardian 14.  You still need 4."
Description[GERMAN][93] = ""
Description[ENGLISH][93] = "Kill skeletons for Guardian 14.  You still need 3."
Description[GERMAN][94] = ""
Description[ENGLISH][94] = "Kill skeletons for Guardian 14.  You still need 2."
Description[GERMAN][95] = ""
Description[ENGLISH][95] = "Kill skeletons for Guardian 14.  You still need 1."
Description[GERMAN][96] = ""
Description[ENGLISH][96] = "Report back to Guardian 14, you have finished his test."

Description[GERMAN][97] = ""
Description[ENGLISH][97] = "Collect 20 white cloth for Guardian 15."
Description[GERMAN][98] = ""
Description[ENGLISH][98] = "The next Guardian may have a task for you."

Description[GERMAN][99] = ""
Description[ENGLISH][99] = "Collect 25 big empty bottles for Guardian 16."
Description[GERMAN][100] = ""
Description[ENGLISH][100] = "The next Guardian may have a task for you."

Description[GERMAN][101] = ""
Description[ENGLISH][101] = "Collect 2 drow blades for Guardian 17."
Description[GERMAN][102] = ""
Description[ENGLISH][102] = "The next Guardian may have a task for you."

Description[GERMAN][103] = ""
Description[ENGLISH][103] = "Kill drow for Guardian 18. You still need 15."
Description[GERMAN][104] = ""
Description[ENGLISH][104] = "Kill drow for Guardian 18. You still need 14."
Description[GERMAN][105] = ""
Description[ENGLISH][105] = "Kill drow for Guardian 18. You still need 13."
Description[GERMAN][106] = ""
Description[ENGLISH][106] = "Kill drow for Guardian 18.  You still need 12."
Description[GERMAN][107] = ""
Description[ENGLISH][107] = "Kill drow for Guardian 18.  You still need 11."
Description[GERMAN][108] = ""
Description[ENGLISH][108] = "Kill drow for Guardian 18. You still need 10."
Description[GERMAN][109] = ""
Description[ENGLISH][109] = "Kill drow for Guardian 18. You still need 9."
Description[GERMAN][110] = ""
Description[ENGLISH][110] = "Kill drow for Guardian 18. You still need 8."
Description[GERMAN][111] = ""
Description[ENGLISH][111] = "Kill drow for Guardian 18. You still need 7."
Description[GERMAN][112] = ""
Description[ENGLISH][112] = "Kill drow for Guardian 18. You still need 6."
Description[GERMAN][113] = ""
Description[ENGLISH][113] = "Kill drow for Guardian 18. You still need 5."
Description[GERMAN][114] = ""
Description[ENGLISH][114] = "Kill drow for Guardian 18. You still need 4."
Description[GERMAN][115] = ""
Description[ENGLISH][115] = "Kill drow for Guardian 18. You still need 3."
Description[GERMAN][116] = ""
Description[ENGLISH][116] = "Kill drow for Guardian 18. You still need 2."
Description[GERMAN][117] = ""
Description[ENGLISH][117] = "Kill drow for Guardian 18. You still need 1."
Description[GERMAN][118] = ""
Description[ENGLISH][118] = "Report back to Guardian 18, you have finished his test."

Description[GERMAN][119] = ""
Description[ENGLISH][119] = "Collect 1 sky shield for Guardian 19."
Description[GERMAN][120] = ""
Description[ENGLISH][120] = "The next Guardian may have a task for you."

Description[GERMAN][121] = ""
Description[ENGLISH][121] = "Kill drow for Guardian 20. You still need 18."
Description[GERMAN][122] = ""
Description[ENGLISH][122] = "Kill drow for Guardian 20. You still need 17."
Description[GERMAN][123] = ""
Description[ENGLISH][123] = "Kill drow for Guardian 20. You still need 16."
Description[GERMAN][124] = ""
Description[ENGLISH][124] = "Kill drow for Guardian 20. You still need 15."
Description[GERMAN][125] = ""
Description[ENGLISH][125] = "Kill drow for Guardian 20. You still need 14."
Description[GERMAN][126] = ""
Description[ENGLISH][126] = "Kill drow for Guardian 20. You still need 13."
Description[GERMAN][127] = ""
Description[ENGLISH][127] = "Kill drow for Guardian 20.  You still need 12."
Description[GERMAN][128] = ""
Description[ENGLISH][128] = "Kill drow for Guardian 20.  You still need 11."
Description[GERMAN][129] = ""
Description[ENGLISH][129] = "Kill drow for Guardian 20. You still need 10."
Description[GERMAN][130] = ""
Description[ENGLISH][130] = "Kill drow for Guardian 20. You still need 9."
Description[GERMAN][131] = ""
Description[ENGLISH][131] = "Kill drow for Guardian 20. You still need 8."
Description[GERMAN][132] = ""
Description[ENGLISH][132] = "Kill drow for Guardian 20. You still need 7."
Description[GERMAN][133] = ""
Description[ENGLISH][133] = "Kill drow for Guardian 20. You still need 6."
Description[GERMAN][134] = ""
Description[ENGLISH][134] = "Kill drow for Guardian 20. You still need 5."
Description[GERMAN][135] = ""
Description[ENGLISH][135] = "Kill drow for Guardian 20. You still need 4."
Description[GERMAN][136] = ""
Description[ENGLISH][136] = "Kill drow for Guardian 20. You still need 3."
Description[GERMAN][137] = ""
Description[ENGLISH][137] = "Kill drow for Guardian 20. You still need 2."
Description[GERMAN][138] = ""
Description[ENGLISH][138] = "Kill drow for Guardian 20. You still need 1."
Description[GERMAN][139] = ""
Description[ENGLISH][139] = "Report back to Guardian 20, you have finished his test."

Description[GERMAN][140] = ""
Description[ENGLISH][140] = "Kill drow for Guardian 21.  You still need 20."
Description[GERMAN][141] = ""
Description[ENGLISH][141] = "Kill drow for Guardian 21.  You still need 19."
Description[GERMAN][142] = ""
Description[ENGLISH][142] = "Kill drow for Guardian 21. You still need 18."
Description[GERMAN][143] = ""
Description[ENGLISH][143] = "Kill drow for Guardian 21. You still need 17."
Description[GERMAN][144] = ""
Description[ENGLISH][144] = "Kill drow for Guardian 21. You still need 16."
Description[GERMAN][145] = ""
Description[ENGLISH][145] = "Kill drow for Guardian 21. You still need 15."
Description[GERMAN][146] = ""
Description[ENGLISH][146] = "Kill drow for Guardian 21. You still need 14."
Description[GERMAN][147] = ""
Description[ENGLISH][147] = "Kill drow for Guardian 21. You still need 13."
Description[GERMAN][148] = ""
Description[ENGLISH][148] = "Kill drow for Guardian 21.  You still need 12."
Description[GERMAN][149] = ""
Description[ENGLISH][149] = "Kill drow for Guardian 21.  You still need 11."
Description[GERMAN][150] = ""
Description[ENGLISH][150] = "Kill drow for Guardian 21. You still need 10."
Description[GERMAN][151] = ""
Description[ENGLISH][151] = "Kill drow for Guardian 21. You still need 9."
Description[GERMAN][152] = ""
Description[ENGLISH][152] = "Kill drow for Guardian 21. You still need 8."
Description[GERMAN][153] = ""
Description[ENGLISH][153] = "Kill drow for Guardian 21. You still need 7."
Description[GERMAN][154] = ""
Description[ENGLISH][154] = "Kill drow for Guardian 21. You still need 6."
Description[GERMAN][155] = ""
Description[ENGLISH][155] = "Kill drow for Guardian 21. You still need 5."
Description[GERMAN][156] = ""
Description[ENGLISH][156] = "Kill drow for Guardian 21. You still need 4."
Description[GERMAN][157] = ""
Description[ENGLISH][157] = "Kill drow for Guardian 21. You still need 3."
Description[GERMAN][158] = ""
Description[ENGLISH][158] = "Kill drow for Guardian 21. You still need 2."
Description[GERMAN][159] = ""
Description[ENGLISH][159] = "Kill drow for Guardian 21. You still need 1."
Description[GERMAN][160] = ""
Description[ENGLISH][160] = "Report back to Guardian 21, you have finished his test."

Description[GERMAN][161] = ""
Description[ENGLISH][161] = "Kill drow for Guardian 22.  You still need 25."
Description[GERMAN][162] = ""
Description[ENGLISH][162] = "Kill drow for Guardian 22.  You still need 24."
Description[GERMAN][163] = ""
Description[ENGLISH][163] = "Kill drow for Guardian 22.  You still need 23."
Description[GERMAN][164] = ""
Description[ENGLISH][164] = "Kill drow for Guardian 22.  You still need 22."
Description[GERMAN][165] = ""
Description[ENGLISH][165] = "Kill drow for Guardian 22.  You still need 21."
Description[GERMAN][166] = ""
Description[ENGLISH][166] = "Kill drow for Guardian 22.  You still need 20."
Description[GERMAN][167] = ""
Description[ENGLISH][167] = "Kill drow for Guardian 22.  You still need 19."
Description[GERMAN][168] = ""
Description[ENGLISH][168] = "Kill drow for Guardian 22. You still need 18."
Description[GERMAN][169] = ""
Description[ENGLISH][169] = "Kill drow for Guardian 22. You still need 17."
Description[GERMAN][170] = ""
Description[ENGLISH][170] = "Kill drow for Guardian 22. You still need 16."
Description[GERMAN][171] = ""
Description[ENGLISH][171] = "Kill drow for Guardian 22. You still need 15."
Description[GERMAN][172] = ""
Description[ENGLISH][172] = "Kill drow for Guardian 22. You still need 14."
Description[GERMAN][173] = ""
Description[ENGLISH][173] = "Kill drow for Guardian 22. You still need 13."
Description[GERMAN][174] = ""
Description[ENGLISH][174] = "Kill drow for Guardian 22.  You still need 12."
Description[GERMAN][175] = ""
Description[ENGLISH][175] = "Kill drow for Guardian 22.  You still need 11."
Description[GERMAN][176] = ""
Description[ENGLISH][176] = "Kill drow for Guardian 22. You still need 10."
Description[GERMAN][177] = ""
Description[ENGLISH][177] = "Kill drow for Guardian 22. You still need 9."
Description[GERMAN][178] = ""
Description[ENGLISH][178] = "Kill drow for Guardian 22. You still need 8."
Description[GERMAN][179] = ""
Description[ENGLISH][179] = "Kill drow for Guardian 22. You still need 7."
Description[GERMAN][180] = ""
Description[ENGLISH][180] = "Kill drow for Guardian 22. You still need 6."
Description[GERMAN][181] = ""
Description[ENGLISH][181] = "Kill drow for Guardian 22. You still need 5."
Description[GERMAN][182] = ""
Description[ENGLISH][182] = "Kill drow for Guardian 22. You still need 4."
Description[GERMAN][183] = ""
Description[ENGLISH][183] = "Kill drow for Guardian 22. You still need 3."
Description[GERMAN][184] = ""
Description[ENGLISH][184] = "Kill drow for Guardian 22. You still need 2."
Description[GERMAN][185] = ""
Description[ENGLISH][185] = "Kill drow for Guardian 22. You still need 1."
Description[GERMAN][186] = ""
Description[ENGLISH][186] = "Report back to Guardian 22, you have finished his test."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {816, 440, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(816, 440, 0)}
QuestTarget[2] = {position(816, 440, 0)}

QuestTarget[3] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[4] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[5] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[6] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[7] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[8] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[9] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[10] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[11] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[12] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[13] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[14] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[15] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[16] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[17] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[18] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[19] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[20] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[21] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[22] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[23] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[24] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[25] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[26] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[27] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[28] = {position(816, 440, 0)}

QuestTarget[29] = {position(816, 440, 0)}
QuestTarget[30] = {position(816, 440, 0), position(773,444,0)}
QuestTarget[31] = {position(816, 440, 0)}

QuestTarget[32] = {position(816, 440, 0)}
QuestTarget[33] = {position(816, 440, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 34


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
