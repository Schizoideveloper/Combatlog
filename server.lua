QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('playerDropped', function(reason)
    local konum = GetEntityCoords(GetPlayerPed(source))
    TriggerClientEvent('setz_combatlogsend', -1, konum, source, os.date("%H:%M"), reason)
end)