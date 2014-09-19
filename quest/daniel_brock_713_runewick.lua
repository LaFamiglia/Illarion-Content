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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (713, 'quest.daniel_brock_713_runewick');

local common = require("base.common")
local factions = require("base.factions")
module("quest.daniel_brock_713_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schreinerhandwerk"
Title[ENGLISH] = "The carpentry craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Apfelholzbretter und zeig diese Daniel Brock im Untergeschoss des Luftturms. Sammel erstmal mit dem Beil an einem Apfelbaum in Yewdale zehn Apfelholzscheite. Dazu nimmst du das Beil in die Hand und benutzt es, w�hrend du vor einem Apfelbaum stehst. Hast du das erstmal gemacht, geh zur�ck zu Daniel und s�ge die Scheite mit der S�ge in der Hand bei der Werkbank zu Brettern. Yewdale ist bei der goldenen Br�cke n�rdlich des Teleporters."
Description[ENGLISH][1] = "Collect ten applewood boards for Daniel Brock in the basement of the Wind Tower. You should start by collecting ten applewood in Yewdale by using the hatchet in your hand, whilst standing in front of an apple tree. Once you have the applewood you can saw it into boards in the workshop by using the workbench as you stand in front of it, with the saw in your hand. Yewdale is at the golden bridge north of the teleporter."
Description[GERMAN][2] = "Geh zu Daniel Brock, der sich im Untergeschoss des Windturms aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][2] = "Go back to Daniel Brock in the basement of the Wind Tower, he is sure to have another task for you."
Description[GERMAN][3] = "Stell zehn Teller f�r Daniel Brock im Untergeschoss des Luftturms. Um die Teller herzustellen, brauchst du Apfelholzbretter. Hast du diese, nimmst du den Hobel in die Hand und benutzt ihn, w�hrend du vor einer Werkbank stehst."
Description[ENGLISH][3] = "Produce ten plates for Daniel Brock in the basement of the Wind Tower. To produce the plates you need applewood boards. Once you have them, take the plane in your hand and use it whilst standing in front of the workbench."
Description[GERMAN][4] = "Geh zu Daniel Brock, der sich im Untergeschoss des Windturms aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][4] = "Go back to Daniel Brock in the basement of the Wind Tower, he is sure to have another task for you."
Description[GERMAN][5] = "Stell f�r Daniel Brock, der sich im Untergeschoss des Luftturms aufh�lt, 25 N�gel und Keile her. Um die N�gel und Keile herzustellen, brauchst du �ste und N�gel. N�gel k�nnen von Schmieden hergestellt werden. �ste findest du manchmal beim F�llen von Apfelb�umen. Hast du erstmal f�nf �ste gefunden, kehr zur Werkstatt zur�ck und fertige mit dem Schnitzmesser in der Hand bei der Werkbank 25 N�gel und Keile."
Description[ENGLISH][5] = "Produce twenty five pins and cotters for Daniel Brock in the basement of the Wind Tower. To produce the pins and cotters you need five boughs and the pins first of all. You can get boughs by chopping down an apple tree; pins can be made by a smith. Once you have the boughs return to the workshop and produce twenty five pins and cotters by using the carving tools in your hand whilst at the workbench."
Description[GERMAN][6] = "Du hast alle Aufgaben von Daniel Brock erf�llt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Daniel Brock."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {904, 827, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(904, 827, 0), position(792, 819, 0)} -- Apple tree
QuestTarget[2] = {position(904, 827, 0)} 
QuestTarget[3] = {position(904, 827, 0), position(902, 825, 0)} -- Work bench
QuestTarget[4] = {position(904, 827, 0)} 
QuestTarget[5] = {position(904, 827, 0), position(902, 825, 0)} -- Work bench
QuestTarget[6] = {position(904, 827, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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
    if factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
