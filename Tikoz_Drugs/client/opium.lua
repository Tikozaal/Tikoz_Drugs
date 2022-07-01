ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local menurecoltopium = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Récolte Opium"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~récolté" then
                StartRecolteOpium()
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

Citizen.CreateThread(function()

    while true do 

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local menu = Config.Opium.Recolte
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then
            
            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~récolté")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then 
                CreateMenu(menurecoltopium)
            end

        else

            StopRecolteOpium()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end
end)

function StopRecolteOpium()
    if recolteopium then
    	recolteopium = false
    end
end

function StartRecolteOpium()
    if not recolteopium then
        recolteopium = true
    while recolteopium do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:RecolteOpium')
    end
    else
        recolteopium = false
    end
end

local menutraitopium = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Traitement opium"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~traité" then
                StartTraitementopium()
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
        local menu = Config.Opium.Traitement
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then

            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~traité")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menutraitopium)
            end

        else 
            StopTraitementopium()
            Citizen.Wait(1000)
        end
        
        Citizen.Wait(0)
    end
end)

function StopTraitementopium()
    if traiteopium then
    	traiteopium = false
    end
end

function StartTraitementopium()
    if not traiteopium then
        traiteopium = true
    while traiteopium do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:TraitementOpium')
    end
    else
        traiteopium = false
    end
end