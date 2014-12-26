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
local base = require("monster.base.base")
local slimes = require("monster.race_61_slime.base")

local M = {}

function M.generateCallbacks()
    local t = slimes.generateCallbacks()
    local orgOnSpawn = t.onSpawn

    function t.onSpawn(monster)
        if orgOnSpawn ~= nil then
            orgOnSpawn(monster)
        end

        base.setColor{monster = monster, target = base.SKIN_COLOR,
            hue = {min = 345, max = 355}, -- 350� +- 5� --> red
            saturation = {min = 0.94, max = 0.98},
            value = {min = 0.98, max = 1.00}}
    end
    return t
end

return M