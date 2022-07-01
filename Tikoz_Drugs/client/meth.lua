ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local menurecoltmeth = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Récolte Meth"},
    Data = { currentMenu = "Menu", 'Test'},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~récolté" then
                StartRecolteMeth()
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
        local menu = Config.Meth.Recolte
        local dist = GetDistanceBetweenCoords(pos, menu, true)

        if dist <= 2 then



            ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour ~b~récolté')

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menurecoltmeth)
            end

        else 
            StopRecolteMeth()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end
end)

function StopRecolteMeth()
    if recoltemeth then
    	recoltemeth = false
    end
end

function StartRecolteMeth()
    if not recoltemeth then
        recoltemeth = true
    while recoltemeth do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:RecolteMeth')
    end
    else
        recoltemeth = false
    end
end

local menutraitmeth = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Traitement Meth"},
    Data = { currentMenu = "Menu", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencez à ~b~traité" then
                StartTraitementMeth()
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
        local menu = Config.Meth.Traitement
        local dist = GetDistanceBetweenCoords(pos, menu, true)
        
        if dist <= 2 then



            ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour ~b~traité')

            DrawMarker(6, menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menutraitmeth)
            end

        else 
            StopTraitementMeth()
            Citizen.Wait(1000)
        end

        Citizen.Wait(0)
    end

end)

function StopTraitementMeth()
    if traitemeth then
    	traitemeth = false
    end
end

function StartTraitementMeth()
    if not traitemeth then
        traitemeth = true
    while traitemeth do
        Citizen.Wait(2000)
        TriggerServerEvent('Tikoz:TraitementMeth')
    end
    else
        traitemeth = false
    end
end
