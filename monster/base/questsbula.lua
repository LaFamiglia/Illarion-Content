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
--Generic 'Kill X monsters' quests by Estralis Seborian

module("monster.base.quests", package.seeall)

--TEMPLATE TO ADD A QUEST TO function iniQuests()

--local id=NUMBER; --ID of the quest
--germanTitle[id]="GERMAN TITLE"; --Title of the quest in german
--englishTitle[id]="ENGLISH TITLE"; --Title of the quest in english
--NPCName[id]="Miggs"; --This is the name of the NPC who gives out the quest
--statusId[id]=NUMBER; --the queststatus as used by the NPC
--germanRace[id]="stinkige Gullimumien"; --free description of the foes in german
--englishRace[id]="smelly sewer mummies"; --free description of the foes in english
--table.insert(questList[MONSTERID],id); --Insert the quest into the quest list of the monster race that has to be slain. You can add multiple monsters this way.
--minimumQueststatus[id]=NUMBER1; --quest is only active with this queststatus and above. Each monster slain adds +1. Use a value > 0!
--maximumQueststatus[id]=NUMBER2; --quest is finished if this queststatus is reached, no kill are counted anymore. Difference between NUMBER1 and NUMBER2 is the number of monsters that have to be slain
--questLocation[id]=position(X,Y,Z); --a position around which the monsters have to be slain, e.g. centre of a dungeon or forest
--radius[id]=RADIUS; --in this radius around the questlocation, kills are counted valid

--Comment: If you want an NPC to give out multiple quests, you can do it like this:

--Quest 1: To accept quest 1, set queststatus to 1 with the NPC. Use queststatus 1->11 to count 10 monsters. If the quest is finished, set queststatus to 12 with the NPC.
--Quest 2: To accept quest 2, set queststatus to 13 with the NPC. Use queststatus 13->18 to count 5 monsters. If the quest is finished, set queststatus to 19 with the NPC.
--Quest 3: To accept quest 3, set queststatus to 20 with the NPC. Use queststatus 20->21 to count 1 monster. If the quest is finished, set queststatus to 22 with the NPC.

