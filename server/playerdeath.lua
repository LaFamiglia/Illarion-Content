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
-- Player death
-- deadPlayer - The player (character) whose hitpoints have just been set to zero

local common = require("base.common")

local M = {}

local DURABILITY_LOSS = 10
local BLOCKED_ITEM = 228

local function showDeathDialog(deadPlayer)

    local dialogTitle = common.GetNLS(User, "Tod", "Death")
    local dialogText = common.GetNLS(User,
        "Du bist gestorben. Deine Ausr�stung nimmt schweren Schaden. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den G�ttern in Chergas Reich der Toten gegen�berzutreten. Du wirst in einer Minute wiederbelebt - so wenn die G�tter es wollen.",
        "You have died. Your equipment got damaged seriously. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm. You will respawn in a minute - so the gods will.")
    local callback = function(nothing) end --empty callback
    local dialog = MessageDialog(dialogTitle, dialogText, callback)

    deadPlayer:requestMessageDialog(dialog)

end

function M.playerDeath(deadPlayer)

    if deadPlayer:isAdmin() then --Admins don't die.

        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] Admins sterben nicht.", "[Respawn] Admins don't die.")
        return --bailing out!

    elseif deadPlayer.pos.z == 100 or deadPlayer.pos.z == 101 then --someone died on Noobia!

        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        world:gfx(53, deadPlayer.pos)
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] W�hrend des Tutorials bist du 'unsterblich'. Im Hauptspiel ist die Wiederbelebung mit merklichen Konsequenzen f�r deinen Charakter verbunden.", "[Respawn] During the tutorial, you are 'immortal'. In the main game, serious consequences for your character are triggered upon respawn.")
        return --bailing out!

    elseif deadPlayer.pos.z == -40 then -- death in the prison mine; no kill taxi!

        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        world:gfx(53, deadPlayer.pos)
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] In der Gef�ngnismine bist du 'unsterblich'. Weiterarbeiten!", "[Respawn] In the prison mine, you are 'immortal'. Work on!")
        return --bailing out!

    else --valid death

        world:makeSound(25, deadPlayer.pos)
        showDeathDialog(deadPlayer)

        for i = Character.head, Character.coat do
            local item = deadPlayer:getItemAt(i)
            local commonItem = world:getItemStats(item)

            if item.id > 0 and item.id ~= BLOCKEDITEM and item.quality > 100 and not commonItem.isStackable then
                local durability = item.quality % 100
                local newbieModficator = 1
                if deadPlayer:isNewPlayer() then
                    newbieModficator = 2
                end

                if durability <= DURABILITY_LOSS / newbieModficator then
                    deadPlayer:increaseAtPos(i, -1)
                    local nameText = world:getItemName(item.id, deadPlayer:getPlayerLanguage())
                    common.HighInformNLS(deadPlayer, "[Tod] Dein Gegenstand '"..nameText.."' wurde zerst�rt.", "[Death] Your item '"..nameText.."' was destroyed.")
                else
                    item.quality = item.quality - DURABILITY_LOSS / newbieModficator
                    world:changeItem(item)
                end
            end
        end
    end
end

return M
