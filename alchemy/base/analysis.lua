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
-- analysis

local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")

module("alchemy.base.analysis", package.seeall)

function StockAnalysis(User, gem, brew, ltstate)
	local analysisResultDE = "Substanz:\nKr�utersud\n\nWirkstoffkonzentrationen:\n"
	local analysisResultEN = "Substanz:\nHerbal Stock\n\nActive substance concentrations:\n"
	for i=1,8 do -- loop to get the concentration of the eight active substances
		local wirkstoff = alchemy.wirkstoff
		local myCon = tonumber(brew:getData(""..wirkstoff[i].."Concentration"))
		if myCon == nil then
			myCon = 5
		end
		local conListDE = alchemy.wirkung_de
		local conListEN = alchemy.wirkung_en		
		analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
		analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
	end
	return analysisResultDE, analysisResultEN
end

function EssenceBrewAnalysis(User, gem, brew, ltstate)
    local cauldron, bottle
	local reGem, reGemdust, reCauldron, reBottle
	if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
		reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, nil, brew.id, nil) 
	else -- brew is a bottle
		reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, nil, nil, brew.id) 	
	end	
	local analysisResultDE
	local analysisResultEN
	if gem.id ~= reGem then -- the gem used does not match the substance
	    analysisResultDE = "Die Analyse f�hrt zu keinen schl�ssigen Ergebnissen."
		analysisResultEN = "The analysis does not provide any decent results."
	else	
		analysisResultDE = "Substanz:\nEssenzgebr�u auf "..world:getItemName(reGemdust,Player.german).."basis\n\nEssenzierte Kr�uter:\n"
		analysisResultEN = "Substance:\nEssence brew based on "..world:getItemName(reGemdust,Player.english).."\n\nEssenced herbs:\n"
		for i=1,8 do -- loop to get the essence herbs
			if brew:getData("essenceHerb1") == "" then
				analysisResultDE = analysisResultDE.."Keine essenzierten Kr�uter entahlten"
				analysisResultEN = analysisResultEN.."Contains no essenced herbs"
				break
			elseif brew:getData("essenceHerb"..i) == "" then
			        break
			else		
				local myId = tonumber(brew:getData("essenceHerb"..i))
				analysisResultDE = analysisResultDE..world:getItemName(myId,Player.german).."\n"
				analysisResultEN = analysisResultEN..world:getItemName(myId,Player.english).."\n"	
			end
		end
	end	
    
	return analysisResultDE, analysisResultEN
end

function PotionAnalysis(User, gem, brew, ltstate)
	local cauldron, bottle, potionQuality, potionQualityDE, potionQualityEN
	local reGem, reGemdust, reCauldron, reBottle
	if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
		reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, nil, brew.id, nil)
		potionQuality = tonumber(brew:getData("potionQuality"))
	else -- brew is a bottle
		reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, nil, nil, brew.id)
		potionQuality = brew.quality
	end
	local analysisResultDE
	local analysisResultEN
	if gem.id ~= reGem then -- the gem used does not match the substance
	    analysisResultDE = "Die Analyse f�hrt zu keinen schl�ssigen Ergebnissen."
		analysisResultEN = "The analysis does not provide any decent results."
	else	
		local qListDE = alchemy.qListDe
		local qListEN = alchemy.qListEn
		potionQualityEN = alchemy.qListEn[math.floor(potionQuality/100)]
		potionQualityDE = alchemy.qListDe[math.floor(potionQuality/100)]
		analysisResultDE = "Substanz:\nTrank auf "..world:getItemName(reGemdust,Player.german).."basis\n\nTrankg�te:\n"..potionQualityDE.." Qualit�t\n\nWirkung:\n"
		analysisResultEN = "Substance:\nPotion based on "..world:getItemName(reGemdust,Player.english).."\n\nPotion quality:\n"..potionQualityEN.." quality\n\nEffect:"
		local potionEffectId = tonumber(brew:getData("potionEffectId"))
		if (potionEffectId == 0) or (potionEffectId == nil) then
			analysisResultDE = analysisResultDE.."Keine Wirkung"
			analysisResultEN = analysisResultEN.."No effect"
		elseif (potionEffectId >= 11111111) and (potionEffectId <= 99999999) then
			if (reGemdust == 447) or (reGemdust == 450) then 
				local dataZList = alchemy.SplitData(User,brew:getData("potionEffectId"))
				for i=1,8 do 
					local wirkstoff = alchemy.wirkstoff
					local myCon = dataZList[i]
					if myCon == nil then
						myCon = 5
					end
					local conListDE = alchemy.wirkung_de
					local conListEN = alchemy.wirkung_en		
					analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
					analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
				end			
			end
		elseif potionEffectId >= 5911111111 and potionEffectId <= 5999999999 then
		    analysisResultDE = analysisResultDE.."Sichtungstrank"
			analysisResultEN = analysisResultEN.."Sighting potion"
		else
			effectList = alchemy.potionName
			local potionEffectEN = effectList[potionEffectId][1]
			local potionEffectDE = effectList[potionEffectId][2]
			if (potionEffectEN == nil) or (potionEffectDE == nil) then -- potion has an effect id, but the effect id has no entry in the name list
				potionEffectEN = "Unknow effect"; potionEffectDE = "Unbekannte Wirkung"
			end	
			analysisResultDE = analysisResultDE..potionEffectDE
			analysisResultEN = analysisResultEN..potionEffectEN
		end
    end
	return analysisResultDE, analysisResultEN	
