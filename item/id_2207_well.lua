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

-- UPDATE items SET itm_script='item.id_2207_well' WHERE itm_id IN (2207);

require("base.common")
require("base.lookat")

module("item.id_2207_well", package.seeall)

wellPosition1 = position(528, 555, 0); -- maze
wellPosition2 = position(105, 600, 0); -- Cadomyr
wellPosition3 = position(359, 273, 0); -- Galmair
wellPosition4 = position(849, 841, 0); -- Runewick

function UseItem(User, SourceItem, ltstate)

  if (SourceItem:getData("modifier") == "wishing well") then
    base.common.InformNLS(User,
      "Vielleicht kann sich einer deiner W�nsche erf�llen, wenn du etwas hineinwirfst?",
      "Maybe one of your wishes come true, if you pitch something in?");
  elseif SourceItem.pos == wellPosition1 then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
  elseif SourceItem.pos == wellPosition2 then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
  elseif SourceItem.pos == wellPosition3 then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
  elseif SourceItem.pos == wellPosition4 then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
  end

end

function LookAtItem(User, Item)

  local lookAt = base.lookat.GenerateLookAt(User, Item);

  if ( Item:getData("modifier") == "wishing well" ) then
    lookAt.name = base.common.GetNLS(User, "Wunschbrunnen", "wishing well");
  elseif Item.pos == wellPosition1 then
    lookAt.name = base.common.GetNLS(User, "Ausgetrockneter Brunnen", "Dry well");
  elseif Item.pos == wellPosition2 then
    lookAt.name = base.common.GetNLS(User, "Zisterne von Cadomyr", "Cadomyr Cavern");
  elseif Item.pos == wellPosition3 then
    lookAt.name = base.common.GetNLS(User, "Zisterne von Galmair", "Galmair Cavern");
  elseif Item.pos == wellPosition4 then
    lookAt.name = base.common.GetNLS(User, "Zisterne von Runewick", "Runewick Cavern");
  end

  return lookAt
end