function iniQuests()

    --Initilisation

    statusId={};
    germanTitle={};
    englishTitle={};
    NPCName={};
    germanRace={};
    englishRace={};
    questList={};
    minimumQueststatus={};
    maximumQueststatus={};
    questLocation={};
    radius={};

    questList[1]={}; --Human
    questList[2]={}; --Human Warrior
    questList[3]={}; --Human Mage
    questList[4]={}; --Human Necromancer
    questList[5]={}; --Human Thief
    questList[6]={}; --Friendly Human
    questList[11]={}; --Dwarf
    questList[12]={}; --Dwarven Warrior
    questList[13]={}; --Dwarven Priest
    questList[14]={}; --Dwarven Smith
    questList[15]={}; --Dwarven Hunter
    questList[16]={}; --Friendly Dwarf
    questList[21]={}; --Halfling
    questList[22]={}; --Halfling Warrior
    questList[23]={}; --Halfling Thief
    questList[24]={}; --Halfling Peasant
    questList[25]={}; --Halfling Hunter
    questList[26]={}; --Friendly Halfling
    questList[31]={}; --Elf
    questList[32]={}; --Elven Warrior
    questList[33]={}; --Elven Priest
    questList[34]={}; --Elven Mage
    questList[35]={}; --Elven Hunter
    questList[36]={}; --Friendly Elf
    questList[41]={}; --Orc
    questList[42]={}; --Orc Warrior
    questList[43]={}; --Orc Thief
    questList[44]={}; --Orc Hunter
    questList[45]={}; --Orc Shaman
    questList[46]={}; --Friendly Orc
    questList[51]={}; --Lizard
    questList[52]={}; --Lizard Temple Warrior
    questList[53]={}; --Lizard Mage
    questList[54]={}; --Lizard Priest
    questList[55]={}; --Lizard Thief
    questList[56]={}; --Friendly Lizard
    questList[61]={}; --Drow Archer
    questList[62]={}; --Drow Warrior
    questList[63]={}; --Drow Mage
    questList[64]={}; --Drow Priest
    questList[65]={}; --Drow Patriarch
    questList[71]={}; --Female Drow Archer
    questList[72]={}; --Female Drow Warrior
    questList[73]={}; --Female Drow Mage
    questList[74]={}; --Female Drow Priest
    questList[75]={}; --Drow Matriarch
    questList[91]={}; --Forest Troll
    questList[92]={}; --Forest Troll Warrior
    questList[93]={}; --Forest Troll Shaman
    questList[94]={}; --Forest Troll Hunter
    questList[95]={}; --Forest Troll Forester
    questList[96]={}; --Friendly Forest Troll
    questList[101]={}; --Mummy
    questList[102]={}; --Enbalmed Slave
    questList[103]={}; --Enbalmed Servant
    questList[104]={}; --Poisonous Mummy
    questList[106]={}; --Worker Mummy
    questList[107]={}; --Mummy of Madness
    questList[111]={}; --Skeleton
    questList[112]={}; --Scruffy Skeleton
    questList[113]={}; --Armored Skeleton
    questList[114]={}; --Crippled Skeleton
    questList[115]={}; --Mystic Skeleton
    questList[116]={}; --Friendly Skeleton
    questList[121]={}; --Gazer
    questList[122]={}; --Googly
    questList[123]={}; --Eye of Horror
    questList[124]={}; --Deadly Eye
    questList[125]={}; --Terror Eye
    questList[131]={}; --Shadow Eye
    questList[132]={}; --Eye of Darkness
    questList[141]={}; --Ghost Eye
    questList[142]={}; --Unholy Ghost Eye
    questList[143]={}; --Horrible Ghost Eye
    questList[151]={}; --Rotten Mummy
    questList[152]={}; --Smelly Mummy
    questList[171]={}; --Mummiefied Priest
    questList[172]={}; --Mummiefied Temple Servant
    questList[173]={}; --Mummiefied Highpriest
    questList[181]={}; --Sheep
    questList[182]={}; --Lamb
    questList[191]={}; --Rekrap Retep
    questList[192]={}; --Pitservant
    questList[193]={}; --Tarantula
    questList[195]={}; --SpiderQueen
    questList[196]={}; --Small Spider
    questList[201]={}; --Demon Skeleton
    questList[202]={}; --Mystic Demon Skeleton
    questList[203]={}; --Unholy Akolyth
    questList[204]={}; --Unholy Archmage
    questList[205]={}; --Lich
    questList[211]={}; --Firespider
    questList[221]={}; --Gynkese Widow
    questList[231]={}; --Kingsfright
    questList[232]={}; --Shadowmuncher
    questList[241]={}; --Pig
    questList[251]={}; --Boar
    questList[252]={}; --Young Boar
    questList[253]={}; --Hog
    questList[261]={}; --Nightmare Spider
    questList[262]={}; --Soulpain
    questList[271]={}; --Wasp
    questList[272]={}; --Hornet
    questList[273]={}; --Wasp Queen
    questList[274]={}; --Wasp Drone
    questList[278]={}; --Fire Wasp
    questList[301]={}; --Stone Golem
    questList[302]={}; --Son of the Mountains
    questList[311]={}; --Clay Golem
    questList[321]={}; --Lava Golem
    questList[331]={}; --Silver Golem
    questList[341]={}; --Diamond Golem
    questList[371]={}; --Cow
    questList[381]={}; --Bull
    questList[382]={}; --Young Bull
    questList[391]={}; --Wolf
    questList[392]={}; --Welp
    questList[393]={}; --Young Wolf
    questList[394]={}; --GiantWolf
    questList[395]={}; --Pack Leader
    questList[396]={}; --Peaceful Wolf
    questList[401]={}; --Ghost Wolf
    questList[411]={}; --Lambslaughterer
    questList[421]={}; --Grey Tail
    questList[431]={}; --Redwolf
    questList[491]={}; --Silverback
    questList[492]={}; --Young Silverback
    questList[501]={}; --Black Bear
    questList[502]={}; --Young Black Bear
    questList[511]={}; --Grizzly Bear
    questList[512]={}; --Young Grizzly Bear
    questList[521]={}; --Snapper
    questList[522]={}; --Terrorbeast
    questList[523]={}; --Scalebeast
    questList[524]={}; --Fireraptor
    questList[525]={}; --Rippertooth
    questList[531]={}; --Walking Dead
    questList[532]={}; --Limping Zombie
    questList[533]={}; --Zombie
    questList[534]={}; --Zombiegiant
    questList[541]={}; --Crippled Deamonbeast
    questList[542]={}; --Deamonbeast
    questList[543]={}; --Giant Deamonbeast
    questList[551]={}; --Imp
    questList[552]={}; --Jack of all Imps
    questList[553]={}; --Cursed Imp
    questList[561]={}; --Iron Golem
    questList[562]={}; --Steelgolem
    questList[571]={}; --Nuzzler
    questList[572]={}; --Baiter
    questList[581]={}; --Dog
    questList[582]={}; --Vicious Dog
    questList[583]={}; --Watchdog
    questList[584]={}; --Docile Stray Dog
    questList[591]={}; --Peaceful Beetle
    questList[592]={}; --Hunter Beetle
    questList[593]={}; --Scarab
    questList[594]={}; --Coffin Crawler
    questList[601]={}; --Foxwhelp
    questList[602]={}; --Redfox
    questList[603]={}; --Fox Mother
    questList[604]={}; --Fireridge
    questList[611]={}; --Stinky Slime
    questList[612]={}; --Slimey Slime
    questList[613]={}; --Smouldy Slime
    questList[614]={}; --Cauterizing Slime
    questList[621]={}; --Chicken
    questList[622]={}; --Angry Chicken
    questList[631]={}; --Bone Dragon
    questList[641]={}; --Black Dragonskeleton
    questList[651]={}; --Undead Firedragon
    questList[661]={}; --Nightmare Dragon
    questList[671]={}; --Undead Swampdragon
    questList[681]={}; --Shiny Deathdragon
    questList[691]={}; --Golden Bonedragon
    questList[701]={}; --Chergas Servant
    questList[711]={}; --Palace Guard
    questList[721]={}; --Forgotten Mummy
    questList[731]={}; --Dead King
    questList[741]={}; --Phantomskeleton
    questList[742]={}; --Bone Schemes
    questList[743]={}; --Bone Ghost
    questList[744]={}; --Phantom Archer
    questList[751]={}; --Graveguard
    questList[752]={}; --Mystic Graveguard
    questList[753]={}; --Graveguard Archer
    questList[754]={}; --Ancient Graveguard
    questList[761]={}; --Armored Swamphorror
    questList[762]={}; --Crippled Swamphorror
    questList[763]={}; --Scruffy Swamphorror
    questList[764]={}; --Mystic Swamphorror
    questList[782]={}; --Golden Legionnaire
    questList[783]={}; --Golden Magus
    questList[784]={}; --Golden Archer
    questList[791]={}; --Bridge Troll
    questList[792]={}; --Bridge Troll Shaman
    questList[801]={}; --Mountain Troll
    questList[802]={}; --Mountain Troll Archer
    questList[811]={}; --Firespitter
    questList[812]={}; --Keeper of fire
    questList[821]={}; --Bog Body
    questList[822]={}; --Ragged Bog Body
    questList[831]={}; --Poltergeist
    questList[832]={}; --Horrible Poltergeist
    questList[841]={}; --Coffinguard
    questList[842]={}; --Undead Warlock
    questList[851]={}; --Shadowrunner
    questList[852]={}; --Shadowfright
    questList[853]={}; --Giant Shadowrunner
    questList[861]={}; --Crippled Ghostbeast
    questList[862]={}; --Ghostbeast
    questList[863]={}; --Giant Ghostbeast
    questList[871]={}; --Crippled Swampbeast
    questList[872]={}; --Swampbeast
    questList[873]={}; --Giant Swampbeast
    questList[881]={}; --Bloodhunter
    questList[882]={}; --Monstrosity
    questList[883]={}; --Bloodsniffler
    questList[891]={}; --Fire Imp
    questList[892]={}; --Cures Fire Imp
    questList[893]={}; --Mystic Fire Imp
    questList[901]={}; --Shadow Wimp
    questList[902]={}; --Shadow Imp
    questList[903]={}; --Shadow Dancer
    questList[911]={}; --Merinium Golem
    questList[912]={}; --Gold Golem
    questList[921]={}; --Sewer Rat
    questList[922]={}; --Giant Sewer Rat
    questList[931]={}; --Contaminated Ratchild
    questList[932]={}; --Contaminated Ratman
    questList[941]={}; --Crazy Rat Alchemist
    questList[942]={}; --Ratpriest
    questList[951]={}; --Attack Dog
    questList[961]={}; --Hounrin
    questList[962]={}; --Young Hounrin
    questList[971]={}; --Orchound
    questList[972]={}; --Young Orchound
    questList[981]={}; --Corpseeater
    questList[991]={}; --Copperling
    questList[1001]={}; --Graveraper
    questList[1011]={}; --Bonescraper
    questList[1021]={}; --Grey Fox
    questList[1022]={}; --Young Grey Fox
    questList[1031]={}; --Bloodslime
    questList[1032]={}; --Wandering Pool of Blood
    questList[1033]={}; --Wandering Demonblood
    questList[1041]={}; --Wandering Garbage
    questList[1042]={}; --Wandering Sewage
    questList[1043]={}; --Corpsebile
    questList[1051]={}; --Ectoplasm
    questList[1052]={}; --Malicious Ectoplasm
    questList[1053]={}; --Doomed Ectoplasm
    questList[1061]={}; --Brown Chicken
    questList[1071]={}; --Crazy Chicken
    questList[1081]={}; --Black Chicken
    questList[2000]={}; --Guards


		--Quest 50: Spy Informant
    local id=50;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[271],id); --All wasps
	table.insert(questList[272],id); --All wasps
	table.insert(questList[273],id); --All wasps
	table.insert(questList[274],id); --All wasps
	table.insert(questList[278],id); --All wasps
    minimumQueststatus[id]=1;
    maximumQueststatus[id]=5;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 51: Spy Informant
    local id=51;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[271],id); --All wasps
	table.insert(questList[272],id); --All wasps
	table.insert(questList[273],id); --All wasps
	table.insert(questList[274],id); --All wasps
	table.insert(questList[278],id); --All wasps
    minimumQueststatus[id]=6;
    maximumQueststatus[id]=14;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 52: Spy Informant
    local id=52;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[271],id); --All wasps
	table.insert(questList[272],id); --All wasps
	table.insert(questList[273],id); --All wasps
	table.insert(questList[274],id); --All wasps
	table.insert(questList[278],id); --All wasps
    minimumQueststatus[id]=15;
    maximumQueststatus[id]=27;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 53: Spy Informant
    local id=53;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[611],id); -- all slimes
    table.insert(questList[612],id); -- all slimes
    table.insert(questList[613],id); -- all slimes
    table.insert(questList[614],id); -- all slimes
    table.insert(questList[1031],id); -- all slimes
	table.insert(questList[1032],id); -- all slimes
	table.insert(questList[1033],id); -- all slimes
    table.insert(questList[1041],id); -- all slimes
	table.insert(questList[1042],id); -- all slimes
	table.insert(questList[1043],id); -- all slimes
    table.insert(questList[1051],id); -- all slimes
	table.insert(questList[1052],id); -- all slimes
	table.insert(questList[1053],id); -- all slimes
    minimumQueststatus[id]=28;
    maximumQueststatus[id]=32;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 54: Spy Informant
    local id=54;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[611],id); -- all slimes
    table.insert(questList[612],id); -- all slimes
    table.insert(questList[613],id); -- all slimes
    table.insert(questList[614],id); -- all slimes
    table.insert(questList[1031],id); -- all slimes
	table.insert(questList[1032],id); -- all slimes
	table.insert(questList[1033],id); -- all slimes
    table.insert(questList[1041],id); -- all slimes
	table.insert(questList[1042],id); -- all slimes
	table.insert(questList[1043],id); -- all slimes
    table.insert(questList[1051],id); -- all slimes
	table.insert(questList[1052],id); -- all slimes
	table.insert(questList[1053],id); -- all slimes
    minimumQueststatus[id]=33;
    maximumQueststatus[id]=41;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 55: Spy Informant
    local id=55;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Wespen";
    englishRace[id]="wasps";
	table.insert(questList[611],id); -- all slimes
    table.insert(questList[612],id); -- all slimes
    table.insert(questList[613],id); -- all slimes
    table.insert(questList[614],id); -- all slimes
    table.insert(questList[1031],id); -- all slimes
	table.insert(questList[1032],id); -- all slimes
	table.insert(questList[1033],id); -- all slimes
    table.insert(questList[1041],id); -- all slimes
	table.insert(questList[1042],id); -- all slimes
	table.insert(questList[1043],id); -- all slimes
    table.insert(questList[1051],id); -- all slimes
	table.insert(questList[1052],id); -- all slimes
	table.insert(questList[1053],id); -- all slimes
    minimumQueststatus[id]=42;
    maximumQueststatus[id]=54;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 56: Spy Informant
    local id=56;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Hunde";
    englishRace[id]="dogs";
	table.insert(questList[581],id); --All dogs
	table.insert(questList[582],id); --All dogs
	table.insert(questList[583],id); --All dogs
	table.insert(questList[584],id); --All dogs
	table.insert(questList[951],id); --All dogs
	table.insert(questList[961],id); --All dogs
	table.insert(questList[962],id); --All dogs
	table.insert(questList[971],id); --All dogs
	table.insert(questList[972],id); --All dogs
    minimumQueststatus[id]=55;
    maximumQueststatus[id]=59;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
				--Quest 57: Spy Informant
    local id=57;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Hunde";
    englishRace[id]="dogs";
	table.insert(questList[581],id); --All dogs
	table.insert(questList[582],id); --All dogs
	table.insert(questList[583],id); --All dogs
	table.insert(questList[584],id); --All dogs
	table.insert(questList[951],id); --All dogs
	table.insert(questList[961],id); --All dogs
	table.insert(questList[962],id); --All dogs
	table.insert(questList[971],id); --All dogs
	table.insert(questList[972],id); --All dogs
    minimumQueststatus[id]=60;
    maximumQueststatus[id]=68;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 58: Spy Informant
    local id=58;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Hunde";
    englishRace[id]="dogs";
	table.insert(questList[581],id); --All dogs
	table.insert(questList[582],id); --All dogs
	table.insert(questList[583],id); --All dogs
	table.insert(questList[584],id); --All dogs
	table.insert(questList[951],id); --All dogs
	table.insert(questList[961],id); --All dogs
	table.insert(questList[962],id); --All dogs
	table.insert(questList[971],id); --All dogs
	table.insert(questList[972],id); --All dogs
    minimumQueststatus[id]=69;
    maximumQueststatus[id]=81;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 60: Spy Informant
    local id=60;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="F�chse";
    englishRace[id]="foxes";
	table.insert(questList[601],id); --All foxes
	table.insert(questList[602],id); --All foxes
	table.insert(questList[603],id); --All foxes
	table.insert(questList[604],id); --All foxes
	table.insert(questList[1021],id); --All foxes
	table.insert(questList[1022],id); --All foxes
    minimumQueststatus[id]=87;
    maximumQueststatus[id]=95;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 61: Spy Informant
    local id=61;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="F�chse";
    englishRace[id]="foxes";
	table.insert(questList[601],id); --All foxes
	table.insert(questList[602],id); --All foxes
	table.insert(questList[603],id); --All foxes
	table.insert(questList[604],id); --All foxes
	table.insert(questList[1021],id); --All foxes
	table.insert(questList[1022],id); --All foxes
    minimumQueststatus[id]=96;
    maximumQueststatus[id]=108;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
		--Quest 62: Spy Informant
    local id=62;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="ratten";
    englishRace[id]="rats";
	table.insert(questList[921],id; -- all rats
	table.insert(questList[922],id); --all rats
	table.insert(questList[931],id); --all rats
	table.insert(questList[932],id); --all rats
	table.insert(questList[941],id); --all rats
	table.insert(questList[942],id); --all rats
    minimumQueststatus[id]=109;
    maximumQueststatus[id]=113;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 63: Spy Informant
    local id=63;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="ratten";
    englishRace[id]="rats";
	table.insert(questList[921],id; -- all rats
	table.insert(questList[922],id); --all rats
	table.insert(questList[931],id); --all rats
	table.insert(questList[932],id); --all rats
	table.insert(questList[941],id); --all rats
	table.insert(questList[942],id); --all rats
    minimumQueststatus[id]=114;
    maximumQueststatus[id]=122;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 64: Spy Informant
    local id=64;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="ratten";
    englishRace[id]="rats";
	table.insert(questList[921],id; -- all rats
	table.insert(questList[922],id); --all rats
	table.insert(questList[931],id); --all rats
	table.insert(questList[932],id); --all rats
	table.insert(questList[941],id); --all rats
	table.insert(questList[942],id); --all rats
    minimumQueststatus[id]=123;
    maximumQueststatus[id]=135;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 65: Spy Informant
    local id=65;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Barin";
    englishRace[id]="bears";
	table.insert(questList[491],id; -- all bears
	table.insert(questList[492],id); --all bears
	table.insert(questList[501],id); --all bears
	table.insert(questList[502],id); --all bears
	table.insert(questList[511],id); --all bears
	table.insert(questList[512],id); --all bears
    minimumQueststatus[id]=136;
    maximumQueststatus[id]=140;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 66: Spy Informant
    local id=66;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Barin";
    englishRace[id]="bears";
	table.insert(questList[491],id; -- all bears
	table.insert(questList[492],id); --all bears
	table.insert(questList[501],id); --all bears
	table.insert(questList[502],id); --all bears
	table.insert(questList[511],id); --all bears
	table.insert(questList[512],id); --all bears
    minimumQueststatus[id]=141;
    maximumQueststatus[id]=149;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 67: Spy Informant
    local id=67;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="Barin";
    englishRace[id]="bears";
	table.insert(questList[491],id; -- all bears
	table.insert(questList[492],id); --all bears
	table.insert(questList[501],id); --all bears
	table.insert(questList[502],id); --all bears
	table.insert(questList[511],id); --all bears
	table.insert(questList[512],id); --all bears
    minimumQueststatus[id]=150;
    maximumQueststatus[id]=162;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 68: Spy Informant
    local id=68;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="trolle";
    englishRace[id]="trolls";
	table.insert(questList[91]],id; --all trolls
	table.insert(questList[92],id); --all trolls
	table.insert(questList[93],id); --all trolls
	table.insert(questList[94],id); --all trolls
	table.insert(questList[95],id); --all trolls
	table.insert(questList[96],id); --all trolls
    minimumQueststatus[id]=163;
    maximumQueststatus[id]=167;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 69: Spy Informant
    local id=69;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="trolle";
    englishRace[id]="trolls";
	table.insert(questList[91]],id; --all trolls
	table.insert(questList[92],id); --all trolls
	table.insert(questList[93],id); --all trolls
	table.insert(questList[94],id); --all trolls
	table.insert(questList[95],id); --all trolls
	table.insert(questList[96],id); --all trolls
    minimumQueststatus[id]=168;
    maximumQueststatus[id]=176;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
	
			--Quest 70: Spy Informant
    local id=70;
    germanTitle[id]="Spitzel Informant";
    englishTitle[id]="Spy Informant";
    NPCName[id]="Bula Glasha";
    statusId[id]=181;
    germanRace[id]="trolle";
    englishRace[id]="trolls";
	table.insert(questList[91]],id; --all trolls
	table.insert(questList[92],id); --all trolls
	table.insert(questList[93],id); --all trolls
	table.insert(questList[94],id); --all trolls
	table.insert(questList[95],id); --all trolls
	table.insert(questList[96],id); --all trolls
    minimumQueststatus[id]=177;
    maximumQueststatus[id]=189;	
	questLocation[id]=position(514, 178, 0);
    radius[id]=250;
end


function checkQuest(User,Monster)

    local MonID = Monster:getMonsterType();
    local qList = questList[MonID];
    local queststatus = 0;

    if qList then

        for _,quest in pairs(qList) do

            queststatus = User:getQuestProgress(statusId[quest]);

            if (queststatus >= minimumQueststatus[quest]) and (queststatus < maximumQueststatus[quest]) and (User:isInRangeToPosition(questLocation[quest],radius[quest])) and (User:isInRange(Monster,12)) then --valid kill

                User:setQuestProgress(statusId[quest],queststatus+1);

                if ((queststatus+1) == (maximumQueststatus[quest])) then --quest finished

                    base.common.InformNLS(User,"[Queststatus] "..germanTitle[quest]..": Du hast "..(queststatus+1-minimumQueststatus[quest]).." von "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..germanRace[quest].." besiegt. Kehre zu "..NPCName[quest].." zur�ck, um deine Belohnung zu erhalten." ,"[Quest status] "..englishTitle[quest]..": You have slain "..(queststatus+1-minimumQueststatus[quest]).." of "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..englishRace[quest]..". Return to "..NPCName[quest].." to claim your reward.");

                else --quest not finished

                    base.common.InformNLS(User,"[Queststatus] "..germanTitle[quest]..": Du hast "..(queststatus+1-minimumQueststatus[quest]).." von "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..germanRace[quest].." besiegt." ,"[Quest status] "..englishTitle[quest]..": You have slain "..(queststatus+1-minimumQueststatus[quest]).." of "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..englishRace[quest]..".");

                end
            end
        end
    end
end



