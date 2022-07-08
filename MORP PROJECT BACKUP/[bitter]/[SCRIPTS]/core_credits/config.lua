Config = {

OpenKey = '',
OpenCommand = 'credits',

UsingLimitSystem = false,

DefaultCategory = 'vehicles', -- This category will show up first
ShopCategories = {
	['vehicles'] = 'VEHICLES',
	['weapons'] = 'WEAPONS',
	['money'] = 'MONEY',
    ['items'] = 'ITEMS'
},
--TYPES AVAILABLE BY DEFAULT (Other types can be added in server lua file or request them for another update)
-- car, money, weapon, item
Shop = {
	['RAPTOR'] = {type = 'car', model = 'RAPTOR150', price = 20000, category = 'vehicles'},
    ['BJ40'] = {type = 'car', model = 'bj40', price = 17000, category = 'vehicles'},
    ['BJ40'] = {type = 'car', model = 'rattfukt', price = 17000, category = 'vehicles'},
    ['money'] = {type = 'money', money= 100000, price = 5000, category = 'money'},
    ['medikit'] = {type = 'item', item= 'medikit', count = 1.0, price = 200, category = 'items'},
    ['WEAPON_APPISTOL'] = {type = 'weapon', weapon= 'WEAPON_APPISTOL', ammo = 0.0, price = 8000, category = 'weapons'}
},


--TYPES AVAILABLE BY DEFAULT (Other types can be added in server lua file or request them for another update)
--run, drive, fly, 
Tasks = {
    [1] = {reward = 50, type='run', value=100, description = 'RUN 100 KILOMETERS'},
    [2] = {reward = 100, type='drive', value=100, description = 'DRIVE 100 KILOMETERS'},
    [3] = {reward = 100, type='fly', value=100, description = 'FLY 100 KILOMETERS'}

},

--RARITIES (From most common to most rare)
-- supercommon, common, rare, superrare, import
--TYPES OF REWARDS
-- car, credits, weapon, item, money
LowestBet = 50, -- The lowest bet amount
CaseOpeningItems = { -- The image name should be as the id for this reward
	['bandage'] = {type = 'item', item = 'bandage', exchange = 50.0, count = 1.0, rarity = 'common'},
   -- ['medikit'] = {type = 'item', item = 'medikit', exchange = 100.0, count = 1.0, rarity = 'common'},

    ['RAPTOR150'] = {type = 'car', model = 'RAPTOR150', exchange = 10000.0, rarity = 'import'},
    --['rs6'] = {type = 'car', model = 'rmodrs6', exchange = 8000.0, rarity = 'import'},

    ['credits20'] = {type = 'credits', credits = 20.0, exchange = 20.0, rarity = 'supercommon'},
    --['fixkit'] = {type = 'item', item = 'fixkit', count = 1.0, exchange = 50.0, rarity = 'supercommon'},

    --['credits1000'] = {type = 'credits', credits = 1000.0, exchange = 1000.0, rarity = 'rare'},
    ['money'] = {type = 'money', money = 100000.0, exchange = 2000.0, rarity = 'rare'},

    ['WEAPON_APPISTOL'] = {type = 'weapon', weapon = 'WEAPON_APPISTOL', ammo = 0.0, exchange = 5000.0,  rarity = 'superrare'},
    --['credits4000'] = {type = 'credits', credits = 4000.0, exchange = 4000.0, rarity = 'superrare'}

},


BuyCreditsLink = 'morp.in',
BuyCreditsDescription = 'Buying credits and other items helps to run this server :) Thanks!',

Text = {


    ['item_purschased'] = 'Item purchased',
    ['not_enough_credits'] = 'Not enough credits',
    ['wrong_usage'] = 'Wrong usage',
    ['item_redeemed'] = 'You have redeemed an item!',
    ['item_exchanged'] = 'Item exchanged for credits!',
    ['bet_limit'] = 'You have to bet atleast 50 credits!',
    ['task_completed'] = 'Task completed!'


}

}



function SendTextMessage(msg)

        --SetNotificationTextEntry('STRING')
        --AddTextComponentString(msg)
        --DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        exports['mythic_notify']:SendAlert('inform', msg)

end
