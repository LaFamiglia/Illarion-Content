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
require("alchemy.teaching.transformation_dog")

module("monster.mon_58_dogs", package.seeall)

function ini(Monster)

    init = true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = base.messages.Messages();

    msgs:addMessage("#me bellt.", "#me barks.");
    msgs:addMessage("#me fletscht die Z�hne.", "#me bares its teeth.");
    msgs:addMessage("#me knurrt.", "#me growls.");
end

function onSpawn(Monster)

    local var = 60;
    local red, green, blue = Monster:getSkinColor();
    red = base.common.Limit((red + math.random(-var, var)), 0, 255);
    green = base.common.Limit((green + math.random(-var, var)), 0, 255);
    blue = base.common.Limit((blue + math.random(-var, var)), 0, 255);
    Monster:setSkinColor(red, green, blue);
end

function enemyNear(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
         monster.base.drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while
    end

    return false
end

function enemyOnSight(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while

    if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
        return true
    end

    if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
    end
end

function onAttacked(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end
    if killer and killer[Monster.id] ~= nil then

        murderer = getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer, Monster);
            killer[Monster.id] = nil;
            murderer = nil;

        end
    end
	
	if monster.base.base.checkNoDrop(Monster) then
		return
	end

    monster.base.drop.ClearDropping();
    local MonID = Monster:getMonsterType();

    if (MonID==581 or MonID==582 or MonID==583 or MonID==584 or MonID==951 or MonID==961 or MonID==962 or MonID==971 or MonID==972) then --dog

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur

    end
    monster.base.drop.Dropping(Monster);
end
