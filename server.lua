RegisterServerEvent('givePlayerVehicle')
AddEventHandler('givePlayerVehicle', function(targetPlayerId, model)
    local xTargetPlayer = ESX.GetPlayerFromId(targetPlayerId)

    if xTargetPlayer then
        local identifier = xTargetPlayer.identifier
        local plate = GenerateRandomPlate()

        local vehicleData = {
            modHood = -1,
            modHorns = -1,
            color1 = 66, -- Default color
            -- Add more properties as needed
        }

        local vehicleDataJson = json.encode(vehicleData)

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)',
            {['@owner'] = identifier, ['@plate'] = plate, ['@vehicle'] = vehicleDataJson, ['@type'] = 'car'},
            function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('spawnPlayerVehicle', targetPlayerId, plate, model)
                else
                    print('Failed to insert vehicle into the database')
                end
            end
        )
    else
        print('Target player not found.')
    end
end)

function GenerateRandomPlate()
    local plate = ""
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    for i = 1, 8 do
        local randomIndex = math.random(1, #characters)
        plate = plate .. characters:sub(randomIndex, randomIndex)
    end
    
    return plate
end
