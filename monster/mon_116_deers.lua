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

require("base.arena")
require("base.common");
require("base.messages");
require("monster.base.base")
require("monster.base.drop")
require("monster.base.kills")
require("monster.base.lookat")
require("monster.base.monstermagic")
require("monster.base.quests")

module("monster.mon_116_deers", package.seeall)

function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

	if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end
	if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();


    if (MonID==1161 or MonID==1162 or MonID==1163 or MonID==1164 or MonID==1165) then --deer

        monster.base.drop.AddDropItem(2586,1,100,333,0,1); --fur
		monster.base.drop.AddDropItem(63,1,50,333,0,2); --entrails
        monster.base.drop.AddDropItem(552,1,50,333,0,3); --deer meat

	end
    monster.base.drop.Dropping(Monster);
end
