--
-- * Created with PhpStorm
-- * User: Terbium
-- * Date: 05/11/2019
-- * Time: 02:21
--

local oArray = {}
local oPlayerUse = {}


AddEventHandler('playerDropped', function()
    local oSource = source
    if oPlayerUse[oSource] ~= nil then
        oArray[oPlayerUse[oSource]] = nil
        oPlayerUse[oSource] = nil
    end
end)


RegisterServerEvent('cyber-chairsystem:Server:Enter')
AddEventHandler('cyber-chairsystem:Server:Enter', function(object, objectcoords)
    local oSource = source
    if oArray[objectcoords] == nil then
        oPlayerUse[oSource] = objectcoords
        oArray[objectcoords] = true
        TriggerClientEvent('cyber-chairsystem:Client:Animation', oSource, object, objectcoords)
    end
end)


RegisterServerEvent('cyber-chairsystem:Server:Leave')
AddEventHandler('cyber-chairsystem:Server:Leave', function(objectcoords)
    local oSource = source

    oPlayerUse[oSource] = nil
    oArray[objectcoords] = nil
end)

