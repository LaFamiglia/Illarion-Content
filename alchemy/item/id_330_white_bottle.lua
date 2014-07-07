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
--ds_330_weisse_flasche_neu.lua
--Druidensystem in Arbeit
--Tempor�re Einzelwirkungen
--Falk
-- reworked by Merung 
require("base.common")
require("alchemy.base.alchemy")
require("alchemy.item.id_165_blue_bottle")

module("alchemy.item.id_330_white_bottle",package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_330_white_bottle' WHERE com_itemid = 330;


--- NO EFFECT 
function DrinkPotion(User,SourceItem)

    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gef�hl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
    
	elseif (potionEffectId >= 600) and (potionEffectId <= 699) then -- language potion
            
		local ListLanguages={Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}
		
        local find, myEffect = User.effects:find(330)
		
		local findLID,languageId,skillName,findOS,oldSkill,findNS,newSkill,effectRemoved
		if find then --  there is already an effect, we remove it, only one language at a time
            --[[
			findLID,languageId = myEffect:findValue("languageId")
			skillName = ListLanguages[languageId]
			findOS,oldSkill = myEffect:findValue( "oldSkill")
			findNS,newSkill = myEffect:findValue( "newSkill")
			--User:increaseSkill(skillName,(-(newSkill-oldSkill))) -- old skill level restored]]
		    effectRemoved = User.effects:removeEffect(330)
			if not effectRemoved then
				base.common.InformNLS( User,"Fehler: informiere einen dev. lte nicht entfernt. white bottle script", "Error: inform dev. Lte not removed. white bottle script.")
				return
			end
		end
		--[[
		oldSkill = User:getSkill(ListLanguages[potionEffectId-599])
		if oldSkill == nil then
		   oldSkill = 0
		end
		newSkill = 100
        
		myEffect:addValue( "oldSkill",oldSkill )
		myEffect:addValue( "newSkill",newSkill )
	    myEffect:addValue( "languageId",potionEffectId-599)
        myEffect:addValue("counterWhite",10)
	  
	    User:increaseSkill(ListLanguages[potionEffectId-599],newSkill)]]
 		local duration = math.floor(SourceItem.quality/100)*600*10 
		local myEffect = LongTimeEffect(330,duration)
		User.effects:addEffect(myEffect);
    end
  end
    
function UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.base.alchemy.repairPotion(SourceItem)
	-- repair end
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebr�u nicht nutzen, w�hrend du k�mpfst.", "You cannot use the potion while fighting.")
		else
			User:talk(Character.say, "#me trinkt eine wei�e Fl�ssigkeit.", "#me drinks a white liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end

function LookAtItem(User,Item)
	return base.lookat.GenerateLookAt(User, Item, 0)
end
