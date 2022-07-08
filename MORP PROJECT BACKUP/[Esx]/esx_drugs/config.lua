Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10
}

Config.DrugDealerItems = {
	bandage = 2,
	bandage2 = 3,
	medikit = 30,
	mechanic_tools = 20 ,
	repairkit = 20  ,
	stock_engine = 20 ,
	stock_oil = 20 ,
	stock_suspension = 20 ,
	stock_tires = 20 ,
	stock_transmition = 20 ,
	toolbox = 20 ,
	scrap = 20 ,
	alcohol = 20 ,
	rubber = 20 ,
	wood = 20 ,
	antidot = 20 ,
	binoculars = 20 ,
	campingset = 20 ,
	ct = 20 ,
	bandage = 20 ,
	bandage2 = 20 ,
	bread = 20 ,
	water = 20 ,
	c4 = 20 ,
	hackerDevice = 20 ,
	green_keycard = 20 ,
	thermite = 20 ,


	
}

Config.DealerBlip = true

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 0}
}

Config.GiveBlack = false -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {coords = vector3(310.91, 4290.87, 45.15), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(2329.02, 2571.29, 46.68), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0},

	
}

Config.DealerCoords = {

	DrugDealer = {coords = vector3(-1132.44,4941.42,219.50), name = _U('blip_Sell Goods'), color = 6, sprite = 496, radius = 25.0},
}