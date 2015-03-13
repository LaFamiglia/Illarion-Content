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

module("content.craft.tailoring", package.seeall)

tailoring = crafts.Craft:new{
                      craftEN = "Tailoring",
                      craftDE = "Schneidern",
                      handTool = 47,
                      leadSkill = Character.tailoring,
                      defaultFoodConsumption = 300,
                    }

tailoring:addTool(102) -- tailoring table
tailoring:addTool(103) -- tailoring table


catId = tailoring:addCategory("Hats", "H�te") --headware

--Expensive Wizard Hat
product = tailoring:addProduct(catId, 371, 76, 96, 264, 528)
product:addIngredient(177, 2) -- Yellow Cloth: 2x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(198) -- Topas: 1x1

--Colourful Wizard Hat
product = tailoring:addProduct(catId, 370, 71, 91, 207, 414)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(198) -- Topas: 1x1

--Blue wizard hat
product = tailoring:addProduct(catId, 357, 67, 87, 132, 264)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(284,2) -- Sapphire: 2x1

--Red Wizard Hat
product = tailoring:addProduct(catId, 358, 62, 82, 120, 240)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(46) -- Ruby: 1x1

--Blue hat with Feather
product = tailoring:addProduct(catId, 828, 58, 78, 95, 190)
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(179, 2) -- Blue Cloth: 2x1
product:addIngredient(284) -- Sapphire: 1x1

--Yellow Hat with Feather
product = tailoring:addProduct(catId, 829, 53, 73, 90, 180)
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(177, 2) -- Yellow Cloth: 2x1
product:addIngredient(198) -- Topaz: 1x1

--Red Hat with Feather
product = tailoring:addProduct(catId, 832, 49, 69, 85, 170)
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(174, 3) -- Red Cloth: 3x1

--Green Hat with Feather
product = tailoring:addProduct(catId, 831, 44, 64, 80, 160)
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(54, 3) -- Green Cloth: 3x1

--Grey Hat with feather
product = tailoring:addProduct(catId, 830, 40, 60, 75, 150)
product:addIngredient(176, 2) -- Grey Cloth: 2x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(175) -- Black Cloth: 1x1

--Slouch Hat
product = tailoring:addProduct(catId, 356, 10, 30, 45, 90, 1);
product:addIngredient(2547, 2); -- Leather
product:addIngredient(50); -- Thread


catId = tailoring:addCategory("Dresses", "Kleider") -- Dresses

--Blue Red Heraldic Dress
product = tailoring:addProduct(catId, 846, 47, 67, 160, 320)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(174, 2) -- Red Cloth: 2x1

--Blue Green Heraldic Dress
product = tailoring:addProduct(catId, 845, 46, 66, 160, 320)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(54, 2) -- Green Cloth: 2x1

--Yellow Blue Heraldic Dress
product = tailoring:addProduct(catId, 847, 45, 65, 160, 320)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(179, 2) -- Blue Cloth: 2x1

--Yellow Green Heraldic Dress
product = tailoring:addProduct(catId, 848, 43, 63, 160, 320)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(54, 2) -- Green Cloth: 2x1

--Red Yellow Heraldic Dress
product = tailoring:addProduct(catId, 849, 41, 61, 150, 300)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(177, 2) -- Yellow Cloth: 2x1

--Black Red Heraldic Dress
product = tailoring:addProduct(catId, 851, 39, 59, 150, 300)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(174, 2) -- Red Cloth: 2x1

--White Heraldic Dress
product = tailoring:addProduct(catId, 852, 38, 58, 140, 280)
product:addIngredient(178, 5) -- White Cloth: 5x1
product:addIngredient(50, 5*2) -- Thread: 5x2

--Grey Heraldic Dress
product = tailoring:addProduct(catId, 850, 36, 56, 140, 280)
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(50, 5*2) -- Thread: 5x2

--Blue Dress
product = tailoring:addProduct(catId, 800, 34, 54, 78, 156)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Blue Dress
product = tailoring:addProduct(catId, 833, 32, 52, 78, 156)
product:addIngredient(175, 2) -- Black Cloth: 2x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(179) -- Blue Cloth: 1x1

--Blue Dress
product = tailoring:addProduct(catId, 385, 29, 49, 72, 144)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Grey Dress
product = tailoring:addProduct(catId, 835, 27, 47, 72, 144)
product:addIngredient(175, 2) -- Black Cloth: 2x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(176) -- Grey Cloth: 1x1

