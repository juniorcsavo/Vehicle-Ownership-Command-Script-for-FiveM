-- Example command usage: /givevehicle [esxPlayerId] [model]
RegisterCommand('givevehicle', function(source, args, rawCommand)
    local playerId = tonumber(args[1]) or source -- Use the player who is executing the command as the default
    local model = args[2]

    -- Validate the vehicle model
    if IsModelInCdimage(model) and IsModelAVehicle(model) then
        TriggerServerEvent('givePlayerVehicle', playerId, model)
    else
        print('Invalid vehicle model.')
    end
end, false)

RegisterNetEvent('spawnPlayerVehicle')
AddEventHandler('spawnPlayerVehicle', function(plate, model)
    local playerPed = GetPlayerPed(-1)
    local pos = GetEntityCoords(playerPed)

    -- Request the vehicle model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end

    -- Create the vehicle
    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

    -- Set the plate for the spawned vehicle
    SetVehicleNumberPlateText(vehicle, plate)
end)
