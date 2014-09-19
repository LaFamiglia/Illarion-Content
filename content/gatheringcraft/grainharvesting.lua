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

-- scythe ( 271 )

-- (fully grown) grain (248) --> bundle of grain (249)

local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.grainharvesting", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	gathering.InitGathering();
	local grainharvesting = gathering.grainharvesting;

	common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talk(Character.say, "#me unterbricht "..gText.." Arbeit.", "#me interrupts "..eText.." work.")
		return
	end

	if not common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	-- additional tool item is needed
	if (User:countItemAt("all",271)==0) then
		common.HighInformNLS( User,
		"Du brauchst eine Sense um Getreide zu schneiden.",
		"You need a scythe for cutting grain." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 271 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 271 ) then
			common.HighInformNLS( User,
			"Du musst die Sense in der Hand haben!",
			"You have to hold the scythe in your hand!" );
			return
		end
	end

	if not common.FitForWork( User ) then -- check minimal food points
		return
	end

	common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		grainharvesting.SavedWorkTime[User.id] = grainharvesting:GenWorkTime(User, toolItem);
		User:startAction( grainharvesting.SavedWorkTime[User.id], 0, 0, 0, 0);
        -- this is no batch action => no emote message, only inform player
        if grainharvesting.SavedWorkTime[User.id] > 15 then
            common.InformNLS(User,
            "Du schneidest das Getreide mit der Sense.",
            "You harvest the grain with the scythe.");
        end
		return
	end

	-- since we're here, we're working

	if grainharvesting:FindRandomItem(User) then
		return
	end

	User:learn( grainharvesting.LeadSkill, grainharvesting.SavedWorkTime[User.id], grainharvesting.LearnLimit);
	local amount = SourceItem:getData("amount");
	if ( amount == "" ) then
		-- this should never happen...
		User:inform("[ERROR] Grain has no amount set. Please inform a developer.");
		-- but continue anyway, just set the amount
		amount = 1;
	else
		amount = tonumber(amount);
	end
	world:erase(SourceItem, SourceItem.number); -- erase the item we're working on
	local notCreated = User:createItem( 249, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 249, notCreated, User.pos, true, 333, nil );
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		local a,b = GetNearbyGrain(User);
		if (a~=nil) then  -- there are still items we can work on
			grainharvesting.SavedWorkTime[User.id] = grainharvesting:GenWorkTime(User, toolItem);
			User:startAction( grainharvesting.SavedWorkTime[User.id], 0, 0, 0, 0);
		end
	end

	if common.GatheringToolBreaks( User, toolItem, grainharvesting:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		common.HighInformNLS(User,
		"Deine alte Sense zerbricht.",
		"Your old scythe breaks.");
		return
	end
end

-- @return TargetItem The fully grown grain or nil if nothing was found
-- @return foundYoungGrain True if not fully grown grain was found (not reliable if TargetItem~=nil !!!)
function GetNearbyGrain(User)
	local TargetItem = nil;
	local foundYoungGrain = false; -- check if we only find not fully grown grain
	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isItemOnField(pos) ) then
				TargetItem = world:getItemOnField(pos);
				if ( TargetItem.id == 248 ) then
					-- got it!
					return TargetItem, foundYoungGrain;
				elseif ( TargetItem.id == 246 or TargetItem.id == 247 ) then
					foundYoungGrain = true;
				end
				TargetItem = nil;
			end
		end
	end
	return TargetItem, foundYoungGrain;
end
