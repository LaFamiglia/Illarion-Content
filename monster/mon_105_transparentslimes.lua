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
local slimeFeeding = require("triggerfield.slimeFeeding")
local M = {}
local init = nil



function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
msgs:addMessage("#me blubbert.", "#me bubbles.");
msgs:addMessage("#me brodelt.", "#me seethes.");
msgs:addMessage("#me gurgelt.", "#me gargles.");
msgs:addMessage("#mes amorpher K�rper verleibt sich M�ll vom Erdboden ein.", "#me's amorph body absorbs some litter of the ground.");
msgs:addMessage("#me richtet sich auf.", "#me rears up.");
msgs:addMessage("#me hinterl�sst eine schleimige Spur.", "#me leaves a mucilaginous trail behind.");
msgs:addMessage("#me riecht nach Abfall.", "#me reeks of dump.");
msgs:addMessage("#me spuckt Schleimbatzen.", "#me spits out lumps of slime.");
msgs:addMessage("#mes Gestalt wandelt sich in einen Ball.", "#me's shape morphs into a ball.");
msgs:addMessage("#me dr�ckt sich flach auf den Boden.", "#me flattens itself plain to the ground.");
end

function M.onSpawn(theSlime)
	if theSlime:getMonsterType()==1055 then
		theSlime:setSkinColor(51,51,51)
	end

end

local DELETED = false
function M.abortRoute(theSlime)
	-- Slime feeding quest in Runewick
	if theSlime:getMonsterType()==1055 then
		if theSlime.pos == slimeFeeding.WARP_TO_SLIME_POSITION then
			if world:isItemOnField(slimeFeeding.WARP_TO_SLIME_POSITION) and DELETED == false then
				theSlime:talk(Character.say, "#mes schleimige Masse gleitet �ber das Futter und absorbiert es. Sein K�rper wabbelt kurz ein Objekt tritt aus diesem raus, welches �ber die Ansperrung kataplutiert.",
				"#me's slimy mass flows over the feed and absorbs it. Its body wobbles for a short period of time and an oject emerges from it, which is catapulted over the boundary.")
				local feeding = world:getItemOnField(slimeFeeding.WARP_TO_SLIME_POSITION)
				world:erase(feeding,feeding.number)
				myItemList = slimeFeeding.REWARD_LIST[Random.uniform(1,#slimeFeeding.REWARD_LIST)]
				world:createItemFromId(myItemList.itemId, myItemList.amount, slimeFeeding.REWARD_POSITION, true, myItemList.quality, myItemList.data)
				DELETED = true
				theSlime.movepoints = theSlime.movepoints -50
			end
			theSlime.waypoints:addWaypoint(slimeFeeding.SLIME_CAVE_POSITION)
			theSlime:setOnRoute(true)

		elseif theSlime.pos == slimeFeeding.SLIME_CAVE_POSITION then
			theSlime:talk(Character.say, "#me flie�t in die H�hlennische zur�ck.",
			"#me flows back into the small hole.")
			theSlime:increaseAttrib("hitpoints", -10000)
			slimeFeeding.FEEDING_IN_PROGRESS = false
			DELETED = false
		end
	end
	-- Slime feeding quest in Runewick END
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

if (MonID==1051) then --Ectoplasm, Level: 1, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(1,1)+math.random(11,11)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw emerald

        --Category 2: Raw gems + cutted gems

        local done=drop.AddDropItem(255,1,20,(100*math.random(1,1)+math.random(11,11)),0,2); --raw ruby
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(1,1)+math.random(11,11)),0,2); end --raw sapphire
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --diamond

        --Category 3: Special Loot

        local done=drop.AddDropItem(26,1,20,(100*math.random(1,1)+math.random(11,11)),0,3); --clay
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(1,1)+math.random(11,11)),0,3); end --raw obsidian
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --topaz
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --obsidian
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --emerald

        --Category 4: Perma Loot
		--

		elseif (MonID==1052) then --Malicious Ectoplasm, Level: 2, Armourtype: cloth, Weapontype: wrestling

		--Category 1: Raw gems

        local done=drop.AddDropItem(255,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --raw ruby
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw topaz
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw diamond
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw obsidian

        --Category 2: Raw gems + cutted gems

        local done=drop.AddDropItem(251,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw amethyst
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --ruby
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --emerald
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --topaz

        --Category 3: Special Loot

        local done=drop.AddDropItem(726,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --coarse sand
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --raw emerald
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(10,30),100,773,0,4); --copper coins

    elseif (MonID==1053) then --Doomed Ectoplasm, Level: 3, Armourtype: light, Weapontype: puncture

        --Category 1: Raw gems

        local done=drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw ruby
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw raw amethyst
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald

        --Category 2: Raw gems + cutted gems

        local done=drop.AddDropItem(256,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw emerald
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz

        --Category 3: Special Loot

        local done=drop.AddDropItem(26,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --clay
        if not done then done=drop.AddDropItem(73,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --trout
        if not done then done=drop.AddDropItem(2445,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --small wooden shield
        if not done then done=drop.AddDropItem(56,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --bough
        if not done then done=drop.AddDropItem(2786,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --branch

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