--Black Yellow Dress
product = tailoring:addProduct(catId, 834, 23, 43, 66, 132)
product:addIngredient(175, 2) -- Black Cloth: 2x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(177) -- Yellow Cloth: 1x1

--Yellow Dress
product = tailoring:addProduct(catId, 801, 21, 41, 60, 120)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Red Dress
product = tailoring:addProduct(catId, 837, 18, 38, 54, 108)
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(174, 2) -- Red Cloth: 2x1

--Red Dress
product = tailoring:addProduct(catId, 804, 16, 36, 54, 108)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black White Dress
product = tailoring:addProduct(catId, 838, 15, 35, 54, 108)
product:addIngredient(178) -- White Cloth: 1x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(175, 2) -- Black Cloth: 2x1

--Black Dress
product = tailoring:addProduct(catId, 805, 13, 33, 48, 96)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Green Dress
product = tailoring:addProduct(catId, 836, 9, 29, 42, 84)
product:addIngredient(54, 2) -- Green Cloth: 2x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(175) -- Black Cloth: 1x1

--Green Dress
product = tailoring:addProduct(catId, 803, 7, 27, 42, 84)
product:addIngredient(54, 3) -- Green Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--White Dress
product = tailoring:addProduct(catId, 806, 4, 24, 36, 72)
product:addIngredient(178, 3) -- White Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Grey Dress
product = tailoring:addProduct(catId, 802, 0, 20, 30, 60)
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2


catId = tailoring:addCategory("Skirts", "R�cke") -- Skirts

--Blue White Skirt
product = tailoring:addProduct(catId, 839, 30, 50, 72, 144)
product:addIngredient(179, 2) -- Blue Cloth: 2x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(178) -- White Cloth: 1x1

--Yellow White Skirt
product = tailoring:addProduct(catId, 840, 25, 45, 44, 88)
product:addIngredient(177) -- Yellow Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(178) -- White Cloth: 1x1

--Red White Skirt
product = tailoring:addProduct(catId, 843, 20, 40, 40, 80)
product:addIngredient(174) -- Red Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(178) -- White Cloth: 1x1

--Black White Skirt
product = tailoring:addProduct(catId, 844, 11, 31, 32, 64)
product:addIngredient(178) -- White Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(175) -- Black Cloth: 1x1

--Green White Skirt
product = tailoring:addProduct(catId, 842, 5, 25, 24, 48)
product:addIngredient(178) -- White Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(54) -- Green Cloth: 1x1

--Grey White Skirt
product = tailoring:addProduct(catId, 841, 2, 22, 20, 40)
product:addIngredient(176) -- Grey Cloth: 1x1
product:addIngredient(50, 2*2) -- Thread: 2x2
product:addIngredient(178) -- White Cloth: 1x1


catId = tailoring:addCategory("Clothes", "Kleidung") --Man clothes

--Blue Doublet
product = tailoring:addProduct(catId, 807, 48, 68, 136, 272)
product:addIngredient(179, 4) -- Blue Cloth: 4x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Blue Shirt
product = tailoring:addProduct(catId, 181, 46, 66, 96, 192)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Blue Tunic
product = tailoring:addProduct(catId, 814, 43, 63, 128, 256)
product:addIngredient(179, 4) -- Blue Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(2550) -- Copper Ingot: 1x1

--Yellow Tunic
product = tailoring:addProduct(catId, 815, 40, 60, 120, 240)
product:addIngredient(177, 4) -- Yellow Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(2550) -- Copper Ingot: 1x1

--Yellow Doublet
product = tailoring:addProduct(catId, 808, 38, 58, 98, 196)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Yellow Shirt
product = tailoring:addProduct(catId, 458, 35, 55, 84, 168)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Red Tunic
product = tailoring:addProduct(catId, 818, 33, 53, 104, 208)
product:addIngredient(174, 4) -- Red Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(2550) -- Copper Ingot: 1x1

--Red Doublet
product = tailoring:addProduct(catId, 811, 30, 50, 84, 168)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Red Shirt
product = tailoring:addProduct(catId, 180, 27, 47, 72, 144)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Tunic
product = tailoring:addProduct(catId, 819, 25, 45, 77, 154)
product:addIngredient(175, 4) -- Black Cloth: 4x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(2550) -- Copper Ingot: 1x1

