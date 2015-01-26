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
require("base.messages");
require("monster.base.base")
require("monster.base.drop")
require("monster.base.kills")
require("monster.base.lookat")
require("monster.base.monstermagic")
require("monster.base.quests")

module("monster.mon_113_rabbit", package.seeall)


function ini(Monster)

    init=true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = base.messages.Messages();
    msgs:addMessage("", "#me hops about, ears twitching.");
    msgs:addMessage("", "#me nibbles on a carrot.");
    msgs:addMessage("", "#me wiggles its nose, sniffing the air");
    msgs:addMessage("", "#me steals some fruit.");
    msgs:addMessage("", "#me washes its face with its front paws.");
    msgs:addMessage("", "#me sniffs and smells at everything.");
    msgs:addMessage("", "#me hops to and fro, without a care in all of Illarion.");
    msgs:addMessage("", "#me runs over to a flower and eats it, stem and all.");
    msgs:addMessage("", "#me hops around in circles.");
    msgs:addMessage("", "#me jumps high in the air, flipping around the other direction and hopping away quickly.");
	msgs:addMessage("", "#me picks a tick out of its fur with its long front teeth.");
	msgs:addMessage("", "#me scratches at its side with a back leg.");
	msgs:addMessage("", "#me runs over and takes a strawberry from another rabbit.");
	msgs:addMessage("", "#me flashes a white tail as it hops down a hole.");
	msgs:addMessage("", "#me stands up on its hind feet, looking around.");
	msgs:addMessage("", "#me chases after the younger bunny rabbits.");
	msgs:addMessage("", "#me looks for things to bring inside the rabbit warren.");
end

function onSpawn

	if (MonID == 1131) then Monster:getSkinColor = {75,75,75} -- Rabbit Red,Green,Blue
	end
	if (MonID == 1132) then Monster:getSkinColor = {128,128,128} -- Doe Red,Green,Blue
	end
	if (MonID == 1133) then Monster:getSkinColor = {80,55,20} -- ForestRabbit Red,Green,Blue
	end
	if (MonID == 1134) then Monster:getSkinColor = {105,70,20} -- ForestDoe Red,Green,Blue
	end
	if (MonID == 1135) then Monster:getSkinColor = {210,150,50} -- DesertRabbit Red,Green,Blue
	end
	if (MonID == 1136) then Monster:getSkinColor = {240,210,170} -- DesertDoe Red,Green,Blue
	end
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

    monster.base.drop.ClearDropping();
    local MonID = Monster:getMonsterType();

    if (MonID == 1131) then --Rabbit, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat

    elseif (MonID == 1132) then --Doe, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat
		
    elseif (MonID == 1133) then --Forest Rabbit, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat

    elseif (MonID == 1134) then --Forest Doe, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat
		
	elseif (MonID == 1135) then --Desert Rabbit, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat
		
    elseif (MonID == 1136) then --Desert Doe, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(553,1,50,333,0,1); --rabbit meat
	end
		monster.base.drop.Dropping(Monster);
end
