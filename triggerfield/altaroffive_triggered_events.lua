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


local common = require("base.common")

local M = {}

--This script handles scripted events on "Altar of Five" quest map
--Various events and fields are handled here for a better overview

local waypoint={} --a list with positions of the event triggers
waypoint[1] = position(550, 161, 0) -- Friendlies
waypoint[2] = position(549, 161, 0)
waypoint[3] = position(525, 129, 0)
waypoint[4] = position(525, 128, 0)
waypoint[5] = position(554, 148, 0) -- Bragon Area
waypoint[6] = position(553, 144, 0)
waypoint[7] = position(549, 143, 0)
waypoint[8] = position(550, 142, 0)
waypoint[9] = position(557, 133, 0) -- Findari Area
waypoint[10] = position(557, 136, 0)
waypoint[11] = position(561, 135, 0)
waypoint[12] = position(561, 131, 0)
waypoint[13] = position(538, 127, 0) -- Tanora Area
waypoint[14] = position(538, 128, 0)
waypoint[15] = position(547, 140, 0)
waypoint[16] = position(544, 124, 0)
waypoint[17] = position(556, 139, 0) -- Eldan Area
waypoint[18] = position(555, 142, 0)
waypoint[19] = position(562, 143, 0)
waypoint[20] = position(559, 139, 0)
waypoint[21] = position(545, 120, 0) -- Ushara Area
waypoint[22] = position(545, 119, 0) 
waypoint[23] = position(545, 118, 0)
waypoint[24] = position(545, 117, 0)
waypoint[25] = position(545, 120, 0) -- Tree Area
waypoint[26] = position(545, 119, 0)
waypoint[27] = position(545, 118, 0)
waypoint[28] = position(545, 117, 0)

local messageG = {} --German informs
messageG[1] = ""
messageG[2] = ""
messageG[3] = ""
messageG[4] = ""
messageG[5] = ""
messageG[6] = ""
messageG[7] = ""

local messageE = {} --English informs
messageE[1] = "All around can be seen others, who have come to pray and make offerings to the Five."
messageE[2] = "As you walk through Brágon's domain, flames shoot up around you. You have been blessed."
messageE[3] = "As you walk through Findari's domain, wind buffets you from all sides. You have been blessed."
messageE[4] = "As you walk through Tanora's domain, rain pours down from above and water spurts up from the ground around you. You have been blessed."
messageE[5] = "As you walk through Eldan's domain, spirits rise from the ground around you. You have been blessed."
messageE[6] = "As you walk through Ushara's doman, vegetables sprout from the ground around you. You have been blessed."
messageE[7] = "As you gaze at the tree, which stands in the water, you notice that the drops in the water are falling off the tree."

function M.MoveToField(User)

    if User:getType() ~= Character.player then
        return
    end

    if math.random(1, 4) == 1 then --only player characters trigger the triggerfield at a chance of 20%

        local theWaypoint
        for i = 1, #waypoint do
            if User.pos == waypoint[i] then
                theWaypoint = i
                break
            end
        end

        -- skip if already tripped in the last 5 minutes
        if (world:isItemOnField(User.pos) == true) then
            local trip = world:getItemOnField(User.pos)
            local serverTime = world:getTime("unix")
            local trippingTime = trip:getData("tripping_time")

            if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
                return
            end
            -- safe tripping time
            trip:setData("tripping_time", serverTime)
            world:changeItem(trip)
        end

        if theWaypoint >= 1 and theWaypoint <=  4 then -- simple inform

            common.InformNLS(User, messageG[1], messageE[1]) --sending a message
		end

		elseif theWaypoint>= 5 and theWaypoint <= 8 then - trigger flames
		
	        common.InformNLS(User, messageG[2], messageE[2]) --sending a message
			
			world:gfx(38,position(551,143,0)); --a flame
			world:gfx(38,position(552,143,0)); --a flame
			world:gfx(38,position(549,145,0)); --a flame
			world:gfx(38,position(557,147,0)); --a flame
			world:gfx(38,position(547,147,0)); --a flame			
			world:makesound(5,position(551,143,0)); --a flame
			world:makesound(5,position(552,143,0)); --a flame
			world:makesound(5,position(549,145,0)); --a flame
			world:makesound(5,position(557,147,0)); --a flame
			world:makesound(5,position(547,147,0)); --a flame
		end
			
		elseif theWaypoint>= 9 and theWaypoint <= 12 then -- trigger wind
		
	        common.InformNLS(User, messageG[3], messageE[3]) --sending a message
			
			world:gfx(7,position(556,135,0)); --a wind
			world:gfx(7,position(566,133,0)); --a wind
			world:gfx(7,position(560,133,0)); --a wind
			world:gfx(7,position(556,131,0)); --a wind
			world:gfx(7,position(563,125,0)); --a wind
			world:makesound(27,position(556,135,0)); --a wind
			world:makesound(27,position(566,133,0)); --a wind
			world:makesound(27,position(560,133,0)); --a wind
			world:makesound(27,position(556,131,0)); --a wind
			world:makesound(27,position(563,125,0)); --a wind
		end	
         
		elseif theWaypoint>= 13 and theWaypoint <= 16 then - trigger water
		
	        common.InformNLS(User, messageG[4], messageE[4]) --sending a message
			
			world:gfx(11,position(549,138,0)); --a water
			world:gfx(11,position(543,139,0)); --a water
			world:gfx(11,position(540,136,0)); --a water
			world:gfx(11,position(547,133,0)); --a water
			world:gfx(11,position(538,129,0)); --a water
			world:makesound(9,position(549,138,0)); --a water
			world:makesound(9,position(543,139,0)); --a water
			world:makesound(9,position(540,136,0)); --a water
			world:makesound(9,position(547,133,0)); --a water
			world:makesound(9,position(538,129,0)); --a water
		end
		
		elseif theWaypoint>= 17 and theWaypoint <= 20 then - trigger light
		
	        common.InformNLS(User, messageG[5], messageE[5]) --sending a message
			 
			world:gfx(53,position(556,141,0)); --a light
			world:gfx(53,position(559,145,0)); --a light
			world:gfx(53,position(566,139,0)); --a light
			world:gfx(53,position(556,138,0)); --a light
			world:gfx(53,position(562,139,0)); --a light
		end
       
	   elseif theWaypoint>= 21 and theWaypoint <= 24 then - trigger crops
		
	        common.InformNLS(User, messageG[6], messageE[6]) --sending a message
			
			world:createItemFromId(2492,1,position(552,123,0),true,599,nil); --a carrot
			world:createItemFromId(537,1,position(551,123,0),true,599,nil); --a onion
			world:createItemFromId(289,1,position(551,122,0),true,599,nil); --a cabbage
			world:createItemFromId(540,1,position(552,122,0),true,599,nil); --a tomato
		end
		
		elseif theWaypoint>= 25 and theWaypoint <= 28 then - trigger water
		
	        common.InformNLS(User, messageG[7], messageE[7]) --sending a message
			
			world:gfx(11,position(537,117,0)); --a water			
			world:gfx(11,position(538,118,0)); --a water
			world:gfx(11,position(537,118,0)); --a water
			world:gfx(11,position(537,116,0)); --a water
			world:makesound(9,position(537,117,0)); --a water			
			world:makesound(9,position(538,118,0)); --a water
			world:makesound(9,position(537,118,0)); --a water
			world:makesound(9,position(537,116,0)); --a water
		end --all events handled

    end --triggerfield

end

return M

