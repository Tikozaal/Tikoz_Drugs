ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-------------------- WEED ---------------------------

RegisterNetEvent('Tikoz:RecolteWeed')
AddEventHandler('Tikoz:RecolteWeed', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem("weed").count

    if iteminventaire >= 50 then
        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas récolté plus de ~b~50~s~ de weed !")
        recolteweed = false
    else
        xPlayer.addInventoryItem("weed", 1)
        TriggerClientEvent('esx:showNotification', source, "Vous récolté de la ~b~weed")
		return
    end
end)

RegisterNetEvent('Tikoz:TraitementWeed')
AddEventHandler('Tikoz:TraitementWeed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed = xPlayer.getInventoryItem('weed').count
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 99 then
        TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas porter plus de ~y~100~b~ pochon de weed')
        traiteweed = false
    elseif weed < 2 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~b~weed~s~ pour traité')
        traiteweed = false
    else
        xPlayer.removeInventoryItem('weed', 2)
        xPlayer.addInventoryItem('weed_pooch', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous traité de la ~b~weed")

    end
end)

-------------------- COKE ---------------------------

RegisterNetEvent('Tikoz:RecolteCoke')
AddEventHandler('Tikoz:RecolteCoke', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem("coke").count

    if iteminventaire >= 50 then
        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas récolté plus de ~b~50~s~ de coke !")
        recolteCoke = false
    else
        xPlayer.addInventoryItem("coke", 1)
        TriggerClientEvent('esx:showNotification', source, "Vous récolté de la ~b~Coke")
		return
    end
end)

RegisterNetEvent('Tikoz:TraitementCoke')
AddEventHandler('Tikoz:TraitementCoke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Coke = xPlayer.getInventoryItem('coke').count
    local Coke_pooch = xPlayer.getInventoryItem('coke_pooch').count

    if Coke_pooch > 99 then
        TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas porter plus de ~y~100~b~ pochon de coke')
        traitecoke = false
    elseif Coke < 2 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~b~coke~s~ pour traité')
        traitecoke = false
    else
        xPlayer.removeInventoryItem('coke', 2)
        xPlayer.addInventoryItem('coke_pooch', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous traité de la ~b~coke")
    end
end)

-------------------------------- METH -----------------------------------

RegisterNetEvent('Tikoz:RecolteMeth')
AddEventHandler('Tikoz:RecolteMeth', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem("meth").count

    if iteminventaire >= 50 then
        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas récolté plus de ~b~50~s~ de meth !")
        recoltemeth = false
    else
        xPlayer.addInventoryItem("meth", 1)
        TriggerClientEvent('esx:showNotification', source, "Vous récolté de la ~b~meth")
		return
    end
end)

RegisterNetEvent('Tikoz:TraitementMeth')
AddEventHandler('Tikoz:TraitementMeth', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local meth = xPlayer.getInventoryItem('meth').count
    local meth_pooch = xPlayer.getInventoryItem('meth_pooch').count

    if meth_pooch > 99 then
        TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas porter plus de ~y~100~b~ pochon de meth')
        traitemeth = false
    elseif meth < 2 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~b~meth~s~ pour traité')
        traitemeth = false
    else
        xPlayer.removeInventoryItem('meth', 2)
        xPlayer.addInventoryItem('meth_pooch', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous traité de la ~b~meth")

    end
end)

------------------- OPIUM ---------------------------------

RegisterNetEvent('Tikoz:RecolteOpium')
AddEventHandler('Tikoz:RecolteOpium', function()

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem("opium").count

    if iteminventaire >= 50 then
        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas récolté plus de ~b~50~s~ opium !")
        recolteopium = false
    else
        xPlayer.addInventoryItem("opium", 1)
        TriggerClientEvent('esx:showNotification', source, "Vous récolté de l'~b~opium")
		return
    end
end)

RegisterNetEvent('Tikoz:TraitementOpium')
AddEventHandler('Tikoz:TraitementOpium', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local opium = xPlayer.getInventoryItem('opium').count
    local opium_pooch = xPlayer.getInventoryItem('opium_pooch').count

    if opium_pooch > 99 then
        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas porter plus de ~y~100~b~ pochon d'opium")
        traiteopium = false
    elseif opium < 2 then
        TriggerClientEvent('esx:showNotification', source, "Pas assez d'~b~opium~s~ pour traité")
        traiteopium = false
    else
        xPlayer.removeInventoryItem('opium', 2)
        xPlayer.addInventoryItem('opium_pooch', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous traité de la ~b~opium")
    end
end)