end

function AnalysisOfBrew(User, gem, brew, ltstate)

    local isAlchemist = alchemy.CheckIfAlchemist(User)
	if not isAlchemist then
        User:inform("Nur jene, die die Kunst der Alchemie beherrschen verm�gen zu analysieren.","Only those who have been introduced to the art of alchemy are able to analyse.")
		return
    end
	
	if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then 
		User:inform("Verstand, ein gutes Auge und ein Gesp�r f�r die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten k�nntest.",
		            "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
	                )
		return
    end
	
	-- for every possible substance, we create the proper informs
    local analysisResultDE
	local analysisResultEN
	if brew:getData("filledWith") == "water" then
	    analysisResultDE = "Substanz: Wasser"
		analysisResultEN = "Substance: Water"
		
	elseif brew:getData("filledWith")=="meraldilised slime" then
		analysisResultDE = "Substanz: Meraldilierter Schleim"
		analysisResultEN = "Substance: Meraldilised Slime"
		
	elseif brew:getData("filledWith") == "stock" then
	    analysisResultDE, analysisResultEN = StockAnalysis(User, gem, brew, ltstate)
		
	elseif brew:getData("filledWith") == "essenceBrew" then
        analysisResultDE, analysisResultEN = EssenceBrewAnalysis(User, gem, brew, ltstate)
		
	elseif brew:getData("filledWith") == "potion" then
	    analysisResultDE, analysisResultEN = PotionAnalysis(User, gem, brew, ltstate)
	end	
	
	if analysisResultDE and analysisResultEN then 
		-- message box for the results
		local callback = function(dialog) end
		if User:getPlayerLanguage() == 0 then
			dialog = MessageDialog("Analyseergebnis", analysisResultDE, callback)
		else
			dialog = MessageDialog("Results of the analysis", analysisResultEN, callback)
		end
		User:requestMessageDialog(dialog)
	end	
end

function CauldronPotionCheck(User, SourceItem, TargetItem, ltstate)
    local cauldron = alchemy.GetCauldronInfront(User)
	if (cauldron) and (cauldron.id ~= 1008) then
		AnalysisOfBrew(User, SourceItem, cauldron, ltstate)
	else	
	    local brew = User:getItemAt(5)
		-- repair potion in case it's broken
		alchemy.repairPotion(brew)
		-- repair end
		if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") or brew:getData("filledWith")=="meraldilised slime" then
	        AnalysisOfBrew(User, SourceItem, brew, ltstate)
		else	
	        local brew = User:getItemAt(6)
			-- repair potion in case it's broken
			alchemy.repairPotion(brew)
			-- repair end
			if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") or brew:getData("filledWith")=="meraldilised slime" then
				AnalysisOfBrew(User, SourceItem, brew, ltstate)
			end
        end
    end		
			
end