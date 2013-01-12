-- Forge off: 2836
-- Forge on: 2835

-- Forge off: 2837
-- Forge on: 2834

-- coal (21) + { iron ore (22), copper ore (2536), gold nuggets (234), 
--               merinium ore (2534) + pure fire (2553) } 
--          --> {iron (2535), copper (2550), gold (236), merinium (2571)} ingot

-- additional tool: crucible-pincers (2751)

-- UPDATE common SET com_script='item.id_2836_forge' WHERE com_itemid IN (2835,2836);
-- UPDATE common SET com_objectafterrot=2836 WHERE com_itemid = 2835;

require("base.common")
require("content.gathering")

module("item.id_2836_forge", package.seeall)

-- creates a simple item struct that specifies the id and the amount that is needed
-- @param itemId  The ID of that item.
-- @param itemAmount  The amount of that item. Default is 1.
function CreateItem(itemId, itemAmount)
  if (itemAmount == nil) then
    itemAmount = 1;
  end
  return {id = itemId, amount = itemAmount};
end

-- @param oreItem  Item struct of the ore. The amount specifies how many are required.
-- @param productItem  Item struct of the product (the ingot). The amount specifies how many are produced.
function CreateOre(oreItem, productItem, additionalRequiredItems)
  return {ore = oreItem, product = productItem};
end

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
	local oremelting = content.gathering.oremelting;
  if ( oreList == nil) then
    oreList = {
      CreateOre(CreateItem(22), CreateItem(2535)),                              -- iron
      CreateOre(CreateItem(2536), CreateItem(2550)),                            -- copper
      CreateOre(CreateItem(234), CreateItem(236)),                              -- gold
      CreateOre(CreateItem(2534), CreateItem(2571))                             -- merinium (pure fire required)
    };
    coalItem = CreateItem(21);
  end
	
	-- is the target position needed?
	local TargetPos = base.common.GetFrontPosition(User);

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
		User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
		
    if (SourceItem.id == 2834) then --swapping
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
	if (SourceItem.id == 2835) then --swapping
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end
	
	-- additional tool item is needed
	if (User:countItemAt("all",2751)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Tiegelzange um Erz zu schmelzen.", 
		"You need a pair of crucible-pincers for melting ore." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2751 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2751 ) then
			base.common.HighInformNLS( User,
			"Du musst die Tiegelzange in der Hand haben!",
			"You have to hold the crucible-pincers in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",coalItem.id)<coalItem.amount) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Kohle um an der Esse zu arbeiten.", 
		"You need coal for working at the forge." );
		return;
	end
  
  -- NOTE: we assume here that the user's items do not change while working.
  -- => the ore that we found at the beginning is the same as in the end.
  local oreItem = nil;
  for _,i in pairs(oreList) do
    if (User:countItemAt("all",i.ore.id)>=i.ore.amount) then
      if (i.ore.id == 2534) then
        -- that's merinium (should be the last in the list), we need pure fire
        if (User:countItemAt("all",2553) == 0) then
          base.common.HighInformNLS( User, 
          "Du brauchst reines Feuer um Meriniumerz zu schmelzen.", 
          "You need pure fire for melting merinium ore." );
          return;
        else
          oreItem = i;
          break;
        end
      else
        -- something else than merinium, everything is fine.
        oreItem = i;
        break;
      end
    end
  end
  if (oreItem == nil) then
		base.common.HighInformNLS( User, 
		"Du brauchst Eisenerz, Kupfererz, Goldnuggets oder Meriniumerz um es zu schmelzen.", 
		"You need iron ore, copper ore, gold nuggets or merinium ore for melting it." );
    return;
  end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
    -- oh wait, check if someone else is working at the tool
    if (SourceItem.id == 2836) or (SourceItem.id == 2837) then
      -- alright, it's off
      oremelting.SavedWorkTime[User.id] = oremelting:GenWorkTime(User,toolItem);
      User:startAction( oremelting.SavedWorkTime[User.id], 0, 0, 0, 0);
      User:talkLanguage( Character.say, Player.german, "#me beginnt an der Esse Erz zu schmelzen.");
      User:talkLanguage( Character.say, Player.english, "#me starts to melt ore at the forge."); 
	  
	     if (SourceItem.id == 2836) then --turn it on!
            SourceItem.id = 2835;
			SourceItem.wear = 2;
            world:changeItem(SourceItem);
            User:changeSource(SourceItem);
	    end
		
	    if (SourceItem.id == 2837) then --turn it on!
            SourceItem.id = 2834;
			SourceItem.wear = 2;
            world:changeItem(SourceItem);
            User:changeSource(SourceItem);
	    end
	  
    else
      -- it's on, can't work now.
      base.common.HighInformNLS( User, 
      "Jemand anderes arbeitet schon an der Esse.", 
      "Someone else is already working at the forge." );
    end
		return
	end

	-- since we're here, we're working

	if oremelting:FindRandomItem(User) then
	
    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
	if (SourceItem.id == 2834) then
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
		return
		
	end

	User:learn( oremelting.LeadSkill, oremelting.SavedWorkTime[User.id], 20);
	User:eraseItem( oreItem.ore.id, oreItem.ore.amount ); -- erase the item we're working on
  User:eraseItem( coalItem.id, coalItem.amount ); 
  if (oreItem.ore.id == 2534) then
    -- merinium, erase pure fire too.
    User:eraseItem(2553, 1);
  end
	local amount = oreItem.product.amount; -- set the amount of items that are produced
	local notCreated = User:createItem( oreItem.product.id, amount, 333, nil ); -- create the new produced items
  local nextActionStarted = false;
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( oreItem.product.id, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    if (User:countItemAt("all",coalItem.id)>=coalItem.amount) then  -- there are still items we can work on
      if (User:countItemAt("all",oreItem.ore.id)>=oreItem.ore.amount) then
        if (oreItem.ore.id == 2534 and User:countItemAt("all",2553) == 0) then
        -- merinium requires pure fire
          base.common.HighInformNLS( User, 
          "Du brauchst reines Feuer um Meriniumerz zu schmelzen.", 
          "You need pure fire for melting merinium ore." );
        else
          oremelting.SavedWorkTime[User.id] = oremelting:GenWorkTime(User,toolItem);
          User:startAction( oremelting.SavedWorkTime[User.id], 0, 0, 0, 0);
          nextActionStarted = true;
        end
      else -- no ore
        base.common.HighInformNLS(User,
        "Du brauchst Eisenerz, Kupfererz, Goldnuggets oder Meriniumerz um es zu schmelzen.", 
        "You need iron ore, copper ore, gold nuggets or merinium ore for melting it." );
      end
    else -- no coal
      base.common.HighInformNLS(User,
      "Du hast nicht mehr genug Kohle.", 
      "You don't have enough coal anymore." );
    end
	end

	if base.common.GatheringToolBreaks( User, toolItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Tiegelzange zerbricht.",
		"Your old crucible-pincers break.");
		
    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
	if (SourceItem.id == 2834) then --turn it off
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
		return
	end
  if (not nextActionStarted) then
  
    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
	if (SourceItem.id == 2834) then --turn it off
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end
	
  end
end
