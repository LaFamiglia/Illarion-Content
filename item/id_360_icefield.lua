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
-- UPDATE items SET itm_script='item.id_360_icefield' where itm_id=360;

require("base.common")

module("item.id_360_icefield", package.seeall)

function IniFireField()
    --Human, Dwarf, Halfling, Elf, Orc, Lizard, Drow, Troll, Mummy, Skeleton, Beholder, Blackbeholder, Transparentbeholder, Brownmummy, Bluemummy, Sheep, Spider, Redskeleton, Redspider, Greenspider, Bluespider, Pig, Brownpig, Transparentspider, Wesp, Redwesp, Stonegolem, Brownstonegolem, Redstonegolem, Silverstonegolem, Transparentstonegolem, Cow, Browncow, Wolf, Transparentwolf, Blackwolf, Greywolf, Redwolf, Redraptor, Silverbear, Blackbear, Bear, Raptor, Zombie, Hellhound, Imp, Irongolem, Ratman, Dog, Beetle, Fox, Slime, Chicken, Bonedragon, Blackbonedragon, Redbonedragon, Transparentbonedragon, Greenbonedragon, Bluebonedragon, Goldbonedragon, Redmummy, Greymummy, Blackmummy, Goldmummy, Transparentskeleton, Blueskeleton, Greenskeleton, Goldirongolem, Goldskeleton, Bluetroll, Blacktroll, Redtroll, Blackzombie, Transparentzombie, Redzombie, Blackhellhound, Transparenthellhound, Greenhellhound, Redhellhound, Redimp, Blackimp, Blueirongolem, Redratman, Greenratman, Blueratman, Reddog, Greydog, Blackdog, Greenbeetle, Copperbeetle, Redbeetle, Goldbeetle, Greyfox, Redslime, Blackslime, Transparentslime, Brownchicken, Redchicken, Blackchicken
    AffectedRaces={  0,  1,  2,  3,  4,  5,  6,  9, 10, 11, 12, 13, 14, 15, 17, 19, 20, 21, 22, 23, 26, 27, 29, 30, 31, 32, 33, 34, 39, 40, 41, 42, 43, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108};
    AffectedStren={100,120,100,100,100, 90,100,100,100,100, 90,110,100,100,100,100,100,150, 20,120, 30,100,130,100,100,100,100,110,100, 50, 20,100,100, 90,100,100, 80,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
end

function CharacterOnField(User)
    if (AffectedRaces==nil) then
        IniFireField();
    end
	
	--immune
	if User:getType()==Character.monster then
		if User:getMonsterType() == 681 then
			return
		end
	end
	
	-- Eisflamme auf dem Feld suchen
	-- !!Eventuell gibt es Probleme, wenn sich mehrere Flammen auf einem Feld befinden!!
	local Items = base.common.GetItemsOnField(User.pos);
	local FieldItem;
	for i, item in pairs(Items) do
		if(item.id == 360) then
			FieldItem = item;
			break
		end
	end
    if (FieldItem.quality>100) then
        UserRace=User:getRace();                  -- Char Rasse
        for i,theRace in pairs(AffectedRaces) do   -- Rassenliste durchlaufen
            if UserRace==theRace then              -- User Rasse finden
                resist=SpellResistence(User);      -- Magieresistenz pr�fen
                if resist<FieldItem.quality then   -- Qualit�t des Items --> St�rke mit Magie Resistenz vergleichen
					if AffectedStren[i]==nil then AffectedStren[i]=100 end;
                    damageDealt=math.random((7/100)*math.floor((FieldItem.quality-resist)*AffectedStren[i]),(9/100)*math.floor((FieldItem.quality-resist)*AffectedStren[i]));--AffectedStren[i]
                    User:increaseAttrib("hitpoints",-damageDealt); -- Schaden berechnen und bewirken
                end
            end
        end
    else
        DeleteFlame(User, FieldItem);
        if (User:getPlayerLanguage()==0) then
            User:inform("Die Eisflamme war nur eine Illusion und verpufft");
        else
            User:inform("The iceflame was just an illusion and disappears");
        end
    end
end

function DeleteFlame(User, FlameItem)
	local field = world:getField(User.pos);
	local count = field:countItems();
	local currentitem;
	local items = { };
	for i=0, count-1 do
		currentitem = world:getItemOnField(User.pos);
		world:erase(currentitem, currentitem.number);
		if(currentitem.id ~= FlameItem.id) then
			table.insert(items, currentitem);
		end
	end
	for i,item in pairs(items) do
		world:createItemFromItem(item, User.pos, true);
	end
end

function SpellResistence(TChar)                 -- should be 0 (no res) to 100 (super res)
    MRes=TChar:getSkill(Character.magicResistance);    -- should depend on Int, Wp and magic resistency
    RInt=TChar:increaseAttrib("intelligence",0);
    RWillpower=TChar:increaseAttrib("willpower",0);

    BaseSuccess=math.ceil((MRes+RWillpower+RInt)*100/140);
    --TChar:talk(Character.say,"Eval SpRes. for "..TChar.name..": Mag Res= "..MRes..", Int= "..RInt..", WP="..RWillpower.." and calcbase= "..BaseSuccess);
    return math.max(math.ceil((BaseSuccess*base.common.NormalRnd(0,100))/50),0);
end

function ItemRotsOnField(oldItem,newItem)
    if (firstrot==nil) then
        rotted={};
    end
    Posi=newItem.pos
    if (rotted[Posi]==nil) then rotted[Posi]=1 end
    if (rotted[Posi]==2) then
        world:eraseItem(newItem,newItem.number);
        rotted[Posi]=0;
        world:gfx(38,Posi);
    end
    rotted[Posi]=rotted[Posi]+1;
end

