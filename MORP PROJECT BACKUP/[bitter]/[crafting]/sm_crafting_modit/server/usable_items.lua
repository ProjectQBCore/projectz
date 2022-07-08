-- Usable campfire item.. Only 1 campfire can be active by player.
-- It will destory itself in 10minutes
ESX.RegisterUsableItem('campfire', function(source)
  if not playercampfires[source] then
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('campfire', 1)
	TriggerClientEvent("sm_crafting:campfire",source)
  end
end)

-- This item rolls for random formula
ESX.RegisterUsableItem('formula_tube', function(source)
 	rollForFormula(source)
end)

--This is just an example how to create formula 
ESX.RegisterUsableItem('formula_campfire', function(source)
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(name, 1)
	TriggerEvent("sm_crafting:newFormula", source, 'formula_campfire')
end)

ESX.RegisterUsableItem('craftingbook', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent("sm_crafting:openCrafting",source)
end)