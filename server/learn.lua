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

-- called by the server when user:learn(...) is issued by a script

--[[
Call: Character:learn(skill, movePoints, learnLimit);

skill: Name of the skill as skill key, e.g. Character.mining
movePoints: The amount of movePoints or time (1/10s), required by the action, as integer. Do NOT fill in 0, every action relevant for skillgain HAS TO take some time.
learnLimit: Maximum skill level the user can reach with the triggering action.

]]

function M.learn(user, skill, actionPoints, learnLimit)
	
	leadAttrib = getLeadAttrib(user,skill); --reading the lead attribute
	local skillName = user:getSkillName(skill) --reading the skill
	
    --Learning speed - Change here if you're unhappy with the learning speed. Skillgain scales in a linear way.
	scalingFactor=500; --Here, you can mod the learning speed. Higher value=faster
	
	--Constants - Do not change unless you know exactly what you're doing!
	amplification=100; --An 'abritrary' value that governs the 'resolution' of the MC function.
	lowerBorder=0.5*amplification/0.00025; --below 0.5% of time spent online, no additional bonus is granted
	normalMC=10*lowerBorder; --A 'normal' player invests 10x the time (=5%) into skill related actions
	normalAP=50; --How many movepoints does a 'normal' action take? Default=50
	--Constants - end
	
    skillValue=user:getSkill(skill); --reading the skill points
	minorSkill=user:getMinorSkill(skill); --reading the minor skill points; 10000=1 skill point
	MCvalue=math.max(lowerBorder,user:getMentalCapacity()); --below 0.5% of time spent online, no additional bonus is granted

    if skillValue<learnLimit and skillValue<100 then --you only learn when your skill is lower than the skill of the learnLimit and your skill is <100

        chanceForSkillGain=(100-skillValue);
	
        if math.random(0,99)<chanceForSkillGain then --Success?

            MCfactor=normalMC/(math.max(MCvalue,1)); --5% of time spent online is considered "normal" -> MCfactor is 1
            attributeFactor=math.min(1.5,(0.5+0.5*(leadAttrib/10))); --0.5 to 1.5, depending on attribute, limited to 1.5 (no bonus for insane attributes, balancing!)
			actionpointFactor=(actionPoints/normalAP); --An action with 50AP is "normal"
			minorIncrease=math.floor(scalingFactor*attributeFactor*actionpointFactor*MCfactor);
            
			
			--For debugging, use the following line.
			--user:inform("Skill= "..skillName..", actionPoints="..actionPoints..", MCfactor="..MCfactor..", attributeFactor="..attributeFactor..", actionpointFactor="..actionpointFactor..", minorIncrease="..minorIncrease.."!");
						
			while minorIncrease>0 do --for the rare case that an action results in two swirlies, we have this loop
			
                realIncrease=math.min(minorIncrease,10000) --to prevent overflow, we cannot gain more than one level per action anyway
				
                if minorSkill+realIncrease<10000 then
                    user:increaseMinorSkill(skill,realIncrease); --minimum of 10 actions of 50AP for a swirlie at 5% activity
					
                else --Level up!
				    skillValue=user:getSkill(skill); --reading the skill points
     			    user:increaseMinorSkill(skill,realIncrease); --this is why we do all this grinding!
										
					if user:getType() == 0 and user:getQuestProgress(154)~=1 then --Only players get an inform once

						skillstring=user:getSkillName(skill);
						common.InformNLS(user,"[Levelaufstieg] Deine Fertigkeit '"..skillstring.."' hat sich soeben erh�ht. Dr�cke 'C' um deine Fertigkeiten anzeigen zu lassen.","[Level up] Your skill '"..skillstring.."' just increased. Hit 'C' to review your skills."); --sending a message
						user:setQuestProgress(154,1); --Remember that we already spammed the player
					
					elseif user:getType() == 0 then
						
						skillstring=user:getSkillName(skill);
						common.TempInformNLS(user,skillstring.." +1",skillstring.." +1"); --sending a message
						
					end						
		        end
			
			minorIncrease=minorIncrease-10000;
			
			end 

		end
        user:increaseMentalCapacity(amplification*actionPoints);
    end
end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function M.reduceMC( user )
    
	if user:idleTime() < 300 then --Has the user done any action or spoken anything within the last five minutes?
     	user:increaseMentalCapacity(-1*math.floor(user:getMentalCapacity()*0.00025+0.5)); --reduce MC-points by 0.025%, rounded correctly.
	end
end

function getLeadAttrib(Char, Skill)
  local leadAttribName = common.GetLeadAttributeName(Skill);
  if leadAttribName~=nil then
    return Char:increaseAttrib(leadAttribName,0);
  end
  return 10; --10 should be default
end

return M