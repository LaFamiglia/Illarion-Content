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
-- I_90 Floete spielen

-- UPDATE common SET com_script='item.id_90_flute' WHERE com_itemid=90;

require("item.base.music")
require("item.general.wood")

module("item.id_90_flute", package.seeall)

skill = Character.flute

item.base.music.addTalkText("#me produces some squeaking sounds on the flute.","#me macht einige quietschende Ger�usche auf der Fl�te.", skill);
item.base.music.addTalkText("#me plays a horribly out of tune melody.","#me spielt eine f�rchterlich verstimmte Melodie auf der Fl�te.", skill);
item.base.music.addTalkText("#me plays an out of tune melody.","#me spielt eine verstimmte Melodie auf der Fl�te.", skill);
item.base.music.addTalkText("#me plays an airy tune on the flute.","#me spielt eine leichte Melodie auf der Fl�te.", skill);
item.base.music.addTalkText("#me plays a wild tune on the flute.","#me spielt eine wilde Melodie auf der Fl�te.", skill);


function UseItem(User, SourceItem)
	--Testing fireball, only activates if flute's data key name is used. Does not affect normal flute -Dyluck
	
	local targetPos
	local targetChar
	local extraPos
	local graphicNum
	local xoff
	local yoff
	local mylist
	local last
	local isChar
	local totalDmg
	local testDmg
	
	graphicNum = tonumber(SourceItem:getData("spell"));
	if ( graphicNum ~= nil ) then
		if (User:increaseAttrib("intelligence", 0) < 10) then 
			User:talk(Character.say, "INT would be too low. You have "..User:increaseAttrib("intelligence", 0));
		end
		if (User:increaseAttrib("mana", 0) < 50)  then
			User:talk(Character.say, "Mana would be too low. You have "..User:increaseAttrib("mana", 0));
		end
		User:talk(Character.say, "#me casts Fireball ");
		--User facing direction to determine offset numbers for target area
		if ( User:getFaceTo() == 0) then --north
			xoff = 0;
			yoff = -1;
		elseif ( User:getFaceTo() == 1) then --northeast
			xoff = 1;
			yoff = -1;
		elseif ( User:getFaceTo() == 2) then --east
			xoff = 1;
			yoff = 0;
		elseif ( User:getFaceTo() == 3) then --southeast
			xoff = 1;
			yoff = 1;
		elseif ( User:getFaceTo() == 4) then --south
			xoff = 0;
			yoff = 1;
		elseif ( User:getFaceTo() == 5) then --southwest
			xoff = -1;
			yoff = 1;
		elseif ( User:getFaceTo() == 6) then --west
			xoff = -1;
			yoff = 0;
		elseif ( User:getFaceTo() == 7) then --northwest
			xoff = -1;
			yoff = -1;
		end
		
		--Set max range and check for line of sight
		targetPos = position(User.pos.x + 5 * xoff, User.pos.y + 5 * yoff, User.pos.z);
		mylist = world:LoS(User.pos, targetPos);
		last = table.getn(mylist);
		if (mylist[1] == nil) then --hit max range
			world:gfx(graphicNum, targetPos);
			world:makeSound(5, targetPos);
			if world:isCharacterOnField(targetPos) then --hit char at max range
				isChar = true;
				targetChar = world:getCharacterOnField(targetPos);
			end			
		else --hit obstacle
			--[[
			for key, listEntry in pairs(mylist) do
				User:inform("Item with the ID: "..listEntry.OBJECT.id);
			end
			User:inform("Array size is: "..last);
			]]--
			targetPos = mylist[last].OBJECT.pos;
			world:gfx(graphicNum, mylist[last].OBJECT.pos);
			world:makeSound(5, mylist[last].OBJECT.pos);
			if (mylist[last].TYPE == "CHARACTER") then --obstacle is a char
				isChar = true;
				targetChar = mylist[last].OBJECT;
			end
		end
		--Calculate numbers and damage char
		if ( (isChar == true) and (targetChar:increaseAttrib("hitpoints", 0) > 0) ) then
			world:makeSound(1, targetPos);
			totalDmg = -( (21 + User:increaseAttrib("intelligence", 0) - targetChar:increaseAttrib("essence", 0) ) * 50)
			testDmg = -2000;
			targetChar:increaseAttrib("hitpoints", testDmg);
			if (User:increaseAttrib("mana", 0) >= 50)  then
				User:increaseAttrib("mana", - 50);
			end
			User:talk(Character.say, "Damage is -2000, but would've been "..totalDmg);
			User:talk(Character.say, "Because your INT was "..User:increaseAttrib("intelligence", 0));				
		end
		--User:talk(Character.say, "Mana is now "..User:increaseAttrib("mana", 0));
		
			
		--[[
		for i = 0, 2, 1 do
			for j = 0, 2, 1 do
				extraPos = position(targetPos.x -1 +i, targetPos.y -1 +j, targetPos.z);
				if (graphicNum ~= nil) then
					world:gfx(graphicNum, extraPos);
				else
					User:talk(Character.say, "No graphic for this number");
				end
				if world:isCharacterOnField(extraPos) then --if there's a target char on target position
					targetChar = world:getCharacterOnField(extraPos); --find the char
					targetChar:increaseAttrib("hitpoints", -2000);
					world:makeSound(1, extraPos);
				end
			end
		end]]--
	end
	--End Test -Dyluck
end

LookAtItem = item.general.wood.LookAtItem
