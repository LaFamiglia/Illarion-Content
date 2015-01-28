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

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    if SourceItem.pos == position (763, 336, -9) and User:getQuestProgress(502) == 1 then --Zenia's Altar
        User:setQuestProgress(502, 2) --Prayer done
        common.InformNLS(User, "[Quest status]", "[Quest status] You feel as if you have prayed sufficient to please Zenia. Please return to her.") --sending the message
    elseif SourceItem.pos == position (763, 336, -9) and User:getQuestProgress(502) == 8 then -- Zenia's Altar
        world:deleteItem(2760, User.Pos, 4)
		
		
		
		ocal queststatus = User:getQuestProgress(522) -- here, we save which events were triggered
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 6) -- reading the digits of the queststatus as table
        if queststatuslist[1] == 0 then -- sword, only triggered once by each char
            common.InformNLS(User, "Du findest ein Schwert bei der Leiche des Drow.", "You discover a sword by the corpse of the drow.")
            local notCreated = User:createItem(3035, 1, 801, nil) -- create the item
            if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
                world:createItemFromId(3035, notCreated, User.pos, true, 801, nil)
                common.HighInformNLS(User,
                    "Du kannst nichts mehr tragen.",
                    "You can't carry any more.")
            end
        end
 
end

return M

