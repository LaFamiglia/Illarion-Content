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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (205, 'quest.neiran_el_nyarale_205_runewick');
     
	 
local common = require("base.common")
local factions = require("base.factions")
module("quest.neiran_el_nyarale_205_runewick", package.seeall)
     
	 
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Schatzkammer Runewicks"
Title[ENGLISH] = "Runewick Treasury"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Spende Gegenst�nde oder M�nzen f�r die Schatzkammer Runewicks. Lege daf�r den Gegenstand auf das markierte Feld neben Neiran."
Description[ENGLISH][1] = "Donate items or coins to Runewick's treasury. Put the item on the bordered area next to Neiran."
Description[GERMAN][2] =  "Kehre zu Neiran el Nyarale zur�ck."
Description[ENGLISH][2] =  "Go back to Neiran el Nyarale."
Description[GERMAN][3] = "Du hast schon einmal f�r Runewick gespendet, dies sollte dich aber nicht davon abhalten, weiter Gegenst�nde oder M�nzen f�r deine Stadt zu spenden."
Description[ENGLISH][3] = "You have already donated to Runewick but nevertheless you can always donate more items or coins to your town." 


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {897, 781, 2}

 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(897, 779, 2), position(897, 781, 2)} 
QuestTarget[2] = {position(897, 781, 2)}
QuestTarget[3] = {position(897, 781, 2)}

     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3
     
     
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
