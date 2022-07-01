ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local menurecolte = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Récolte Weed"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~récolté" then
                StartRecolteWeed()
                CloseMenu()
            elseif btn.name == "~r~Partir" then
                CloseMenu()
            end
        end,
},
    Menu = {
        ["Menu"] = {
            b = {
                {name = "Commencez à ~b~récolté", ask = ">", askX = true},
                {name = "~r~Partir", ask = "", askX = true},
            }
        }
    }
}

local menutraitement = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Traitement Weed"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
            
            if btn.name == "Commencez à ~b~traité" then
                StartTraitementweed()
                CloseMenu()
            elseif btn.name == "~r~Partir" then
                CloseMenu()
            end
        end,
},
    Menu = {
        ["Menu"] = {
            b = {
                {name = "Commencez à ~b~traité", ask = ">", askX = true},
                {name = "~r~Partir", ask = "", askX = true},
            }
        }
    }
}

Citizen.CreateThread(function()

    while true do 

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local menu = Config.Weed.Traitement
        local dist2 = GetDistanceBetweenCoords(pos, menu, true)

        if dist2 <= 2 then

            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~traité")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menutraitement)
            end
 
        else 

            StopTraitementweed()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end

end)

function StopTraitementweed()
    if traiteweed then
    	traiteweed = false
    end
end

function StartTraitementweed()
    if not traiteweed then
        traiteweed = true
    while traiteweed do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:TraitementWeed')
    end
    else
        traiteweed = false
    end
end

Citizen.CreateThread(function()

    while true do 

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local menu = Config.Weed.Recolte
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then
            
            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~récolté")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menurecolte)
            end
        else 
            StopRecolteWeed()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end

end)

function StopRecolteWeed()
    if recolteweed then
    	recolteweed = false
    end
end

function StartRecolteWeed()
    if not recolteweed then
        recolteweed = true
    while recolteweed do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:RecolteWeed')
    end
    else
        recolteweed = false
    end
end