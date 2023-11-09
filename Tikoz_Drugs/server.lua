ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('Tikoz:RecolteDrugs')
AddEventHandler('Tikoz:RecolteDrugs', function(name, item)

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem(item).count

	if item then
	    if iteminventaire >= 50 then
	        TriggerClientEvent('esx:showNotification', source, "Tu ne peux pas récolté plus de ~y~50~b~ "..name)
	        recolte = false
	    else
	        xPlayer.addInventoryItem(item, 1)
	        TriggerClientEvent('esx:showNotification', source, "Tu récoltes : ~b~"..name)
			return
	    end
	end
end)

RegisterNetEvent('Tikoz:TraitementDrugs')
AddEventHandler('Tikoz:TraitementDrugs', function(name, item, need)
    local xPlayer = ESX.GetPlayerFromId(source)
    local drugs = xPlayer.getInventoryItem(need).count
    local pooch = xPlayer.getInventoryItem(item).count

    if pooch > 99 then
        TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas porter plus de ~y~100~b~ pochon de '..name)
        traitedrugs = false
    elseif drugs < 2 then
        TriggerClientEvent('esx:showNotification', source, "Pas assez de ~b~"..need.."~s~ pour traité")
        traitedrugs = false
    else
        xPlayer.removeInventoryItem(need, 2)
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Tu traites de la ~b~"..name)
    end
end)

RegisterNetEvent('Tikoz:VenteDrugs')
AddEventHandler('Tikoz:VenteDrugs', function(name, item, min, max)

    local xPlayer = ESX.GetPlayerFromId(source)
    local iteminventaire = xPlayer.getInventoryItem(item).count
    local prix = math.random(min, max)
    if iteminventaire <= 0 then
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez de ~b~"..name)
        ventetdrugs = false
    else
        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addAccountMoney("black_money", prix)
        TriggerClientEvent('esx:showNotification', source, "Tu as vendu ~y~x1 ~b~"..name.."~s~ pour ~r~"..prix.."$")
		return
    end
end)
