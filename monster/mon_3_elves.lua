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

function M.onSpawn(theElf)

	local mySex = math.random(0,1);

    local var=20; -- variation of color, +/- var
    local baseR=255;  -- baseRed
	local baseG=230;  -- baseGreen
	local baseB=210;  -- baseBlue
    local red = math.min(255, baseR + math.random(-var, var));
    local green = math.min(255, baseG + math.random(-var, var));
    local blue = math.min(255, baseB + math.random(-var, var));
    local myHair = {};
    myHair[0] = {1,2};    -- list of possible hair IDs
    myHair[1] = {1,4,7,8};
    local hairBlonde = {255,157,98} -- Blonde hair Red,Green,Blue
	local hairPurple = {64,0,64} -- Purple hair Red,Green,Blue
	local hairGreen = {0,64,64} -- Green hair Red,Green,Blue
	local hairBrunette = {128,64,64} -- Brunette hair Red,Green,Blue
	local hairColors = {hairBlonde, hairPurple, hairGreen, hairBrunette}
	local myHairColor = hairColors[math.random(#hairColors)]
	theElf:setAttrib("sex",mySex);
    theElf:setSkinColor(red,green,blue);
    theElf:setHair( myHair[mySex][math.random(#myHair[mySex])] );
    theElf:setHairColor(myHairColor[1], myHairColor[2], myHairColor[3] );
 end
 
function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
msgs:addMessage("Bei der Macht des Waldes!", "By the power of nature!");
msgs:addMessage("Die G�tter m�gen mir beistehen.", "May the gods be with me.");
msgs:addMessage("#mes Augen blitzen vor verzweifelter Wut auf.", "#me's eyes flash in desperate fury.");
msgs:addMessage("#me bewegt sich mit geschwinden Schritten �ber den Boden.", "#me moves with wide steps over the ground.");
msgs:addMessage("Oh, welch Schicksal, dass ich eine Waffe gegen euch erheben muss. Verzeiht mir.", "Oh, what fate is this that I have to raise a weapon against you. Forgive me!");
msgs:addMessage("Die Gerechtigkeit wird euch einholen, sei es heute, sei es in hundert Jahren.", "Justice will overcome you, be it now, be it in a hundred years.");
msgs:addMessage("Ich f�rchte den Tod nicht, er kann auch eine Erl�sung sein, verglichen mit einem Leben in Feigheit.", "I do not fear death, for it is far superior to a life in fear.");
msgs:addMessage("Ihr m�gt mich heute niederstrecken, doch wird man meine Taten besingen, wenn der Name eures Volkes bereits vergessen wurde.", "You may slay me today, but my deeds will be sung about when the name of your people will be long forgotten.");
msgs:addMessage("Mein Volk wird Rache an eurem Stamm nehmen bis die siebte Generation eurer Brut vertilgt ist.", "My people will take revenge on your tribe until the seventh generation of your offspring has passed.");
msgs:addMessage("Die, die ihre Hand gegen das unsterbliche Volk erheben, bringen Unheil �ber sich.", "Those who raise their weapon against the eternal people bring doom upon themselves.");

end

function M.enemyNear(Monster,Enemy)

    local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

	if (MonID==33) then
        return ( monstermagic.CastMonster(Monster, {252, 582, 622}) );
    elseif (MonID==34) then
        return ( monstermagic.SuddenWarp(Monster, Enemy) );
    else
        return false;
    end
end

--

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
	elseif (MonID==33) then
        return ( monstermagic.CastMonster(Monster, {252, 582, 622}) );
    elseif (MonID==34) then
        return ( monstermagic.CastFireball(Monster, Enemy, {1200, 2500}, {25, 60}) );
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

   if (MonID==31) then --Elf, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=drop.AddDropItem(369,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather shoes
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=drop.AddDropItem(2457,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --wine glass
        if not done then done=drop.AddDropItem(388,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --grapes
        if not done then done=drop.AddDropItem(1318,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --elven wine
        if not done then done=drop.AddDropItem(2679,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --green dye
        if not done then done=drop.AddDropItem(2678,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --black dye

        --Category 3: Weapon

        local done=drop.AddDropItem(64,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=drop.AddDropItem(65,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --short bow
        if not done then done=drop.AddDropItem(2714,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow
        if not done then done=drop.AddDropItem(89,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --sling
        if not done then done=drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --long bow

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==32) then --Elven Warrior, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(367,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short leather legs
        if not done then done=drop.AddDropItem(2388,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --red steel shield
        if not done then done=drop.AddDropItem(697,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots
        if not done then done=drop.AddDropItem(2399,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light elven armor
        if not done then done=drop.AddDropItem(2400,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --magical elven armor

        --Category 2: Special loot

        local done=drop.AddDropItem(335,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --lute
        if not done then done=drop.AddDropItem(90,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --flute
        if not done then done=drop.AddDropItem(332,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --harp
        if not done then done=drop.AddDropItem(2680,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blue dye
        if not done then done=drop.AddDropItem(2681,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red dye

        --Category 3: Weapon

        local done=drop.AddDropItem(78,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --short sword
        if not done then done=drop.AddDropItem(25,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --sabre
        if not done then done=drop.AddDropItem(2775,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven rainbow sword
        if not done then done=drop.AddDropItem(2778,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven sword
        if not done then done=drop.AddDropItem(2701,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --longsword

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==33) then --Elven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(183,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green trousers
        if not done then done=drop.AddDropItem(812,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --black doublet
        if not done then done=drop.AddDropItem(368,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow priest robe
        if not done then done=drop.AddDropItem(2421,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --white priest robe
        if not done then done=drop.AddDropItem(825,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red trousers

        --Category 2: Special loot

        local done=drop.AddDropItem(2745,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --parchment
        if not done then done=drop.AddDropItem(463,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --quill
        if not done then done=drop.AddDropItem(2744,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pipe
        if not done then done=drop.AddDropItem(164,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --big empty bottle
        if not done then done=drop.AddDropItem(2682,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --yellow dye

        --Category 3: Weapon

        local done=drop.AddDropItem(209,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --elven mage's staff
        if not done then done=drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=drop.AddDropItem(1044,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=drop.AddDropItem(57,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --simple mage's staff

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==34) then --Elven Mage, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(459,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --red trousers
        if not done then done=drop.AddDropItem(180,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --red shirt
        if not done then done=drop.AddDropItem(2419,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red priest robe
        if not done then done=drop.AddDropItem(2420,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black priest robe
        if not done then done=drop.AddDropItem(2416,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --brown priest robe

        --Category 2: Special loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --entrails
        if not done then done=drop.AddDropItem(2746,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --razor blade
        if not done then done=drop.AddDropItem(224,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden goblet
        if not done then done=drop.AddDropItem(1840,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --copper goblet
        if not done then done=drop.AddDropItem(2683,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --grey dye

        --Category 3: Weapon

        local done=drop.AddDropItem(39,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --skull staff
        if not done then done=drop.AddDropItem(40,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --cleric's staff
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=drop.AddDropItem(57,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --simple mage's staff
        if not done then done=drop.AddDropItem(76,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==35) then --Elven Hunter, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(2114,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short fur trousers
        if not done then done=drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=drop.AddDropItem(2934,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --lamb meat
        if not done then done=drop.AddDropItem(553,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --rabbit meat
        if not done then done=drop.AddDropItem(552,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --deer meat
        if not done then done=drop.AddDropItem(307,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pork
        if not done then done=drop.AddDropItem(2940,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --steak

        --Category 3: Weapon

        local done=drop.AddDropItem(64,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=drop.AddDropItem(2714,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow
        if not done then done=drop.AddDropItem(2780,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ebony wood bow
        if not done then done=drop.AddDropItem(2685,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --magical elven bow
        if not done then done=drop.AddDropItem(2718,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven composite bow

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    elseif (MonID==36) then
        -- Drops
    elseif (MonID==37) then
        --Drops
    elseif (MonID==38) then
        --Drops
    elseif (MonID==39) then
        --Drops
    else
        --Drops
    end
    drop.Dropping(Monster);
end

return M

