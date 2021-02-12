RegisterCommand("Pos", function(source, args, rawCommand )

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    print(pos.x, pos.y, pos.x)
end, fasle)

RegisterCommand("Car", function(source, args, rawCommand)
    local heading = GetEntityHeading(playerPed)

    if args[1] = nill then
        print("Veuillez saisir le nom du véhicule")
        return
    end

    if not IsModelValid(args[1]) then
        print("Modèle invalide")
    end

    local vName = args[1]
    local vHash = GetHashKey(vName)

    RequestModel(vHash)
    while not HashModelLoaded(vHash) do
        Citizen.Wait(10)
    end

    local veh = CreateVehicle(vHash, pos.x, pos.y, pos.z, heading, false, false)
    TaskWarpPedIntoVehicle(playerPed, veh, -1)

    ---------Blip Vehicle------------------
    AddBlipForEntity(veh)

    AddTextEntry("VEHBLIP", "Vehicle")
    local playerName = GetPlayerName(playerPed)

    SetVehicleEngineOn(veh, true, true, true)

end, fasle)

RegisterCommand("tp", function(source, args, rawCommand)
    local playerID = GetPlayerServerId(playerPed)

    if playerID == nill then
        print("Veuillez saisir l'id du joueur")
        return
    end

    if not IsModelValid(playerID)  then
        print("Le joueur n'existe pas")
    end

    local posPlayerID = GetPlayerCoords(playerID)
    local headingPlayerID = GetEntityHeading(playerID)

    if IsModelValid(playerID) then
        StartPlayerTeleport(playerPed, posPlayerID.x, posPlayerID.y, posPlayerID.z, headingPlayerID, true, true, true) 
        Wait(2000) 
        StopPlayerTeleport()
    end
    
    if HasPlayerTeleportFinished(playerPed) then
        print("Vous avez été téléporter")
    end

end, false)

RegisterCommand("freeze", function (source, args, rawCommand)

    local playerID = GetPlayerServerId(playerPed)

    if playerID == nill then
        print("Veuillez saisir l'id du joueur")
        return
    end

    if not IsModelValid(playerID)  then
        print("Le joueur n'existe pas")
    end

    FreezeEntityPosition(playerID, true)
    
end, false)


RegisterCommand("unfreeze", function (source, args, rawCommand)

    local playerID = GetPlayerServerId(playerPed)

    if playerID == nill then
        print("Veuillez saisir l'id du joueur")
        return
    end

    if not IsModelValid(playerID)  then
        print("Le joueur n'existe pas")
        return
    end

    FreezeEntityPosition(playerID, false)
    
end, false)

RegisterCommand("mute", function (source, args, rawCommand)

    local playerID = GetPlayerServerId(playerPed)

    if playerID == nill then
        print("Veuillez saisir l'id du joueur")
        return
    end

    if not IsModelValid(playerID)  then
        print("Le joueur n'existe pas")
        return
    end

    FreezeMicrophone()
    
end, false)