--Black Doublet
product = tailoring:addProduct(catId, 812, 22, 42, 70, 140)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Shirt
product = tailoring:addProduct(catId, 182, 19, 39, 60, 120)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Green Tunic
product = tailoring:addProduct(catId, 817, 17, 37, 72, 144)
product:addIngredient(54, 4) -- Green Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--Green Doublet
product = tailoring:addProduct(catId, 810, 14, 34, 56, 112)
product:addIngredient(54, 3) -- Green Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Green Shirt
product = tailoring:addProduct(catId, 457, 12, 32, 48, 96)
product:addIngredient(54, 3) -- Green Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--White Doublet
product = tailoring:addProduct(catId, 813, 9, 29, 49, 98)
product:addIngredient(178, 3) -- White Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--White Tunic
product = tailoring:addProduct(catId, 820, 6, 26, 48, 96)
product:addIngredient(178, 4) -- White Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(2550) -- Copper Ingot: 1x1

--Grey Doublet
product = tailoring:addProduct(catId, 809, 4, 24, 42, 84)
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Grey Tunic
product = tailoring:addProduct(catId, 816, 1, 21, 40, 80)
product:addIngredient(176, 4) -- Grey Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(2550) -- Copper Ingot: 1x1


catId = tailoring:addCategory("Gloves", "Handschuhe") -- Leather gloves and hats

-- serinjah leather gloves
product = tailoring:addProduct(catId, 527, 90, 100, 165, 330, 1);
product:addIngredient(2547, 7); -- Leather
product:addIngredient(2586, 3); -- Fur
product:addIngredient(176, 3); -- Grey Cloth
product:addIngredient(50, 3); -- Thread

-- studded leather gloves
product = tailoring:addProduct(catId, 526, 55, 75, 112, 225, 1);
product:addIngredient(2547, 4); -- Leather
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2586, 2); -- Fur
product:addIngredient(50, 2); -- Thread

-- thief's gloves
product = tailoring:addProduct(catId, 384, 30, 50, 75, 150, 1);
product:addIngredient(178, 3); -- White Cloth
product:addIngredient(50, 2); -- Thread

-- leather gloves
product = tailoring:addProduct(catId, 48, 26, 46, 69, 138, 1);
product:addIngredient(2547, 2); -- Leather
product:addIngredient(50, 2); -- Thread

--cloth gloves
product = tailoring:addProduct(catId, 2295, 10, 30, 45, 90, 1);
product:addIngredient(178, 3); -- White Cloth
product:addIngredient(50, 1); -- Thread


catId = tailoring:addCategory("Chest armour", "Brustr�stungen") --Chest armours

-- full leather armour
product = tailoring:addProduct(catId, 362, 99, 100, 178, 357, 1);
product:addIngredient(2547, 15); -- Leather
product:addIngredient(2586, 9); -- Fur
product:addIngredient(176, 6); -- Grey Cloth
product:addIngredient(50, 5); -- Thread
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2554); -- Pure Water

-- light hunting armour
product = tailoring:addProduct(catId, 364, 92, 100, 168, 336, 1);
product:addIngredient(2547, 10); -- Leather
product:addIngredient(2586, 6); -- Fur
product:addIngredient(176, 4); -- Grey Cloth
product:addIngredient(50, 4); -- Thread
product:addIngredient(2551); -- Pure Air
product:addIngredient(2571); -- Merinium Ingot

-- half leather armour
product = tailoring:addProduct(catId, 365, 22, 42, 63, 126, 1);
product:addIngredient(2547, 5); -- Leather
product:addIngredient(2586, 2); -- Fur
product:addIngredient(50, 2); -- Thread

-- leather scale armour
product = tailoring:addProduct(catId, 363, 18, 38, 57, 114, 1);
product:addIngredient(2547, 5); -- Leather
product:addIngredient(50, 2); -- Thead


catId = tailoring:addCategory("Coats and robes", "M�ntel und Roben") --coats and robes

--Master Mage Robe
product = tailoring:addProduct(catId, 558, 87, 100, 540, 1080)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 6*2) -- Thread: 6x2
product:addIngredient(177, 2) -- Yellow Cloth: 2x1
product:addIngredient(285, 3) -- Diamond: 3x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(283, 3) -- Obsidian: 3x1

