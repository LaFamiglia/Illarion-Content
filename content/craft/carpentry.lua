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
local crafts = require("item.base.crafts")

module("content.craft.carpentry", package.seeall)

carpentry = crafts.Craft:new{
              craftEN = "Carpentry",
              craftDE = "Schreinern",
              handTool = 2715,
              leadSkill = Character.carpentry,
              defaultFoodConsumption = 200,
              sfx = 14,
              sfxDuration = 17,
            }

carpentry:addTool(724) -- workbench
carpentry:addTool(725) -- workbench

--------------------------------------------------------------------------------------------
local catId = carpentry:addCategory("Tools", "Werkzeuge") -- Tools and Other Items

--Peel
local product = carpentry:addProduct(catId, 121, 21, 41, 20, 40)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Bucket
product = carpentry:addProduct(catId, 51, 18, 38, 27, 54)
product:addIngredient(2716, 3) -- Apple Wooden Boards: 3x1

--Candle Mould
product = carpentry:addProduct(catId, 429, 15, 35, 18, 36)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Wooden Shovel
product = carpentry:addProduct(catId, 312, 12, 32, 16, 32)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Nailboard
product = carpentry:addProduct(catId, 2659, 10, 30, 14, 28)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2738) -- Nails: 1x1

--Cooking Spoon
product = carpentry:addProduct(catId, 227, 9, 29, 7, 14)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Comb
product = carpentry:addProduct(catId, 2719, 6, 26, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Slicer
product = carpentry:addProduct(catId, 2715, 0, 20, 10, 20)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2535) -- Iron Ingot: 1x1


catId = carpentry:addCategory("Tableware", "Tischgeschirr") --tableware

