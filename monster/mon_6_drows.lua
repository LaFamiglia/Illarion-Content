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


function M.onSpawn(theDrow)
	local mySex = math.random(0,1);
	
	local var=40; -- variation of color, +/- var
    local baseC=100;  -- baseColor (C,C,C)
    local red=math.min(255,baseC-var+math.random(2*var));
    local green=math.min(255,baseC-var+math.random(2*var));
    local blue=math.min(255,baseC-var+math.random(2*var));
    local myHair = {};
    myHair[0] = {1,2};    -- list of possible hair IDs
    myHair[1] = {1,4,7,8};
    theDrow:setAttrib("sex",mySex);
    theDrow:setSkinColor(red,green,blue);
    theDrow:setHair( myHair[mySex][math.random(#myHair[mySex])] );
    theDrow:setHairColor(210,210,210)
 end


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
msgs:addMessage("#me schlie�t die Augen und beginnt wie wahnsinnig zu lachen.", "#me closes the eyes and begins to laugh maniacally.");
msgs:addMessage("#mes Mund ist an den Mundwinkeln zu einem verdrehten L�cheln verzogen.", "#me's mouth curles up into a twisted smile.");
msgs:addMessage("#mes verengte Augen starren geradeaus.", "#me's narrow eyes stare straight ahead.");
msgs:addMessage("Br�der, Schwestern! Lasst uns Jagd auf die Schwachen machen.", "Brothers, sisters! Let us prey upon the weak.");
msgs:addMessage("Dein Unbehagen am�siert mich.", "Your discomfort amuses me.");
msgs:addMessage("Deine Schmerzen sind meine Freude.", "Your pain; my pleasure.");
msgs:addMessage("Deine Schreie werden wie Musik in meinen Ohren klingen.", "Your screams shall be music to my ears.");
msgs:addMessage("Der Blutgott soll heute nacht nicht hungrig bleiben.", "The Blood-God shall not hunger on this night.");
msgs:addMessage("Du hast jahrelang darauf gewartet vom Tod begr��t zu werden... was machen da ein paar Stunden mehr?", "You have waited years for death to greet you... what is a few more hours?");
msgs:addMessage("Geduld, Sterblicher... Geduld. Du wirst fr�h genug mit der Gegenwart des Blutgottes gesegnet werden.", "Patience, mortal� patience. You shall be blessed with the Blood-God's company soon enough.");
msgs:addMessage("Ich finde dein Leiden... unterhaltsam.", "I find your suffering... enchanting.");
msgs:addMessage("Langsam und schmerzhaft, so wird dein Tod sein.", "Slow and painful, so your death shall be.");
msgs:addMessage("Moshran! Empfange diesen Sterblichen!", "Moshran! Receive this mortal!");
msgs:addMessage("Schreist du etwa? Das solltest du.", "Do you scream? You shall.");

end

function M.enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==63) then
        return ( monstermagic.CastFlamefield(Monster, Enemy, {320, 500}) );
    elseif (MonID==64) then
        return ( monstermagic.CastMonster(Monster, {551, 822}) );
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
    elseif (MonID==63) then
        return ( monstermagic.CastFireball(Monster, Enemy, {2000, 3000}, {25,60}) or monstermagic.CastFlamefield(Monster, Enemy, {320, 500}) );
	elseif (MonID==64) then
		return ( monstermagic.CastMonster(Monster, {551, 822}) );
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
    if (MonID==61) then --Drow, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(2284,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --shield of the sky
        if not done then done=drop.AddDropItem(526,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --studded leather gloves
        if not done then done=drop.AddDropItem(2402,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow armor
        if not done then done=drop.AddDropItem(2303,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow helmet
        if not done then done=drop.AddDropItem(2399,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light elven armor

        --Category 2: Special loot

        local done=drop.AddDropItem(104,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --silver ingot
        if not done then done=drop.AddDropItem(1858,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --silver goblet
        if not done then done=drop.AddDropItem(174,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red cloth
        if not done then done=drop.AddDropItem(175,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --black cloth
        if not done then done=drop.AddDropItem(176,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --grey cloth

        --Category 3: Weapon

        local done=drop.AddDropItem(2778,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --elven sword
        if not done then done=drop.AddDropItem(2701,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --longsword
        if not done then done=drop.AddDropItem(2777,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --drow blade
        if not done then done=drop.AddDropItem(2788,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --snake sword
        if not done then done=drop.AddDropItem(2775,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven rainbowsword

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==62) then --Drow Warrior, Level: 6, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(95,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --heraldic shield
        if not done then done=drop.AddDropItem(2287,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --albarian soldier's helmet
        if not done then done=drop.AddDropItem(2402,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow armor
        if not done then done=drop.AddDropItem(2303,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow helmet
        if not done then done=drop.AddDropItem(2403,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --elven silversteel armor

        --Category 2: Special loot

        local done=drop.AddDropItem(222,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amulet
        if not done then done=drop.AddDropItem(224,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --golden goblet
        if not done then done=drop.AddDropItem(177,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --yellow cloth
        if not done then done=drop.AddDropItem(178,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --white cloth
        if not done then done=drop.AddDropItem(179,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blue cloth

        --Category 3: Weapon

        local done=drop.AddDropItem(2775,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --elven rainbowsword
        if not done then done=drop.AddDropItem(98,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --silvered longsword
        if not done then done=drop.AddDropItem(2777,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --drow blade
        if not done then done=drop.AddDropItem(85,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --coppered longsword
        if not done then done=drop.AddDropItem(2778,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven sword

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==63) then --Drow Mage, Level: 6, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(2377,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --red priest robe
        if not done then done=drop.AddDropItem(2420,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --black priest robe
        if not done then done=drop.AddDropItem(2380,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --blue coat
        if not done then done=drop.AddDropItem(183,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --green trousers
        if not done then done=drop.AddDropItem(457,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --green shirt

        --Category 2: Special loot

        local done=drop.AddDropItem(1317,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --empty bottle
        if not done then done=drop.AddDropItem(164,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --big empty bottle
        if not done then done=drop.AddDropItem(54,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --green cloth
        if not done then done=drop.AddDropItem(174,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red cloth
        if not done then done=drop.AddDropItem(175,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --black cloth

        --Category 3: Weapon

        local done=drop.AddDropItem(209,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --elven mage's staff
        if not done then done=drop.AddDropItem(57,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --simple mage's staff
        if not done then done=drop.AddDropItem(76,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --mage's staff
        if not done then done=drop.AddDropItem(1044,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ornate mage's staff
        if not done then done=drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==64) then --Drow Priest, Level: 6, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(2419,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --red priest robe
        if not done then done=drop.AddDropItem(2420,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --black priest robe
        if not done then done=drop.AddDropItem(832,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --red hat with feather
        if not done then done=drop.AddDropItem(459,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --red trousers
        if not done then done=drop.AddDropItem(180,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --red shirt

        --Category 2: Special loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --entrails
        if not done then done=drop.AddDropItem(173,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --sheep corpse
        if not done then done=drop.AddDropItem(176,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --grey cloth
        if not done then done=drop.AddDropItem(177,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --yellow cloth
        if not done then done=drop.AddDropItem(178,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --white cloth

        --Category 3: Weapon

        local done=drop.AddDropItem(40,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --cleric's staff
        if not done then done=drop.AddDropItem(39,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff
        if not done then done=drop.AddDropItem(209,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --battle staff
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --club
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --mace

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==65) then --Drow-leader, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(2111,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --full length chain pants
        if not done then done=drop.AddDropItem(184,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --visor helmet
        if not done then done=drop.AddDropItem(2402,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow armor
        if not done then done=drop.AddDropItem(2303,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow helmet
        if not done then done=drop.AddDropItem(2172,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel greaves

        --Category 2: Special loot

        local done=drop.AddDropItem(2376,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --black cultist robe
        if not done then done=drop.AddDropItem(1318,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --elven wine
        if not done then done=drop.AddDropItem(179,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blue cloth
        if not done then done=drop.AddDropItem(54,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --green cloth
        if not done then done=drop.AddDropItem(174,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red cloth

        --Category 3: Weapon

        local done=drop.AddDropItem(2731,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --two handed sword
        if not done then done=drop.AddDropItem(204,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --bastard sword
        if not done then done=drop.AddDropItem(3035,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --drow sword
        if not done then done=drop.AddDropItem(2636,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned double axe
        if not done then done=drop.AddDropItem(188,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --large waraxe

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins

    elseif (MonID==66) then
        -- Drops
    elseif (MonID==67) then
        --Drops
    elseif (MonID==68) then
        --Drops
    elseif (MonID==69) then
        --Drops
    else
        --Drops
    end
    drop.Dropping(Monster);
end

return M