--Mage Robe
product = tailoring:addProduct(catId, 548, 84, 100, 416, 832)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(177) -- Yellow Cloth: 1x1
product:addIngredient(175) -- Black Cloth: 1x1
product:addIngredient(46, 2) -- Ruby: 2x1
product:addIngredient(198, 2) -- Topas: 2x1
product:addIngredient(285, 2) -- Diamond: 2x1

--Blue Coat
product = tailoring:addProduct(catId, 2380, 82, 100, 250, 500)
product:addIngredient(179, 5) -- Blue Cloth: 5x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(284, 2) -- Sapphire: 1x2

--Blue Robe
product = tailoring:addProduct(catId, 193, 79, 99, 200, 400)
product:addIngredient(179, 4) -- Blue Cloth: 4x1
product:addIngredient(50, 5*2) -- Thread: 5x2
product:addIngredient(284, 2) -- Sapphire: 1x2

--Brown Priest Robe
product = tailoring:addProduct(catId, 2416, 76, 96, 192, 384)
product:addIngredient(174, 2) -- Red Cloth: 2x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(177, 2) -- Yellow Cloth: 2x1
product:addIngredient(46, 2) -- Ruby: 2x1

--Yellow Priest Robe
product = tailoring:addProduct(catId, 368, 73, 93, 184, 368)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2
product:addIngredient(178) -- White Cloth: 1x1
product:addIngredient(198, 2) -- Topaz: 2x1

--Yellow Robe
product = tailoring:addProduct(catId, 195, 71, 91, 184, 368)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(198, 2) -- Topaz: 2x1

--Red Mage Robe
product = tailoring:addProduct(catId, 2377, 68, 88, 176, 352)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(177) -- Yellow Cloth: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Red Priest Robe
product = tailoring:addProduct(catId, 2419, 65, 85, 168, 336)
product:addIngredient(174, 4) -- Red Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(46) -- Ruby: 1x1

--Novice Mage Robe
product = tailoring:addProduct(catId, 547, 62, 82, 160, 320)
product:addIngredient(174, 4) -- Red Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(177,2) -- Yellow Cloth: 2x1

--Black Priest Robe
product = tailoring:addProduct(catId, 2420, 59, 79, 160, 320)
product:addIngredient(175, 5) -- Black Cloth: 5x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--Black Coat
product = tailoring:addProduct(catId, 2384, 57, 77, 190, 380)
product:addIngredient(175, 5) -- Black Cloth: 5x1
product:addIngredient(50, 5*2) -- Thread: 5x2

--Black Cult Robe
product = tailoring:addProduct(catId, 2378, 54, 74, 144, 288)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 4*2) -- Thread: 4x2
product:addIngredient(174) -- Red Cloth: 1x1

--Black Robe
product = tailoring:addProduct(catId, 194, 51, 71, 144, 288)
product:addIngredient(175, 4) -- Black Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--Green Robe
product = tailoring:addProduct(catId, 55, 48, 68, 136, 272)
product:addIngredient(54, 4) -- Green Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--White Priest Robe
product = tailoring:addProduct(catId, 2421, 46, 66, 128, 256)
product:addIngredient(178, 4) -- White Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--Grey Priest Robe
product = tailoring:addProduct(catId, 2418, 43, 63, 128, 256)
product:addIngredient(176, 4) -- Grey Cloth: 4x1
product:addIngredient(50, 4*2) -- Thread: 4x2

--Grey Coat
product = tailoring:addProduct(catId, 196, 40, 60, 150, 300)
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(50, 5*2) -- Thread: 5x2


catId = tailoring:addCategory("Leggings", "Beinzeug") -- leggings

-- fur trousers
product = tailoring:addProduct(catId, 2113, 93, 100, 169, 339, 1);
product:addIngredient(2586, 9); -- Fur
product:addIngredient(176, 4); -- Grey Cloth
product:addIngredient(50, 4); -- Thread
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2552); -- Pure Earth

-- short fur trousers
product = tailoring:addProduct(catId, 2114, 65, 85, 127, 255, 1);
product:addIngredient(2586, 6); -- Fur
product:addIngredient(176, 3); -- Grey Cloth
product:addIngredient(50, 2); -- Thread