--Wooden Cup
product = carpentry:addProduct(catId, 2185, 3, 23, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Plate
product = carpentry:addProduct(catId, 2952, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Bowl
product = carpentry:addProduct(catId, 2935, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1


catId = carpentry:addCategory("Bows", "B�gen") --bows

--Crossbow
product = carpentry:addProduct(catId, 70, 99, 100, 250, 500)
product:addIngredient(546, 6) -- Naldor Wooden Boards: 6x1
product:addIngredient(2717, 2) -- pins and cotters 2x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2535) -- Iron Ingots: 1x1
product:addIngredient(283, 2) -- Blackstone 2x1
product:addIngredient(2571) -- Merinium Ingot 1x1
product:addIngredient(2552); -- Pure Earth 1x1
product:addIngredient(2551) -- Pure Air: 1x1

--Elven Composite Longbow
product = carpentry:addProduct(catId, 2718, 90, 100, 154, 308)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2571,2); -- Merinium Ingot 2x1
product:addIngredient(448, 2); -- Emerald Powder
product:addIngredient(284); -- Sapphire
product:addIngredient(2551) -- Pure Air: 1x1

-- elven shortbow
product = carpentry:addProduct(catId, 2685, 80, 100, 150, 300, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(545, 2); -- Cherry Wood Boards
product:addIngredient(2716, 1); -- Deciduous Wood Board
product:addIngredient(50, 2); -- Thread
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(448, 2); -- Emerald Powder
product:addIngredient(284); -- Sapphire
product:addIngredient(197); -- Amethyst

-- ebony wood bow
product = carpentry:addProduct(catId, 2780, 70, 90, 135, 270, 1);
product:addIngredient(546, 4); -- Naldor Wood Board
product:addIngredient(545, 3); -- Cherry Wood Boards
product:addIngredient(50, 3); -- Thread
product:addIngredient(45, 2); -- Emerald

-- long bow
product = carpentry:addProduct(catId, 2708, 68, 88, 132, 264, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(2716, 3); -- Deciduous Wood Boards
product:addIngredient(50, 4); -- Thread
product:addIngredient(283, 1); -- Blackstone

-- fire hunter's bow
product = carpentry:addProduct(catId, 2727, 58, 78, 117, 234, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards
product:addIngredient(545, 1); -- Cherry Wood Boards
product:addIngredient(50, 2); -- Thread
product:addIngredient(447); -- Ruby Powder

-- hunting bow
product = carpentry:addProduct(catId, 2714, 40, 60, 90, 180, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(2716, 2); -- Deciduous Wood Boards
product:addIngredient(50, 2); -- Thread

-- serinjah-rider's bow
product = carpentry:addProduct(catId, 2646, 30, 50, 75, 150, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(545, 1); -- Cherry Wood Boards
product:addIngredient(50, 2); -- Thread

-- short bow
product = carpentry:addProduct(catId, 65, 10, 30, 45, 90, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(50, 2); -- Thread


catId = carpentry:addCategory("Instruments", "Instrumente") --instruments

--Harp
product = carpentry:addProduct(catId, 332, 60, 70, 136, 272)
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(50, 3) -- Thread: 3x1

--Lute
product = carpentry:addProduct(catId, 335, 50, 60, 60, 120)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(50, 2) -- Thread: 2x1

--Drum
product = carpentry:addProduct(catId, 533, 40, 50, 48, 96)
product:addIngredient(2543, 2) -- Conifer Wooden Boards: 2x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Panpipe
product = carpentry:addProduct(catId, 532, 30, 40, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Flute
product = carpentry:addProduct(catId, 90, 20, 30, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Horn
product = carpentry:addProduct(catId, 333, 10, 20, 14, 28)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1


catId = carpentry:addCategory("Shields", "Schilde") --shields

--Mosaic shield
product = carpentry:addProduct(catId, 2447, 99, 100, 500, 756)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(2553) -- Pure fire
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2571,2) -- Merinium Ingot 2x1


--Cloud Shield
product = carpentry:addProduct(catId, 2439, 99, 100, 480, 960)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2554) -- Pure Water: 1x1
product:addIngredient(285, 5) -- Diamond: 5x1
product:addIngredient(2571,2) -- Merinium Ingot 2x1

-- shield of the sky
product = carpentry:addProduct(catId, 2284, 96, 100, 174, 348, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards
product:addIngredient(2716, 3); -- Deciduous Wood Boards
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2535, 1); -- Iron Ingot
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(45); -- Emerald
product:addIngredient(104); -- Silver Ingots

-- ornate tower shield
product = carpentry:addProduct(catId, 916, 94, 100, 171, 342, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards
product:addIngredient(2716, 4); -- Deciduous Wood Boards
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2535, 2); -- Iron Ingot
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2552); -- Pure earth

-- steel tower shield
product = carpentry:addProduct(catId, 96, 91, 100, 166, 333, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards
product:addIngredient(545, 4); -- Cherry Wood Boards
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2535, 2); -- Iron Ingot
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2554); -- Pure Water

-- heraldic shield
product = carpentry:addProduct(catId, 95, 87, 100, 160, 321, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(545, 3); -- Cherry Wood Boards
product:addIngredient(2716, 1); -- Deciduous Wood Boards
product:addIngredient(2547, 2); -- Leather
product:addIngredient(2535, 3); -- Iron Ingot
product:addIngredient(284); -- Sapphire

-- legionnaire's tower shield
product = carpentry:addProduct(catId, 2448, 82, 100, 153, 306, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(545, 3); -- Cherry Wood Boards
product:addIngredient(2716, 1); -- Deciduous Wood Boards
product:addIngredient(2547, 2); -- Leather
product:addIngredient(2535, 2); -- Iron Ingot
product:addIngredient(198); -- Topaz

-- red steel shield
product = carpentry:addProduct(catId, 2388, 76, 96, 144, 288, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards
product:addIngredient(2716, 2); -- Deciduous Wood Boards
product:addIngredient(2547, 2); -- Leather
product:addIngredient(2535, 2); -- Iron Ingot

-- round metal shield
product = carpentry:addProduct(catId, 186, 62, 82, 123, 246, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(545, 2); -- Cherry Wood Boards
product:addIngredient(2547, 2); -- Leather
product:addIngredient(2535, 1); -- Iron Ingot

-- knight shield
product = carpentry:addProduct(catId, 20, 54, 74, 111, 222, 1);
product:addIngredient(2543, 5); -- Conifer Wooden Boards
product:addIngredient(2716, 2); -- Deciduous Wood Boards
product:addIngredient(2547, 1); -- Leather
product:addIngredient(2535, 1); -- Iron Ingot

-- metal shield
product = carpentry:addProduct(catId, 19, 45, 65, 97, 195, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards
product:addIngredient(2716, 1); -- Deciduous Wood Boards
product:addIngredient(2547, 1); -- Leather
product:addIngredient(2535, 2); -- Iron Ingot

-- cursed shield
product = carpentry:addProduct(catId, 917, 35, 55, 82, 165, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards
product:addIngredient(2547, 1); -- Leather
product:addIngredient(2535, 1); -- Iron Ingot

-- light shield
product = carpentry:addProduct(catId, 18, 20, 40, 60, 120, 1);
product:addIngredient(2543, 3); -- Conifer Wood Boards
product:addIngredient(2547, 1); -- Leather
product:addIngredient(2535, 1); -- Iron

-- wooden shield
product = carpentry:addProduct(catId, 17, 15, 35, 52, 105, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(545, 1); -- Cherry Wood Boards
product:addIngredient(2547, 1); -- Leather

-- small wooden shield
product = carpentry:addProduct(catId, 2445, 0, 20, 30, 60, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards


catId = carpentry:addCategory("Greaves", "Beinschienen")

-- hardwood greaves
product = carpentry:addProduct(catId, 2193, 36, 56, 84, 168, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(545, 3); -- Cherry Wood Boards
product:addIngredient(176, 2); -- Grey Cloth

-- short hardwood greaves
product = carpentry:addProduct(catId, 2194, 16, 36, 54, 108, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(176, 1); -- Grey Cloth
