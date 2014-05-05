	--Addition by Caldarion: Quest 181/182/183 Spy Informant (Bula Glasha) Cooldown
	theQuestStatus=Char:getQuestProgress(182);
	
	if theQuestStatus == 1 then --Time over!
	
        base.common.InformNLS(Char,"","[Information status] You were too slow collecting data, you have lost your fee."); -- Feedback!
		Char:setQuestProgress(181,0);
		
	end

	if theQuestStatus == 3 then --Ten minutes left!
	
        base.common.InformNLS(Char,"[","[Information status] In ten minutes, your chance to collect information for Bula Glasha will be over."); -- Feedback!
		
	end
	
	if theQuestStatus == 13 then --One hour left
	
	    base.common.InformNLS(Char,"","[Information status] One hour left for earning the information fee of Bula Glasha."); -- Feedback!
	
	end
	
	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(182,theQuestStatus-1); --counting down!
	end
	--Addition end
	
	Effect.nextCalled = 3000; --Effect gets called each 5 minutes

	return true; --No idea why!
	
end

function removeEffect( Effect, Character )

--This effect doesn't get removed.

end

function loadEffect(Effect, Character)

end
