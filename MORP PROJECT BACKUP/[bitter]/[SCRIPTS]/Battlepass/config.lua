Config = {}

Config.MysqlAsync = true -- Set true if you use Mysql-Async and false if you use ghmattimysql, if you don't know what is the difference, then you probably use Mysql-Async and you shouldn't change this.

Config.ResetInDay = {year=2021,month=7,day=8,hour=23,minute=40} -- This will be the time to reset the XP from player, you can input a date of your choise :D

Config.BarColor = {r=255,g=0,b=0,a=255} -- This is the colour of the bars. it's in RGBA, a = "opacity" Use this site to get a colour https://www.hexcolortool.com/
Config.CircleColor = {r=0,g=35,b=81,a=255} -- This is the colour of the circle. it's in RGBA, a = "opacity" Use this site to get a colour https://www.hexcolortool.com/

Config.LooseBarColor = {r=202,g=28,b=28,a=255} -- the same thing as the previous one, but this is for when XP is lostour https://www.hexcolortool.com/
Config.LooseCircleColor = {r=117,g=16,b=16,a=255} -- the same thing as the previous one, but this is for when XP is lost

--XP can be removed if the owners of the server want it. It can be part of a punishment, a failure, anything. It is up to you

Config.RewardsAndStuff = {
	[1] =  { -- level
		xp = 800, -- The Max XP to End the level, so level 1 will be from 0 to 800
	},
	[2] =  { -- level that should recieve this rewards
		xp = 2100,  -- The Max XP to End the level, so level 2 will be from 800 to 2100
		RewardsLabel = "Example 2, you should put here what you like",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 500,
			}
		}
	},
	[3] =  { -- level that should recieve this rewards
		xp = 3800,
		RewardsLabel = "Teste3",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "money", -- it can be money, item or weapon
				item = "cash", -- in this case, reward is money, so the item can be cash/bank/black_money (it depends in your framework)
				amount = 1000,
			},
			{
				typereward = "weapon", -- it can be money, item or weapon
				item = "WEAPON_PISTOL",
				amount = 100, -- in this case, since the reward is a weapon, the amount is the ammo
			}
		}
	},
	[4] =  { -- level that should recieve this rewards
		xp = 6100,
		RewardsLabel = "Teste4",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 5,
			}
		}
	},
	[5] =  { -- level that should recieve this rewards
		xp = 9500,
		RewardsLabel = "Teste5",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 5,
			}
		}
	},
	[6] =  { -- level that should recieve this rewards
		xp = 12500,
		RewardsLabel = "Teste6",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 5,
			}
		}
	},
	[7] =  { -- level that should recieve this rewards
		xp = 16000,
		RewardsLabel = "Teste7",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 5,
			}
		}
	},
	[8] =  { -- level that should recieve this rewards
		xp = 19800,
		RewardsLabel = "Teste8",
		Rewards = {
			{-- You can add multiple rewards
				typereward = "item", -- it can be money, item or weapon
				item = "bread",
				amount = 5,
			}
		}
	}
}

Config.CheckMyLevelCommand = "bplvl" -- this will be the command for each player to check their own levels.
Config.CheckMyLevelControl = "i" --This will do the same as Config.CheckMyLevelCommand, but this will triggered by pressing i. You can change the i to another letter.


Config.MyBattlePass = "mybp" -- this will be the command to check all the information about the BattlePass
Config.CheckMyBattlePassControl = "o" -- This will do the same as Config.MyBattlePass, but this will triggered by pressing o. You can change the o to another letter.

Config.Messages = {
	["timetextlittle"] = "~b~Days: ~s~%s ~b~| Hours: ~s~%s ~b~| Minutes: ~s~%s",
	["timetextphrase"] = "You have more %s days, %s hours, and %s minutes left to complete the BattlePass.",
	["MenuTitle"] = "BattlePass",
	["MenuDescription"] = "~b~BattlePass System",
	["MenuTotalLevelsTitle"] = "Total Levels:",
	["MenuTotalLevelsDesc"] = "The max level of BattlePass is %s.",
	["MenuCurrLevelsTitle"] = "Current Level:",
	["MenuCurrLevelsDesc"] = "You are in level %s.",
	["MenuProgressTitle"] = "Progress:",
	["MenuProgressDesc"] = "You are at %s of the XP needed to finish the BattlePass.",
	["MenuProgressBPCompleted"] = "You already completed the BattlePass.",
	["MenuMyXPTitle"] = "Your XP",
	["MenuMyXPDec"] = "You have %sXP.",
	["MenuXPEndTitle"] = "XP to end BattlePass",
	["MenuXPEndDec"] = "You need more %sXP to end BattlePass.",
	["MenuXPNxtLvlTitle"] = "XP to Next Level",
	["MenuXPNxtLvlDec"] = "You need more %sXP to level up.",
	["MenuTimeLeftTitle"] = "Time Left:",
	["MenuRewardsTitle"] = "Rewards						  Level: ",
}
