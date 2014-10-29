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

local arena = require("base.arena")
local common = require("base.common")
local messages = require("base.messages")
local base = require("monster.base.base")
local drop = require("monster.base.drop")
local kills = require("monster.base.kills")
local lookat = require("monster.base.lookat")
local monstermagic = require("monster.base.monstermagic")
local quests = require("monster.base.quests")

local M = {}

function ini(Monster)

    init = true;
    quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = messages.Messages();

    -- XXX: Not called for friendly monsters at all
    msgs:addMessage("#me m�ht.", "#me bahs.");
end

function M.enemyNear(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1, 10) == 1 then
         drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while
    end

    return false
end

function M.enemyOnSight(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while

    if base.isMonsterArcherInRange(Monster, Enemy) then
        return true
    end

    if base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
    end
end

function M.onAttacked(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function M.onCasted(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function M.onDeath(Monster)

    if arena.isArenaMonster(Monster) then
        return
    end
    if killer and killer[Monster.id] ~= nil then

        murderer = getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            quests.checkQuest(murderer, Monster);
            killer[Monster.id] = nil;
            murderer = nil;

        end
    end

    drop.ClearDropping();
    local MonID = Monster:getMonsterType();


    if (MonID == 181 or MonID == 182) then --sheep

        drop.AddDropItem(63,1,50,333,0,1); --entrails
        drop.AddDropItem(2934,1,50,333,0,2); --lamb meat
        drop.AddDropItem(170,1,100,333,0,3); --wool

    end
    drop.Dropping(Monster);
end

return M

