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

-- no static tool

--- entrails (63) --> thread (50)

-- additional tool: scissors (6)

local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.entrailscutting", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	gathering.InitGathering();
	local entrailscutting = gathering.entrailscutting;

	common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
		return
	end

--	if not common.CheckItem( User, SourceItem ) then -- security check
--		return
--	end

	-- additional tool item is needed
	if (User:countItemAt("all",6)==0) then
		common.HighInformNLS( User,
		"Du brauchst eine Schere um Garn herzustellen.",
		"You need a pair of scissors for producing thread." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 6 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 6 ) then
			common.HighInformNLS( User,
			"Du musst die Schere in der Hand haben!",
			"You have to hold the scissors in your hand!" );
			return
		end
	end

	if not common.FitForWork( User ) then -- check minimal food points
		return
	end

	-- any other checks?

	if (User:countItemAt("all",63)==0) then -- check for items to work on
		common.HighInformNLS( User,
		"Du brauchst Eingeweide um daraus Garn herzustellen.",
		"You need entrails for producing thread." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User, toolItem);
		User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Eingeweide zu zerschneiden.", "#me starts to cut entrails.")
		return
	end

	-- since we're here, we're working

	if entrailscutting:FindRandomItem(User) then
		return
	end

	User:learn( entrailscutting.LeadSkill, entrailscutting.SavedWorkTime[User.id], entrailscutting.LearnLimit);
	User:eraseItem( 63, 1 ); -- erase the item we're working on

	local notCreated = User:createItem( 50, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 50, notCreated, User.pos, true, 333, nil );
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",63)>0) then  -- there are still items we can work on
			entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User, toolItem);
			User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			common.HighInformNLS(User,
			"Du hast keine Eingeweide mehr.",
			"You have no entrails anymore.");
		end
	end

	if common.GatheringToolBreaks( User, toolItem, entrailscutting:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end
