Config = {}

Config.CircleZones = {
	
	SAFEZONE1 = {
		coords = vector3(975.78,-3112,5.9 ), 
		name = 'TOXIC ZONE 1', 
		color = 1, 
		sprite = 310,
		radius = 200.0
	},
	SAFEZONE2 = {
		coords = vector3(2754.31,1539.28,24.5 ), 
		name = 'TOXIC ZONE 1', 
		color = 1, 
		sprite = 310,
		radius = 200.0
	}
}

Config.Radius = 200

Config.zones = {
	{ ['x'] = 975.78, ['y'] = -3112, ['z'] = 5.9},
	{ ['x'] = 2754.31, ['y'] = 1539.28, ['z'] = 24.5},
}

--========================GAS MASK=====================

Config.GasMaskNumber = 46 -- helmet no

--========================TREASURE=====================

Config.robbitems = { 
	[1] = {x = 2617.43, y = 1579.74, z = 28.58, name = "Grass", isSearched = false},
	[2] = {x = 2645.57, y = 1578.32, z = 25.22, name = "Grass", isSearched = false},
	[3] = {x = 2660.22, y = 1606.75, z = 29.47, name = "Tank", isSearched = false},
	[4] = {x = 2665.97, y = 1563.55, z = 35.29, name = "Tank", isSearched = false},
	[5] = {x = 2784.01, y = 1491.13, z = 24.51, name = "Road", isSearched = false},
	[6] = {x = 2851.02, y = 1455.35, z = 32.6, name = "Up Of Bulding", isSearched = false},
	[7] = {x = 2801.51, y = 1440.58, z = 38.95, name = "Up Of Bulding", isSearched = false},
	[8] = {x = 2753.93, y = 1539.39, z = 23.73, name = "Inside Of Bulding", isSearched = false},
	[9] = {x = 2693.06, y = 1592.5, z = 23.72, name = "Road", isSearched = false},
	[10] = {x = 2781.95, y = 1465.97, z = 24.42, name = "Road", isSearched = false},
	[11] = {x = 2816.27, y = 1398.72, z = 24.87, name = "Tower", isSearched = false},
	[12] = {x = 2660.88, y = 1392.66, z = 23.33, name = "Under Tank", isSearched = false},
	[13] = {x = 2784.73, y = 1651.69, z = 24.56, name = "Beside Road", isSearched = false},
	[14] = {x = 1070.87, y = -3253.56, z = 9.09, name = "Container", isSearched = false},
	[15] = {x = 997.31, y = 3089.21, z = 5.91, name = "Road", isSearched = false},
	[16] = {x = 959.83, y = -3101.61, z = 8.71, name = "On The Top Of Container", isSearched = false},
	[17] = {x = 1004.4, y = -3143.11, z = 5.9, name = "Road", isSearched = false},
	[18] = {x = 1065.47, y = -2995.9, z = 5.91, name = "Road", isSearched = false},
	[19] = {x = 1100.64, y = -2987.59, z = 14.33, name = "On The Top Of Container", isSearched = false},
	[20] = {x = 1134.38, y = -3006.64, z = 5.9, name = "Road", isSearched = false},
	[21] = {x = 817.24, y = -3182.0, z = 5.97, name = "Road", isSearched = false},
	[22] = {x = 975.78, y = -3112.0, z = 5.91, name = "Road", isSearched = false},
	[23] = {x = 885.78, y = -3162.32, z = 5.9, name = "Road", isSearched = false},
	[24] = {x = 998.16, y = -3059.24, z = 5.91, name = "Road", isSearched = false},
	[25] = {x = 874.16, y = -3016.2, z = 5.9, name = "Road", isSearched = false},
	[26] = {x = 1119.44, y = -3166.3, z = 5.83, name = "Road", isSearched = false},
	[27] = {x = 1135.25, y = -3187.52, z = 24.18, name = "Top Of Building", isSearched = false},
}

Config.treasurerewards = {
	[1] =  {chance = 2, id = 'samsung_s8',          name = 'Samsung S8',        quantity = 1}, 
    [3] =  {chance = 5, id = 'disc_ammo_pistol',    name = 'Pistol Ammo',       quantity = 1}, 
    [4] =  {chance = 4, id = 'repairkit',           name = 'Repair Kit',        quantity = 1}, 
    [5] =  {chance = 7, id = 'WEAPON_HATCHET',      name = 'Hatchet',           quantity = 1}, 
    [6] =  {chance = 9, id = 'WEAPON_BAT',          name = 'Bat',               quantity = 1}, 
    [7] =  {chance = 2, id = 'sunglasses',          name = 'Sunglasses',        quantity = 1}, 
    [8] =  {chance = 2, id = 'apple_iphone',        name = 'Apple iPhone',      quantity = 1}, 
    [9] =  {chance = 5, id = 'phone',               name = 'Phone',             quantity = 1}, 
    [10] = {chance = 2, id = 'nokia_phone',         name = 'Nokia Phone',       quantity = 1}, 
    [11] = {chance = 3, id = 'ring',                name = 'Ring',              quantity = 1}, 
    [12] = {chance = 1, id = 'camera',              name = 'Camera',            quantity = 1}, 
    [13] = {chance = 1, id = 'gameboy',             name = 'Gameboy',           quantity = 1}, 
    [14] = {chance = 2, id = 'casio_watch',         name = 'Casio Watch',       quantity = 1}, 
    [15] = {chance = 2, id = 'white_pearl',         name = 'White Pearl',       quantity = 1}, 
    [16] = {chance = 1, id = 'psp',                 name = 'PSP',               quantity = 1}, 
    [17] = {chance = 2, id = '2ct_gold_chain',      name = '2CT Gold Chain',    quantity = 1},
    [18] = {chance = 3, id = '5ct_gold_chain',      name = '5CT Gold Chain',    quantity = 1},
    [19] = {chance = 4, id = '8ct_gold_chain',      name = '8CT Gold Chain',    quantity = 1},
    [20] = {chance = 4, id = '10ct_gold_chain',     name = '10CT Gold Chain',   quantity = 1},
    [21] = {chance = 5, id = 'pearl_necklace',      name = 'Pearl Necklace',    quantity = 1},
    [22] = {chance = 6, id = 'weed_packaged',       name = 'Weed Packaged',     quantity = 1},
    [24] = {chance = 5, id = 'electronics',         name = 'Electronics',       quantity = 1},
    [25] = {chance = 1, id = 'breadboard',          name = 'Breadboard',        quantity = 1},
    [26] = {chance = 7, id = 'pacificidcard',       name = 'Pacific ID Card',   quantity = 1},
    [27] = {chance = 6, id = 'oxycutter',           name = 'Oxy Cutter',        quantity = 1},
}