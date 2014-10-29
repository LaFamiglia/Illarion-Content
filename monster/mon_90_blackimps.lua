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
local monstermagic = require("monster.base.monstermagic")
local base = require("monster.base.base")
local drop = require("monster.base.drop")
local lookat = require("monster.base.lookat")
local quests = require("monster.base.quests")
local messages = require("base.messages")
local kills = require("monster.base.kills")
local arena = require("base.arena")
local M = {}


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me knurrt.", "#me growls.");
end

function M.enemyNear(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

	if (MonID==553) then
		return ( monstermagic.CastMonster(Monster, {622, 611, 881}) );
    else
        return false;
    end
end

function M.enemyOnSight(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

	monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
	elseif (MonID==553) then
		return ( monstermagic.CastMonster(Monster, {622, 611, 881}) );
    else
        return false;
    end
end

function M.onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function M.onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function M.onDeath(Monster)

    if arena.isArenaMonster(Monster) then
        return
    end


    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    drop.ClearDropping();
    local MonID=Monster:getMonsterType();

if (MonID==901) then --Shadow Wimp, Level: 4, Armourtype: heavy, Weapontype: distance

        --Category 1: Special Loot

        local done=drop.AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw ruby
        if not done then done=drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=drop.AddDropItem(194,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --black robe
        if not done then done=drop.AddDropItem(817,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green tunic
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz

        --Category 2: Gems

        local done=drop.AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --ruby
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(735,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw stone
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Weapons

        local done=drop.AddDropItem(189,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --dagger
        if not done then done=drop.AddDropItem(277,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --amethyst ring
        if not done then done=drop.AddDropItem(2668,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned simple dagger
        if not done then done=drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=drop.AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==902) then --Shadow Imp, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Raw gems

        local done=drop.AddDropItem(251,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw amethyst
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz

        --Category 2: Gems

        local done=drop.AddDropItem(197,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --amethyst
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz

        --Category 3: Weapons

        local done=drop.AddDropItem(277,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --amethyst ring
        if not done then done=drop.AddDropItem(281,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=drop.AddDropItem(389,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --silvered dagger
        if not done then done=drop.AddDropItem(2668,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned simple dagger
        if not done then done=drop.AddDropItem(2671,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --magic dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins


    elseif (MonID==903) then --Shadow Dancer, Level: 6, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(17,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --wooeden shield
        if not done then done=drop.AddDropItem(367,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --short leather legs
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(53,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --leather
        if not done then done=drop.AddDropItem(817,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --green tunic

        --Category 2: Gems

        local done=drop.AddDropItem(197,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amethyst
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(735,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --raw stone
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz

        --Category 3: Weapons

        local done=drop.AddDropItem(2740,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --red dagger
        if not done then done=drop.AddDropItem(2668,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned simple dagger
        if not done then done=drop.AddDropItem(444,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --merinium plated dagger
        if not done then done=drop.AddDropItem(2672,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --magic dagger
        if not done then done=drop.AddDropItem(2742,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --fire dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,773,0,4); --silver coins

    end
    drop.Dropping(Monster);
end

return M

