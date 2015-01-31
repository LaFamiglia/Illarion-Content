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
-- Quest: Zzarn'K Ska of Zelphia (501) - Saving Triggerfield events.
-- INSERT INTO triggerfields VALUES (638, 272, -9,'zzarnkskaofzelphia.lua');
-- INSERT INTO triggerfields VALUES (722, 258, -9,'zzarnkskaofzelphia.lua');
-- INSERT INTO triggerfields VALUES (782, 297, -9,'zzarnkskaofzelphia.lua');
.
local common = require("base.common")

local M = {}

function M.MoveToField(User)
    
    if  User:getQuestProgress(501) == 1 and User:isInRangeToPosition((position (638, 272, -9)), 10) then -- Player found Lake of Life Dungeon entrance.
        User:setQuestProgress(501, 2)
        common.InformNLS(User, "", "You have found the entrance to the Lake of Life. Return to Ssalva, you have finished her task.")      
        end
		
	elseif User:getQuestProgress(501) == 4 and User:isInRangeToPosition((position (722 , 258, -9)), 10) then -- Player found Lake of Life Dungeon second Island.
	    User:setQuestProgress(501, 5)
        common.InformNLS(User, "", "You have found the second island. Return to Ssalva, you have finished her task.")
	end
end	

function M.PutItemOnField(Item,User)
    if (User:getQuestProgress(501) == 9) and if Item.pos == altarPlate and Item.id == donatedItem then --  doing the quest - water blossom on the altar
	    world:gfx(46, Item.pos) -- nice GFX
        world:erase(Item, Item.number) -- delete the item
	    User:setQuestProgress(501, 10)
		common.InformNLS(User, "", "You have placed your offering. Return to Ssalva, you have finished her task.") 
        end
	end
	
local altarPlate = position(782, 297, -9)

local donatedItem = {
{itemId = 767, amount = 1}, --[[water blossom]]
}

return M

