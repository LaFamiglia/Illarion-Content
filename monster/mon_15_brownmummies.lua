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
local init = nil



function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.");
msgs:addMessage("#me ist mit Wunden �bers�ht", "#me is littered with wounds.");
msgs:addMessage("#me macht �chzende Ger�usche.", "#me makes groaning noises.");
msgs:addMessage("#me spuckt etwas Blut auf den Boden.", "#me spits out some blood.");
msgs:addMessage("#me starrt ins Leere.", "#me stares into oblivion.");
msgs:addMessage("#me st�hnt unter Schmerzen.", "#me moans with pain.");
msgs:addMessage("#me torkelt.", "#me staggers.");
msgs:addMessage("#me wackelt etwas unsicher.", "#me is a bit unsteady on its feet.");
msgs:addMessage("Hiiirne!", "Braaains!");
msgs:addMessage("Komm... zu... uns...", "Join... us...");
msgs:addMessage("#me f�hrt sich mit einer klauenhaften Hand murmelnd �ber den pilzbefallenen Kopf, ehe er ein schl�rfendes Ger�usch von sich gibt.", "#me runs with claw-like hands over its fungus-stricken head as it makes a shuffling noise.");
msgs:addMessage("#me weist einige schwere Wunden auf, weshalb er nur schwerf�llig vorw�rts kommt. Als er allerdings die zerfallende Nase reckt, scheint mehr 'Leben' in ihn zur�ckzukehren.", "#me has severe wounds, it moves very slowly. But as it stretches its disintegrating nose, more 'life' seems to come back into it.");
msgs:addMessage("#me tropft dicklicher Speichel aus dem Mundwinkel und seine milchigen Augen starren tr�bsinnig drein, w�hrend ihm unverst�ndliche Worte entfl�uchen.", "#me drops syrupy saliva from its mouth and its eyes stare gloomily as it speaks unintelligible words.");
msgs:addMessage("#me st�hnt schwer und beugt sich vorn�ber, eine schwarze Fl�ssigkeit zu Boden spuckend. Danach richtet er sich wieder auf und haftet den Blick gebannt auf das Opfer.", "#me groans heavily and leans forward, spitting a black liquid on the floor. Then it straightens up and affixes its eyes on the victim.");

end

function M.enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    return false
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

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
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

if (MonID==151) then --Rotten Mummy, Level: 2, Armourtype: light, Weapontype: wrestling

        --Category 1: Cloth

        local done=drop.AddDropItem(176,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --grey cloth
        if not done then done=drop.AddDropItem(179,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --blue cloth
        if not done then done=drop.AddDropItem(177,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --yellow cloth
        if not done then done=drop.AddDropItem(178,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --white cloth
        if not done then done=drop.AddDropItem(176,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --grey cloth

        --Category 2: Special loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --entrails
        if not done then done=drop.AddDropItem(2745,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --parchment
        if not done then done=drop.AddDropItem(2183,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --clay mug
        if not done then done=drop.AddDropItem(235,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --golden cup
        if not done then done=drop.AddDropItem(397,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --oillamp

        --Category 3: Weapon

        local done=drop.AddDropItem(27,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --simple dagger
        if not done then done=drop.AddDropItem(2711,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --barbarian axe
        if not done then done=drop.AddDropItem(2737,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --morning star
        if not done then done=drop.AddDropItem(2786,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --branch
        if not done then done=drop.AddDropItem(190,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --ornate dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(10,30),100,333,0,4); --copper coins


    elseif (MonID==152) then --Smelly Mummy, Level: 3, Armourtype: heavy, Weapontype: puncture

        --Category 1: Armor

        local done=drop.AddDropItem(55,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --green cloth
        if not done then done=drop.AddDropItem(175,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --black cloth
        if not done then done=drop.AddDropItem(174,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --red cloth
        if not done then done=drop.AddDropItem(179,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --yblue cloth
        if not done then done=drop.AddDropItem(176,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --grey cloth

        --Category 2: Special loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --entrails
        if not done then done=drop.AddDropItem(236,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --gold ingot
        if not done then done=drop.AddDropItem(224,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --golden goblet
        if not done then done=drop.AddDropItem(399,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --candle
        if not done then done=drop.AddDropItem(225,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --crown

        --Category 3: Weapon

        local done=drop.AddDropItem(445,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --wooden sword
        if not done then done=drop.AddDropItem(2664,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --club
        if not done then done=drop.AddDropItem(56,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --bough
        if not done then done=drop.AddDropItem(2672,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned dagger
        if not done then done=drop.AddDropItem(40,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --cleric's staff

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,333,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

