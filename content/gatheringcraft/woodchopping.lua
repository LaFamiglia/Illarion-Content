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

-- trees

-- additional tool: axe ( 74 )

local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.woodchopping", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	gathering.InitGathering();
	local theCraft = gathering.woodchopping;

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
	if (User:countItemAt("all",74)==0) then
		common.HighInformNLS( User,
		"Du brauchst ein Beil um Holz zu hacken.",
		"You need a hatchet to chop wood." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 74 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 74 ) then
			common.HighInformNLS( User,
			"Du musst das Beil in der Hand haben!",
			"You have to hold the hatchet in your hand!" );
			return
		end
	end

	if not common.FitForWork( User ) then -- check minimal food points
		return
	end

	common.TurnTo( User, SourceItem.pos ); -- turn if necessary


	-- check if it is a special and therefore uncuttable tree
	if SourceItem:getData("treeProtectionType") ~= "" then
	    preventCutting(User, toolItem, SourceItem)
		return
	end

	local tree = TreeItems[SourceItem.id];

	-- check the amount
	local changeItem = false;
	local amount = SourceItem:getData("wood_amount");
	if ( amount == "" ) then
		amount = tree.Amount;
		SourceItem:setData("wood_amount", "" .. amount);
		changeItem = true;
	else
		amount = tonumber(amount);
	end

	if ( amount <= 0 ) then
		-- should never happen, but handle it nevertheless
		world:erase(SourceItem, SourceItem.number);
		world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
		common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,toolItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
		User:talk(Character.say, "#me beginnt Holz zu hacken.", "#me starts to chop wood.")
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return;
	end

	-- since we're here, we're working
	User:performAnimation(5);
	if theCraft:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return
	end

	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	amount = amount - 1;
	SourceItem:setData("wood_amount", "" .. amount);
	world:changeItem(SourceItem);

	local producedItemId = tree.LogId;
	if (math.random() <= tree.BoughProbability ) then
		producedItemId = tree.BoughId;
	end
	local notCreated = User:createItem( producedItemId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( producedItemId, notCreated, User.pos, true, 333, nil );
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (amount > 0) then  -- there are still items we can work on
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,toolItem);
			User:changeSource(SourceItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
		end
	end

	if common.GatheringToolBreaks( User, toolItem, theCraft:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		common.HighInformNLS(User,
		"Dein altes Beil zerbricht.",
		"Your old hatchet breaks.");
	end
	if ( amount <= 0 ) then
		world:erase(SourceItem, SourceItem.number);
		world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
		common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end

end

function InitTreeItems()
	if ( TreeItems ~= nil ) then
		return;
	end
	TreeItems = {};

	AddTree(  11,125,2560,  56,10,0.4); -- apple tree
    AddTree(  14,125,2560,  56,10,0.4); -- apple tree
    AddTree( 299,541, 543,2786,15,0.4); -- cherry tree
    AddTree( 300,541, 543,2786,15,0.4); -- cherry tree
    AddTree( 308,309,   3,   56,12,0.4); -- fir tree
    AddTree( 586,587, 544,  56,10,0.4); -- cachdern tree
    AddTree(1804,542, 544,  56,15,0.4); -- naldor tree
    AddTree(1809,584, 544,  56,24,0.4); -- eldan oak
    AddTree(1817,585,   3,   56,19,0.4); -- scandrel pine
end

function AddTree(TreeId, TrunkId, LogId, BoughId, Amount, BoughProbability)
	local treeTable = {};
	treeTable.TrunkId = TrunkId;
	treeTable.LogId = LogId;
	treeTable.BoughId = BoughId;
	treeTable.Amount = Amount;
	treeTable.BoughProbability = BoughProbability;
	table.insert(TreeItems, TreeId, treeTable);
end

unchoppableTrees = {}
unchoppableTrees[203] = true
unchoppableTrees[892] = true
unchoppableTrees[893] = true
unchoppableTrees[894] = true
unchoppableTrees[910] = true
unchoppableTrees[911] = true
unchoppableTrees[912] = true
unchoppableTrees[913] = true
unchoppableTrees[959] = true
unchoppableTrees[960] = true
unchoppableTrees[961] = true
unchoppableTrees[962] = true
unchoppableTrees[963] = true
unchoppableTrees[1193] = true
unchoppableTrees[1194] = true
unchoppableTrees[1195] = true
unchoppableTrees[1198] = true
unchoppableTrees[1807] = true
unchoppableTrees[1808] = true

function preventCutting(User, theAxe, theTree)
    
	local effectType = theTree:getData("treeProtectionType")

	if effectType == "lightning" then
	    world:gfx(2,User.pos)
		world:makeSound(13,User.pos)
		User:inform("Aus heiterem Himmel wirst du von einem Blitz getroffen!", "Out of the blue, you are struck by lightning!", Character.highPriority)
		User:increaseAttrib("hitpoints",-3000)
	elseif effectType == "axeSlippingOff" then
        User:inform("Als du zum F�llen ausholst, rutscht dir das Beil fast aus der Hand. Du kannst es gerade noch so festhalten.", "As you strike out, you nearly drop the hatchet. You barely keep hold of it.", Character.highPriority)
	elseif effectType == "slimyAcid" then
		world:gfx(8,User.pos)
		world:gfx(11,User.pos)
		world:makeSound(9,User.pos)
		User:increaseAttrib("hitpoints",-1000)
		User:talk(Character.say, "#me wird, bevor die Axt den ber�hren kann, von einem dicken Batzen Schleim getroffen, der aus der Baumkrone heraustropfte.", "#me is, before the hatchet touches the tree, hit by a big blob of slime which dropped down from the treetrop.")
		User:inform("Der Schleim verursacht ein �beraus schmerzhaftes Brennen auf deiner Haut.", "The slime causes very painful burning to your skin.", Character.highPriority)
	else
		User:inform("Als du zum F�llen ausholst, rutscht dir das Beil fast aus der Hand. Du kannst es gerade noch so festhalten.", "As you strike out, you nearly drop the hatchet. You barely keep hold of it.", Character.highPriority)
		debug("Tree at " .. theTree.x .. ", " .. theTree.y .. ", " .. theTree.z .. " is missing a proper data value for the data key treeProtectionType")
	end

end

function isChoppableTree(targetItem)
	InitTreeItems();

	if targetItem ~= nil and TreeItems[targetItem.id] ~= nil then
		return true;
	end

	return false;
end

function isUnchoppableTree(targetItem,User)
	
	if targetItem ~= nil and unchoppableTrees[targetItem.id] ~= nil then
		common.TurnTo( User, targetItem.pos )
		User:inform("Diese Baumart kann nicht gef�llt werden.","This kind of tree cannot be cut down.")
		return true;
	end

end

function getTree(User)

	local tree = checkForTree(User,isChoppableTree)
	if not tree then
		if checkForTree(User,isUnchoppableTree) then
			return false
		end
	end
	
	return tree
end

function checkForTree(User,theFunction)

	local targetItem = common.GetFrontItem(User);
	if theFunction(targetItem,User) then
		return targetItem;
	end

	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isItemOnField(pos) ) then
				targetItem = world:getItemOnField(pos);
				if theFunction(targetItem,User) then
					return targetItem;
				end
			end
		end
	end
	return nil;

end