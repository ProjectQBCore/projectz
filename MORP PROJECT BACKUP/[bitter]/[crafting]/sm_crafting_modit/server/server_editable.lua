ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

ESX.RegisterUsableItem('craftingbook', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent("sm_crafting:openCrafting",source)
end)
function getItemCount(source, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	return xPlayer.getInventoryItem(item).count
end
function removeItem(source, item, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, amount)
end
function addItem(source, item, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item, amount)
end
function addWeapon(source, weapon, amount)
	-- Since I can't know how you handle "if player has same weapon already"
	-- You must do this your self or use one of ready1's 
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, amount)
	--[[ If your ESX code transforms your weapon to item if player already have 1.
		 Then maybe this is better solution for you?
		for i=1,amount do
			xPlayer.addWeapon(weapon, 0)
		end
	]]
end
