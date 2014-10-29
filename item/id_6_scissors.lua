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
-- UPDATE items SET itm_script='item.id_6_scissors' WHERE itm_id IN (6);

local common = require("base.common")
local entrailscutting = require("content.gatheringcraft.entrailscutting")
local threadproducing = require("content.gatheringcraft.threadproducing")
local weaving = require("content.gatheringcraft.weaving")
local woolcutting = require("content.gatheringcraft.woolcutting")
local metal = require("item.general.metal")

local M = {}

M.LookAtItem = metal.LookAtItem

function getLoom(User)

	local LOOM = 169;
	local item = common.GetFrontItem(User);
	if (item ~= nil and item.id == LOOM) then
		return item;
	end
	item = common.GetItemInArea(User.pos, LOOM);
	return item;
end

function getWheel(User)

	local WHEEL = 171;
	local item = common.GetFrontItem(User);
	if (item ~= nil and item.id == WHEEL) then
		return item;
	end
	item = common.GetItemInArea(User.pos, WHEEL);
	return item;
end

function getSheep(User)
	local targetCharacter = common.GetFrontCharacter(User);
	-- check for sheep in front
	if (targetCharacter ~= nil and targetCharacter:getRace()==18) then
		return targetCharacter;
	end
	-- look for a nearby sheep
	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isCharacterOnField(pos) ) then
				targetCharacter = world:getCharacterOnField(pos);
				if ( targetCharacter:getRace() == 18 ) then
					return targetCharacter;
				end
			end
		end
	end
	return nil;
end


function M.UseItem(User, SourceItem, ltstate)

	local target;

	-- check for sheep
	target = getSheep(User);
	if (target ~= nil) then
		woolcutting.StartGathering(User, target, ltstate);
		return;
	end


	-- check for spinning wheel
	target = getWheel(User);
	if (target ~= nil) then
		if base.licence.licence(User) then --checks if user is citizen or has a licence
			return -- avoids crafting if user is neither citizen nor has a licence
		end
		threadproducing.StartGathering(User, target, ltstate);
		return;
	end

	-- check for loom
	target = getLoom(User);
	if (target ~= nil) then
		if base.licence.licence(User) then --checks if user is citizen or has a licence
			return -- avoids crafting if user is neither citizen nor has a licence
		end
		weaving.StartGathering(User, target, ltstate);
		return;
	end

	-- check for entrails in inventory
	if (User:countItemAt("all", 63) > 0) then
		entrailscutting.StartGathering(User, nil, ltstate);
		return;
	end

	-- there is nothing to work with
	common.HighInformNLS( User,
	"Du brauchst entweder ein Schaf, um es zu scheren, musst for einem Spinnrad oder Webstuhl stehen, oder brauchst Eingeweide, um sie zu Garn zu zerschneiden.",
	"You need either a sheep for shearing it, or need to stand in front of a spinning wheel or loom, or need entrails for cutting it and thus producing thread." );
end

return M

