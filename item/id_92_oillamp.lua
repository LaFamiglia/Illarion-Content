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
-- I_92 Oel-Lampe

-- UPDATE items SET itm_script='item.id_92_oillamp' WHERE itm_id=92;

local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem)
    x=math.random(99);
    if x < 6 then
        common.InformNLS(User,"Du bist nicht sicher, aber es scheint als w�rde die Lampe etwas leuchten","You are not sure, but it seems the lamp starts to glow a little.");
    elseif x < 16 then
        common.InformNLS(User,"Du glaubst zu f�hlen, dass die Lampe w�rmer wird","You think the lamp gets warmer!");
    else
        common.InformNLS(User,"Du reibst an der Lampe, doch nichts passiert.","You rub the lamp but nothing happens.");

    end
end

return M

