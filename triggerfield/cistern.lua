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
-- triggerfields for better atmosphere

--[[ SQL Statements:
INSERT INTO triggerfields VALUES (X,Y,Z,'triggerfield.cistern');

]]

require("base.common")

module("triggerfield.cistern", package.seeall)

--[[
position: coordinates
direction: array with directions, 0=North,2=East,4=South,6=West. Set nil for always
german/english: text
hours: array with hours when text shall be shown, in range of 0 to 23. Set to nil for always.
months: array with months when text shall be shown, in range of 1 to 16. Set to nil for always.
chance: Chance that this triggerfield is triggered in percent (integer)

for script:
cisternList:add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.cistern');
]]


cisternList = {	add = function ( self, pos, direction, german, english, hours, months, chance )
						if not self[pos.x] then
							self[pos.x] = {};
						end
						if not self[pos.x][pos.y] then
							self[pos.x][pos.y] = {};
						end
						if not self[pos.x][pos.y][pos.z] then
							self[pos.x][pos.y][pos.z] = {};
						end
						local this = self[pos.x][pos.y][pos.z];
						table.insert(this, {
                            direction = direction or {0,1,2,3,4,5,6,7};
							german = german or "";
							english = english or "";
							hours = hours or {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
							months = months or {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
                            chance = chance or 100;
							} );
				end
}

-- cistern_-3 triggers using Ambient.lua as a guide
cisternList:add( position(444,766,-3 ),nil,"Der Geruch der Wüste wird von einem süsslichen Verwesungsgestank überlagert.","The smell of desert air starts growing fainter as the smell of decay takes over.",nil,nil,100); --cistern_-3
cisternList:add( position(449,759,-3 ),nil,"In der Ferne ist ein leises Knacken zu hören.","A faint crackling can be heard in the distance.",nil,nil,100); --cistern_-3

-- cistern_-6 triggers using Ambient.lua as a guide
cisternList:add( position(462,748,-6),nil,"Die Luft um dich herum ist erstickend heiss und erfüllt von dem Knistern der Flammen.","The air around you is stifling hot and filled with the sound of crackling flames.",nil,nil,100); --cistern_-6
cisternList:add( position(459,769,-6),nil,"Gequälte Schreie hallen von den Steinen wieder.","Screaming sounds of torment echo off the stones.",nil,nil,100); --cistern_-6
cisternList:add( position(466,777,-6),nil,"Gequälte Schreie hallen von den Steinen wieder.","Screaming sounds of torment echo off the stones.",nil,nil,100); --cistern_-6
cisternList:add( position(531,789,-6),nil,"Gequälte Schreie hallen von den Steinen wieder.","Screaming sounds of torment echo off the stones.",nil,nil,100); --cistern_-6
cisternList:add( position(536,754,-6),nil,"Gequälte Schreie hallen von den Steinen wieder.","Screaming sounds of torment echo off the stones.",nil,nil,100); --cistern_-6
cisternList:add( position(502,786,-6),nil,"Starke Winde stoßen dich in alle Richtungen und versuchen dich umzuwerfen.","Strong winds buffet you from every direction attempting to knock you off your feet.",nil,nil,100); --cistern_-6
cisternList:add( position(544,816,-6),nil,"Von unten erklingt wahnsinniges Gelächter.","Maniacal laughter is heard below.",nil,nil,100); --cistern_-6
cisternList:add( position(545,815,-6),nil,"Von unten erklingt wahnsinniges Gelächter.","Maniacal laughter is heard below.",nil,nil,100); --cistern_-6

-- cistern_-9 triggers using Ambient.lua as a guide
cisternList:add( position(436,855,-9),nil,"Als du in die lichtlose Tiefe schaust, kannst du nicht sagen ob es sich um einen schwarzen Boden oder um ein bodenloses Loch handelt.  Schreite vorsichtig voran, der Weg zum Ausgang ist nicht so wie er scheint. Schau nicht nach unten!","When you look down, all you see is black and can't tell if the floor is black or bottomless as no light is reflected. Proceed with caution as the way to the far exit is not as clear as it may seem. Don't look down!",nil,nil,100); --cistern_-9
cisternList:add( position(435,855,-9),nil,"Als du in die lichtlose Tiefe schaust, kannst du nicht sagen ob es sich um einen schwarzen Boden oder um ein bodenloses Loch handelt.  Schreite vorsichtig voran, der Weg zum Ausgang ist nicht so wie er scheint. Schau nicht nach unten!","When you look down, all you see is black and can't tell if the floor is black or bottomless as no light is reflected. Proceed with caution as the way to the far exit is not as clear as it may seem. Don't look down!",nil,nil,100); --cistern_-9
cisternList:add( position(431,843,-9),nil,"Das wird unser Biest aber traurig machen, dass du nicht abgestürzt bist. Vielleicht das nächste mal. Ein Böses Gelächter ertönt.","Our beast will be saddened you didn't fall, perhaps next time. You hear an evil laugh.",nil,nil,100); --cistern_-9
cisternList:add( position(431,844,-9),nil,"Das wird unser Biest aber traurig machen, dass du nicht abgestürzt bist. Vielleicht das nächste mal. Ein Böses Gelächter ertönt.","Our beast will be saddened you didn't fall, perhaps next time. You hear an evil laugh.",nil,nil,100); --cistern_-9
cisternList:add( position(444,844,-9),nil,"Plötzlich hörst du ein so ein lautes Gebrüll, dass Dreck von der Decke auf dich herabrieselt.","You suddenly hear a mighty roar that shakes the walls, causing debris to fall from above and rain down on you.",nil,nil,100); --cistern_-9
cisternList:add( position(440,846,-9),nil,"Ein Gebrüll wie du es noch nie zuvor gehört hast erschreckt dich fast zu Tode.","You are startled by another loud roar, from a beast the likes of which you've never heard before.",nil,nil,100); --cistern_-9
cisternList:add( position(437,844,-9),nil,"Die Säule neben dir beginnt auf einmal zu klappern und zu wackeln, als das Biest erneut brüllt.","The pillar near you suddenly begins to shake and rattle as you go by as the beast roars once again.",nil,nil,100); --cistern_-9
cisternList:add( position(452,849,-9),nil,"Als du den Raum betrittst ist der Gestank so überwältigend, dass du dich fast übergibst. Du musst all deinen Mut zusammen nehmen um weiter voranzuschreiten, aber niemand würde dich feige nennen ,wenn du dich umdrehen würdest um den anderen Weg zu nehmen.","When you walk in, you notice a stench to nearly make you double over and retch. It takes everything you have to move forward into the room, but nobody would blame you if you turned and walked the other way.",nil,nil,100); --cistern_-9
cisternList:add( position(427,839,-9),nil,"Die Reiter auf den Pferdestatuen vor dir scheinen Elfen zu sein, aber es wirkt so als ob sie dunkle Haut und weisse Haare haben.  Ihre Augen sind aus glühenden roten Edelsteinen gemacht. Unter den Statuen sind mehrere Drow Krieger zu sehen, welche in Gruppen Kampftechniken üben.","Ahead, the riders of the horse statues all look elven, but appear to have dark coloured skin and the hair has been dyed white. They all have piercing eyes made of a red gemstone, which glows throughout the room. Among the statues, you find more drow warriors, training in groups on battle strategies.",nil,nil,100); --cistern_-9
cisternList:add( position(426,839,-9),nil,"Die Reiter auf den Pferdestatuen vor dir scheinen Elfen zu sein, aber es wirkt so als ob sie dunkle Haut und weisse Haare haben.  Ihre Augen sind aus glühenden roten Edelsteinen gemacht. Unter den Statuen sind mehrere Drow Krieger zu sehen, welche in Gruppen Kampftechniken üben.","Ahead, the riders of the horse statues all look elven, but appear to have dark coloured skin and the hair has been dyed white. They all have piercing eyes made of a red gemstone, which glows throughout the room. Among the statues, you find more drow warriors, training in groups on battle strategies.",nil,nil,100); --cistern_-9
cisternList:add( position(425,839,-9),nil,"Die Reiter auf den Pferdestatuen vor dir scheinen Elfen zu sein, aber es wirkt so als ob sie dunkle Haut und weisse Haare haben.  Ihre Augen sind aus glühenden roten Edelsteinen gemacht. Unter den Statuen sind mehrere Drow Krieger zu sehen, welche in Gruppen Kampftechniken üben.","Ahead, the riders of the horse statues all look elven, but appear to have dark coloured skin and the hair has been dyed white. They all have piercing eyes made of a red gemstone, which glows throughout the room. Among the statues, you find more drow warriors, training in groups on battle strategies.",nil,nil,100); --cistern_-9
cisternList:add( position(477,839,-9),nil,"Als du dich umsiehst erkennst du Reihen von Schädeln an der Wand. Die Schädel an der nördlichen Wand haben rot glühende Augen, während die der im Osten Grün glühen.  Vielleicht birgt das Bild an der Wand des Schädel Rätsel's Lösung.","As you look around, you notice the skulls lining the walls. The ones on the northern wall have red glowing eyes while the eastern skulls' eyes glow green. Perhaps the picture on the wall holds the clue to these skulls?.",nil,nil,100); --cistern_-9
cisternList:add( position(480,837,-9),nil,"Als du dich umsiehst erkennst du Reihen von Schädeln an der Wand. Die Schädel an der nördlichen Wand haben rot glühende Augen, während die der im Osten Grün glühen.  Vielleicht birgt das Bild an der Wand des Schädel Rätsel's Lösung.","As you look around, you notice the skulls lining the walls. The ones on the northern wall have red glowing eyes while the eastern skulls' eyes glow green. Perhaps the picture on the wall holds the clue to these skulls?.",nil,nil,100); --cistern_-9

function MoveToField(Char)
	local this = getcistern(Char);
	if this then
		base.common.InformNLS(Char,this.german,this.english);
	end
end

function getcistern(Char)
	local pos = Char.pos;
	local dir = Char:getFaceTo();
	if cisternList[pos.x] and cisternList[pos.x][pos.y] and cisternList[pos.x][pos.y][pos.z] then
		local this = cisternList[pos.x][pos.y][pos.z];
		local list = {};
		for _,cistern in pairs(this) do
			local timeOk, monthOk, dirOk = false, false, false;
			for _,that in pairs(cistern.hours) do
				if that==world:getTime("hour") then
					timeOk = true;
					break;
				end
			end
			for _,that in pairs(cistern.months) do
				if that==world:getTime("month") then
					monthOk = true;
					break;
				end
			end
			for _,that in pairs(cistern.direction) do
				if that==dir then
					dirOk = true;
					break;
				end
			end
			if timeOk and monthOk and dirOk and math.random(0,99)<cistern.chance then --chance!
				table.insert(list,cistern);
			end
		end
		if table.getn(list)>0 then
			return list[math.random(1,table.getn(list))];
		end
	end
	return nil;
end
