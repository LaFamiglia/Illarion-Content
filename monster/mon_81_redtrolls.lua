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
msgs:addMessage("#me stampft w�tend auf den Boden auf und grollt mit kehliger Stimme.", "#me stomps on the ground in fury, growling deeply");
msgs:addMessage("#me schwingt seine Faust und st��t ein jammerndes Klagen aus.", "#me swings its fist, roaring loudly.");
msgs:addMessage("#me br�llt mit markdurchdringender Stimme.", "#me bellows with a booming voice.");
msgs:addMessage("#mes gr�ne Augen blitzen vor gnadenloser Bestimmtheit auf, ein Leben zu beenden.", "#me's green eyes flash in unfaltering dedication to end somebody's life.");
msgs:addMessage("Groar!", "Groar!");
msgs:addMessage("#me trampelt mit unaufhaltsamen Schritten umher. Jeder Schritt l�sst die Erde zittern.", "#me charges with unstoppable paces. Every step shakes the ground.");
msgs:addMessage("#me h�lt einen Moment inne und wiegt seinen Kopf hin und her, traurig vor sich hin summend.", "#me hesitates for a moment, cocking its head, humming sadly.");
msgs:addMessage("#mes Muskeln an seinen knorrigen Armen spannen sich, bereit, um Rache zu �ben.", "#me flexes its muscles on its huge arms, ready to take revenge.");
msgs:addMessage("#me ist ein gigantischer Troll, dessen weise Augen von dem Anblick uns�glicher Taten m�de und traurig geworden sind.", "#me is a giant troll with wise eyes which became sad and tired from witnessing unutterable deeds.");

end

function M.enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==812) then
        return ( drop.CastMonMagic(Monster,Enemy,6,{1000,2000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{30,60}) );
    else
        return false;
    end
end

function M.enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    local MonID=Monster:getMonsterType();

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==812) then
        return ( monstermagic.CastHealing(Monster, {1000,2000}) or drop.CastMonMagic(Monster,Enemy,4,{1000,2500},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{45,70}) );
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
    if (MonID==811) then --Firespitter, Level: 6, Armourtype: medium, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=drop.AddDropItem(526,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --studded leather gloves
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=drop.AddDropItem(283,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire

        --Category 3: Weapon

        local done=drop.AddDropItem(549,20,20,(100*math.random(4,5)+math.random(44,55)),0,3); --poisoned arrows
        if not done then done=drop.AddDropItem(237,20,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --bolt
        if not done then done=drop.AddDropItem(2727,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --fire hunter's bow
        if not done then done=drop.AddDropItem(2645,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing axe
        if not done then done=drop.AddDropItem(293,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing spear

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==812) then --Keeperoffire, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=drop.AddDropItem(526,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --studded leather gloves
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=drop.AddDropItem(735,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --raw stone
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --raw emerald
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --ruby
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire

        --Category 3: Weapon

        local done=drop.AddDropItem(64,20,20,(100*math.random(6,7)+math.random(66,77)),0,3); --arrow
        if not done then done=drop.AddDropItem(237,10,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bolt
        if not done then done=drop.AddDropItem(2780,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ebeony wood bow
        if not done then done=drop.AddDropItem(2727,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --fire hunter's bow
        if not done then done=drop.AddDropItem(293,10,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --throwing spear

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end

return M

