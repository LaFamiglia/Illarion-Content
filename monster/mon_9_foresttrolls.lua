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
local kills = require("monster.base.kills")
local arena = require("base.arena")
local messages = require("base.messages")
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
msgs:addMessage("#mes Blick zeigt unb�ndigen Zorn, verursacht durch unz�hlige Freveltaten gegen die Natur.", "#me's glance shows the inevitable revenge, caused by countless crimes against nature.");
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
    if (MonID==93) then
        return ( drop.CastMonMagic(Monster,Enemy,6,{1000,1500},{{9,5},{36,5},{2,4}},{{359,320,500,0,7}},40,1,{30,60}) );
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

    local MonID=Monster:getMonsterType();
	if base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    if base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==93) then
        return ( monstermagic.CastHealing(Monster, {1000,2000}) or drop.CastMonMagic(Monster,Enemy,4,{1000,2000},{{9,5},{36,5},{2,4}},{{359,320,500,0,7}},40,1,{45,70}) );
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
    if (MonID==91) then --Forest Troll, Level: 4, Armourtype: light, Weapontype: concussion ()

        --Category 1: Armor

        local done=drop.AddDropItem(17,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wooden shield
        if not done then done=drop.AddDropItem(367,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short leather legs
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --light hunting armor
        if not done then done=drop.AddDropItem(53,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather boots

        --Category 2: Special loot

        local done=drop.AddDropItem(133,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --sun herb
        if not done then done=drop.AddDropItem(134,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --fourleafed oneberry
        if not done then done=drop.AddDropItem(135,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --yellow weed
        if not done then done=drop.AddDropItem(136,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --anger berry
        if not done then done=drop.AddDropItem(137,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --flamegoblet blossom

        --Category 3: Weapon

        local done=drop.AddDropItem(2664,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --club
        if not done then done=drop.AddDropItem(56,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --bough
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=drop.AddDropItem(2786,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --branch
        if not done then done=drop.AddDropItem(231,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins


    elseif (MonID==92) then --Forest Troll Warrior, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(367,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short leather legs
        if not done then done=drop.AddDropItem(20,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --large metal shield
        if not done then done=drop.AddDropItem(364,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light hunting armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(697,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --fur boots

        --Category 2: Special loot

        local done=drop.AddDropItem(138,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --night angels blossom
        if not done then done=drop.AddDropItem(140,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --donf blade
        if not done then done=drop.AddDropItem(141,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --black thistle
        if not done then done=drop.AddDropItem(142,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sand berry
        if not done then done=drop.AddDropItem(143,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --red elder

        --Category 3: Weapon

        local done=drop.AddDropItem(230,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --mace
        if not done then done=drop.AddDropItem(2786,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --branch
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=drop.AddDropItem(56,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bough
        if not done then done=drop.AddDropItem(2737,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==93) then --Forest Troll Shaman, Level: 5, Armourtype: cloth, Weapontype: concussion (wrestling)

        --Category 1: Armor

        local done=drop.AddDropItem(183,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green trousers
        if not done then done=drop.AddDropItem(814,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue tunic
        if not done then done=drop.AddDropItem(55,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --green robe
        if not done then done=drop.AddDropItem(817,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --green tunic
        if not done then done=drop.AddDropItem(194,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black robe

        --Category 2: Special loot

        local done=drop.AddDropItem(144,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --virgins weed
        if not done then done=drop.AddDropItem(145,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --heath flower
        if not done then done=drop.AddDropItem(146,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --desert sky capsule
        if not done then done=drop.AddDropItem(147,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --black berry
        if not done then done=drop.AddDropItem(148,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --firnis blossom

        --Category 3: Weapon

        local done=drop.AddDropItem(40,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --cleric's staff
        if not done then done=drop.AddDropItem(209,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven mage's staff
        if not done then done=drop.AddDropItem(56,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bough
        if not done then done=drop.AddDropItem(2786,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --branch
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==94) then --Forest Troll Hunter, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=drop.AddDropItem(364,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light hunting armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=drop.AddDropItem(151,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --strawberry
        if not done then done=drop.AddDropItem(152,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --life root
        if not done then done=drop.AddDropItem(153,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --foot leaf
        if not done then done=drop.AddDropItem(154,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --hop
        if not done then done=drop.AddDropItem(155,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sibanac

        --Category 3: Weapon

        local done=drop.AddDropItem(1266,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --stones
        if not done then done=drop.AddDropItem(89,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --sling
        if not done then done=drop.AddDropItem(2718,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven composite longbow
        if not done then done=drop.AddDropItem(65,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --short bow
        if not done then done=drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --long bow

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==95) then --Forest Troll Forester, Level: 6, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --leather legs
        if not done then done=drop.AddDropItem(526,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --studded leather gloves
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leatherarmor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate
        if not done then done=drop.AddDropItem(2359,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=drop.AddDropItem(156,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --steppe fern
        if not done then done=drop.AddDropItem(157,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --rotten tree bark
        if not done then done=drop.AddDropItem(158,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --bulbsponge mushroom
        if not done then done=drop.AddDropItem(159,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --toadstool
        if not done then done=drop.AddDropItem(160,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red head

        --Category 3: Weapon

        local done=drop.AddDropItem(64,10,20,(100*math.random(5,6)+math.random(55,66)),0,3); --arrows
        if not done then done=drop.AddDropItem(65,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --short bow
        if not done then done=drop.AddDropItem(2780,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ebony wood bow
        if not done then done=drop.AddDropItem(2645,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --throwing axe
        if not done then done=drop.AddDropItem(293,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --throwing spear

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins

    elseif (MonID==96) then
        -- Drops
    elseif (MonID==97) then
        --Drops
    elseif (MonID==98) then
        --Drops
    elseif (MonID==99) then
        --Drops
    else
        --Drops
    end
    drop.Dropping(Monster);
end

return M