-- leather leggings
product = tailoring:addProduct(catId, 366, 32, 52, 78, 156, 1);
product:addIngredient(2547, 4); -- Leather
product:addIngredient(2586, 2); -- Fur
product:addIngredient(50, 2); -- Thread

-- short leather leggings
product = tailoring:addProduct(catId, 367, 14, 34, 51, 102, 1);
product:addIngredient(2547, 3); -- Leather
product:addIngredient(50, 2); -- Thread


catId = tailoring:addCategory("Trousers", "Hosen") -- Pants

--Blue Trousers
product = tailoring:addProduct(catId, 821, 38, 58, 84, 168)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Blue Trousers
product = tailoring:addProduct(catId, 461, 34, 54, 78, 156)
product:addIngredient(179, 3) -- Blue Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Yellow Trousers
product = tailoring:addProduct(catId, 822, 31, 51, 78, 156)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Yellow Trousers
product = tailoring:addProduct(catId, 460, 28, 48, 72, 144)
product:addIngredient(177, 3) -- Yellow Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Red Trousers
product = tailoring:addProduct(catId, 825, 24, 44, 66, 132)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Red Trousers
product = tailoring:addProduct(catId, 459, 21, 41, 60, 120)
product:addIngredient(174, 3) -- Red Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Trousers
product = tailoring:addProduct(catId, 826, 18, 38, 54, 108)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Black Trousers
product = tailoring:addProduct(catId, 34, 14, 34, 48, 96)
product:addIngredient(175, 3) -- Black Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Green Trousers
product = tailoring:addProduct(catId, 824, 11, 31, 48, 96)
product:addIngredient(54, 3) -- Green Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Green Trousers
product = tailoring:addProduct(catId, 183, 8, 28, 42, 84)
product:addIngredient(54, 3) -- Green Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--White Trousers
product = tailoring:addProduct(catId, 827, 4, 24, 36, 72)
product:addIngredient(178, 3) -- White Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2

--Grey Trousers
product = tailoring:addProduct(catId, 823, 1, 21, 30, 60)
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(50, 3*2) -- Thread: 3x2


catId = tailoring:addCategory("Boots", "Schuhe") -- Footwear

-- serinjah leather boots
product = tailoring:addProduct(catId, 698, 95, 100, 172, 345, 1);
product:addIngredient(2547, 5); -- Leather
product:addIngredient(2586, 3); -- Fur
product:addIngredient(176, 3); -- Grey Cloth
product:addIngredient(50, 4); -- Thread
product:addIngredient(2571); -- Merinium Ingot

-- fur boots
product = tailoring:addProduct(catId, 697, 70, 90, 135, 270, 1);
product:addIngredient(2586, 5); -- Fur
product:addIngredient(176, 2); -- Grey Cloth
product:addIngredient(50, 2); -- Thread

-- leather boots
product = tailoring:addProduct(catId, 53, 36, 56, 84, 168, 1);
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2586, 2); -- Fur
product:addIngredient(50, 2); -- Thread

-- dwarfen boots
product = tailoring:addProduct(catId, 1055, 32, 52, 78, 156, 1);
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2586, 1); -- Fur
product:addIngredient(50, 2); -- Thread

-- Lor-Angur guardians boots
product = tailoring:addProduct(catId, 1056, 10, 30, 50, 100, 1);
product:addIngredient(2547, 1); -- Leather
product:addIngredient(179, 1); -- Grey Cloth
product:addIngredient(50, 2); -- Thread

-- Solid fur boots
product = tailoring:addProduct(catId, 1057, 5, 25, 34, 69, 1);
product:addIngredient(2586, 2); -- Fur
product:addIngredient(50, 2); -- Thread

-- leather shoes
product = tailoring:addProduct(catId, 369, 2, 22, 34, 69, 1);
product:addIngredient(2547, 3); -- Leather
product:addIngredient(50, 2); -- Thread


catId = tailoring:addCategory("Other", "Sonstiges") --slings, and more slings + bag

--Rope
product = tailoring:addProduct(catId, 2760, 20, 40, 60, 120)
product:addIngredient(50, 10) -- Thread: 10x1

-- sling
product = tailoring:addProduct(catId, 89, 4, 24, 36, 72, 1);
product:addIngredient(2547, 2); -- Leather
product:addIngredient(50, 1); -- Thread

--Bag
product = tailoring:addProduct(catId, 97, 0, 20, 28, 56)
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(50, 2*2) -- Thread: 2x2
