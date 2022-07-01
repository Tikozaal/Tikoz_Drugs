ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local menurecoltecoke = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Récolte Coke"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~récolté" then
                StartRecolteCoke()
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

local menutraitcoke = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Traitement Coke"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~traité" then
                StartTraitementcoke()
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
        local menu = Config.Coke.Traitement
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then


            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~traité")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menutraitcoke)
            end
        else 

            StopTraitementcoke()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end

end)

function StopTraitementcoke()
    if traitecoke then
    	traitecoke = false
    end
end

function StartTraitementcoke()
    if not traitecoke then
        traitecoke = true
    while traitecoke do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:TraitementCoke')
    end
    else
        traitecoke = false
    end
end


Citizen.CreateThread(function()

    while true do 
       
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local menu = Config.Coke.Recolte 
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then


            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ~b~récolté")

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menurecoltecoke)
            end
 
        else 

            StopRecolteCoke()
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end

end)

function StopRecolteCoke()
    if recoltecoke then
    	recoltecoke = false
    end
end

function StartRecolteCoke()
    if not recoltecoke then
        recoltecoke = true
    while recoltecoke do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:RecolteCoke')
    end
    else
        recoltecoke = false
    end
end