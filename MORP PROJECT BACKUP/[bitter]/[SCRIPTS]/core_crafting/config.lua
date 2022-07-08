Config = {

	BlipSprite = 237,
	BlipColor = 26,
	BlipText = 'CRAFTING TABLE',
	UseLimitSystem = false, -- Enable if your esx uses limit system
	CraftingStopWithDistance = false, -- Crafting will stop when not near workbench
	ExperiancePerCraft = 5, -- The amount of experiance added per craft (100 Experiance is 1 level)
	HideWhenCantCraft = true, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
	Categories = {
		['misc'] = {
			Label = 'MISC',
			Image = 'fishingrod',
			Jobs = {}
		},
		['crate'] = {
			Label = 'LOOTCHEST',
			Image = '',
			Jobs = {}
		},
		['medical'] = {
			Label = 'MEDICAL',
			Image = 'bandage',
			Jobs = {}
		},
		['mechanic'] = {
			Label = 'MECHANIC',
			Image = 'v8engines',
			Jobs = {}
		},
		['pistol'] = {
			Label = 'PISTOL',
			Image = 'WEAPON_APPISTOL',
			Jobs = {}
		},
		['smg'] = {
			Label = 'SMG',
			Image = 'WEAPON_MINISMG',
			Jobs = {}
		},
		['shotgun'] = {
			Label = 'SHOTGUN',
			Image = 'WEAPON_ASSAULTSHOTGUN',
			Jobs = {}
		},
		['rifle'] = {
			Label = 'RIFLE',
			Image = 'WEAPON_ADVANCEDRIFLE',
			Jobs = {}
		},
		['mg'] = {
			Label = 'MACHINEGUN',
			Image = 'WEAPON_MG',
			Jobs = {}
		},
		['sniper'] = {
			Label = 'SNIPER',
			Image = 'WEAPON_MARKSMANRIFLE',
			Jobs = {}
		},
		['heavy'] = {
			Label = 'HEAVY',
			Image = 'WEAPON_MINIGUN',
			Jobs = {}
		},
		['AMMO'] = {
			Label = 'AMMO',
			Image = '',
			Jobs = {}
		},
		['throwables'] = {
			Label = 'THROWABLES',
			Image = '',
			Jobs = {}
		}
	},
	PermanentItems = { -- Items that dont get removed when crafting
		['wrench'] = true
	},
	Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
		['syringe'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['cloth'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['alcohol'] = 5,
			}
		}, 
		['bandage'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 6, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['cloth'] = 7, -- item name and count, adding items that dont exist in database will crash the script
				['alcohol'] = 7,
			}
		},
		['medikit'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 35, -- item name and count, adding items that dont exist in database will crash the script
				['alcohol'] = 35,
			}
		},
		['toolbox'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 6, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 60, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['mechanic_tool'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 90, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['v8engine'] = {
			Level = 15, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 250, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['turbo_lvl_1'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 800, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['stock_transmition'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 6, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['stock_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['rubber'] = 15, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['stock_suspension'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 6, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 250, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['stock_oil'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['alcohol'] = 10, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['stock_engine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 250, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['piston'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 250, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['shell_oil'] = {
			Level = 5, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['alcohol'] = 20,
			}
		},
		['repairkit'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 250, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['race_transmition'] = {
			Level = 28, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 750, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['race_suspension'] = {
			Level = 26, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 800, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['race_brakes'] = {
			Level = 20, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 850, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['nos'] = {
			Level = 35, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 4, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 500, -- item name and count, adding items that dont exist in database will crash the script
				['alcohol'] = 50,
				['gunpowder'] = 100
			}
		},
		['michelin_tires'] = {
			Level = 10, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 3, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['rubber'] = 20, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['2jzengine'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 600, -- item name and count, adding items that dont exist in database will crash the script
			}
		},
		['WEAPON_SNSPISTOL_MK2'] = {
			Level = 32, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_SMG_MK2'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 450, -- item name and count, adding items that dont exist in database will crash the script
				['smgshell'] = 1,
			}
		}, 
		['WEAPON_PUMPSHOTGUN_MK2'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
			}
		},
		['WEAPON_ASSAULTRIFLE_MK2'] = {
			Level = 60, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1200, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
			}
		},
		['WEAPON_CARBINERIFLE_MK2'] = {
			Level = 58, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
			}
		},
		['WEAPON_SPECIALCARBINE_MK2'] = {
			Level = 55, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
			}
		},
		['WEAPON_BULLPUPRIFLE_MK2'] = {
			Level = 52, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
			}
		},
		['WEAPON_COMBATMG_MK2'] = {
			Level = 60, -- From what level this item will be craftable
			Category = 'mg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['mgshell'] = 1,
			}
		},
		['WEAPON_APPISTOL'] = {
			Level = 2, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_PISTOL'] = {
			Level = 2, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_MARKSMANRIFLE_MK2'] = {
			Level = 50, -- From what level this item will be craftable
			Category = 'sniper', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1300, -- item name and count, adding items that dont exist in database will crash the script
				['snipershell'] = 1,
			}
		},
		['WEAPON_REVOLVER'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1200, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_DOUBLEACTION'] = {
			Level = 60, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1500, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_CERAMICPISTOL'] = {
			Level = 10, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 300, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_NAVYREVOLVER'] = {
			Level = 35, -- From what level this item will be craftable
			Category = 'pistol', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 7, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1500, -- item name and count, adding items that dont exist in database will crash the script
				['pistolshell'] = 1,
			}
		},
		['WEAPON_MICROSMG'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1500, -- item name and count, adding items that dont exist in database will crash the script
				['smgshell'] = 1,
			}
		},
		['WEAPON_SMG'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1800, -- item name and count, adding items that dont exist in database will crash the script
				 ['smgshell'] =1,
			}
		},
		['WEAPON_ASSUALTSMG'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1900, -- item name and count, adding items that dont exist in database will crash the script
				 ['smgshell'] =1,
				 
			}
		},
		['WEAPON_COMBATPDW'] = {
			Level = 51, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 2000, -- item name and count, adding items that dont exist in database will crash the script
				 ['smgshell'] =1,
				 
			}
		},
		['WEAPON_MACHINEPISTOL'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1500, -- item name and count, adding items that dont exist in database will crash the script
				 ['smgshell'] =1,
				 
			}
		},
		['WEAPON_MINISMG'] = {
			Level = 28, -- From what level this item will be craftable
			Category = 'smg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 9, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 1800, -- item name and count, adding items that dont exist in database will crash the script
				 ['smgshell'] =1,
				 
			}
		},
		['WEAPON_PUMPSHOTGUN'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				 
			}
		},
		['WEAPON_SAWNOFFSHOTGUN'] = {
			Level = 23, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3500, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_ASSAULTSHOTGUN'] = {
			Level = 28, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 4500, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_BULLPUPSHOTGUN'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_MUSKET'] = {
			Level = 27, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 2500, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_HEAVYSHOTGUN'] = {
			Level = 35, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 4800, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_DBSHOTGUN'] = { -- need testing ----
			Level = 25, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 30, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_AUTOSHOTGUN'] = {
			Level = 32, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 4000, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_COMBATSHOTGUN'] = {
			Level = 34, -- From what level this item will be craftable
			Category = 'shotgun', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3200, -- item name and count, adding items that dont exist in database will crash the script
				['shotgunshell'] = 1,
				
			}
		},
		['WEAPON_ASSUALTRIFLE'] = {
			Level = 34, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_CARBINERIFLE'] = {
			Level = 35, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_ADVANCEDRIFLE'] = {
			Level = 36, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_SPEACIALCARBINERIFLE'] = {
			Level = 39, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_BULLPUPRIFLE'] = {
			Level = 40, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_COMPACTRIFLE'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_MILITARYRIFLE'] = {
			Level = 42, -- From what level this item will be craftable
			Category = 'rifle', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5000, -- item name and count, adding items that dont exist in database will crash the script
				['rifleshell'] = 1,
				 
			}
		},
		['WEAPON_MG'] = {
			Level = 50, -- From what level this item will be craftable
			Category = 'mg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['mgshell'] = 1,
				 
			}
		},
		['WEAPON_COMBATMG'] = {
			Level = 55, -- From what level this item will be craftable
			Category = 'mg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['mgshell'] = 1,
				 
			}
		},
		['WEAPON_COMBATMG_MK2'] = {
			Level = 60, -- From what level this item will be craftable
			Category = 'mg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['mgshell'] = 1,
				 
			}
		},
		['WEAPON_GUSENBERG'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'mg', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 12, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['mgshell'] = 1,
				 
			}
		},
		['WEAPON_RPG'] = {
			Level = 80, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 7500, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_GRENADELAUNCHER'] = {
			Level = 70, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 7500, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_MINIGUN'] = {
			Level = 90, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 8000, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_FIREWORK'] = {
			Level = 60, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 8000, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_HOMINGLAUNCHER'] = {
			Level = 70, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 9000, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_COMPACTLAUNCHER'] = {
			Level = 80, -- From what level this item will be craftable
			Category = 'heavy', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 15, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 8000, -- item name and count, adding items that dont exist in database will crash the script
				['heavyshell'] = 1,
				 
			}
		},
		['WEAPON_GRENADE'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 25, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_BZGAS'] = {
			Level = 225, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_MOLOTOV'] = {
			Level = 35, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_STICKYBOMB'] = {
			Level = 28, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_PROXMINE'] = {
			Level = 65, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_PIPEBOMB'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_FLARE'] = {
			Level = 10, -- From what level this item will be craftable
			Category = 'throwables', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 3000, -- item name and count, adding items that dont exist in database will crash the script
				['bombshell'] = 1,
				 
			}
		},
		['WEAPON_PETROLCAN'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['alcohol'] = 15,
				['scrap'] = 30, -- item name and count, adding items that dont exist in database will crash the script
				['emptybottle'] = 1,
				['gunpowder'] = 100,
				 
			}
		},
		['WEAPON_PARACHUTE'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 500, -- item name and count, adding items that dont exist in database will crash the script
				['cloth'] = 30,
				 
			}
		},
		['WEAPON_MARKSMANRIFLE'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'sniper', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['snipershell'] = 1,
				 
			}
		},
		['WEAPON_SNIPERRIFLE'] = {
			Level = 50, -- From what level this item will be craftable
			Category = 'sniper', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['snipershell'] = 1,
				 
			}
		},
		['WEAPON_HEAVYSNIPER'] = {
			Level = 55, -- From what level this item will be craftable
			Category = 'sniper', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 6000, -- item name and count, adding items that dont exist in database will crash the script
				['snipershell'] = 1,
				 
			}
		},
		['pistol_clip'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['smg_clip'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['lightsmg_clip'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['rifle_clip'] = {
			Level = 30, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['shotgun_clip'] = {
			Level = 23, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['sniper_clip'] = {
			Level = 45, -- From what level this item will be craftable
			Category = 'AMMO', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 2, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['scrap'] = 5, -- item name and count, adding items that dont exist in database will crash the script
				['gunpowder'] = 25,
				 
			}
		},
		['campingset'] = {
			Level = 20, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['wood'] = 300, -- item name and count, adding items that dont exist in database will crash the script	
				['scrap'] = 500,
				['cloth'] = 300,	
			}
		},
		['ct'] = {
			Level = 25, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['wood'] = 300 , -- item name and count, adding items that dont exist in database will crash the script	
				['scrap'] = 500,
				['cloth'] = 300,	
			}
		},
		['oxygenmask'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = true, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['wood'] = 30, -- item name and count, adding items that dont exist in database will crash the script	
				['scrap'] = 50,
				['cloth'] = 30,	
			}
		},
		
		['binoculars'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['wood'] = 30, -- item name and count, adding items that dont exist in database will crash the script	
				['scrap'] = 50,
			}
		}
	},
	Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
		{coords = vector3(-1133.97,4948.6,222.27), jobs = {}, blip = true, recipes = {}, radius = 3.0 }
	},
	ObjectsLoot = "prop_toolchest_05", -- ct
	Text = {
		['not_enough_ingredients'] = 'You dont have enough ingredients',
		['you_cant_hold_item'] = 'You cant hold the item',
		['item_crafted'] = 'Item crafted!',
		['wrong_job'] = 'You cant open this workbench',
		['workbench_hologram'] = '[~b~E~w~] Workbench',
		['wrong_usage'] = 'Wrong usage of command',
		['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
		['crafting_failed'] = 'You failed to craft the item!'
	}
}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
