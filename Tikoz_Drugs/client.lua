ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

menurecolte = {
    Base = {Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Récolte"},
    Data = {currentMenu = "Menu :"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
            if btn.name == "Commencer la récolte de ~b~"..name then
                StartRecolte()
            end
        end, 
},
    Menu = {
        ["Menu :"] = {
            b = {
            }
        }
    }
}

CreateThread(function()
    while true do
        if recoltedrugs() then
            if IsControlJustPressed(1, 51) then
                menurecolte.Menu["Menu :"].b = {}
                table.insert(menurecolte.Menu["Menu :"].b, { name = "Commencer la récolte de ~b~"..name, ask = "", askX = true})
                CreateMenu(menurecolte)
            end
        else
            StopRecolte()
            Wait(1000)
        end
        Wait(0)
    end
end)

function recoltedrugs()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)

	for _, v in pairs(RecolteDrogue) do
		local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, pos['x'], pos['y'], pos['z'], true)
        item = v.item
        name = v.name
		if distance <= 3 then
            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~menu")
            DrawMarker(6, v.x, v.y, v.z, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)
			return true
        end
	end
end

function StopRecolte()
    item = false 
    if recolte then
    	recolte = false
    end
end

function StartRecolte()
    if not recolte then
        recolte = true
    while recolte do
        Wait(2000)
        TriggerServerEvent('Tikoz:RecolteDrugs', name, item)
    end
    else
        recolte = false
    end
end


menutraite = {
    Base = {Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Traitement"},
    Data = {currentMenu = "Menu :"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencer le traitement de ~b~"..name then
                StartTraitement()
            end
        end,
},
    Menu = {
        ["Menu :"] = {
            b = {
            }
        }
    }
}


CreateThread(function()
    while true do
        if traitementdrugs() then
            if IsControlJustPressed(1, 51) then
                menutraite.Menu["Menu :"].b = {}
                table.insert(menutraite.Menu["Menu :"].b, { name = "Commencer le traitement de ~b~"..name, ask = "", askX = true})
                CreateMenu(menutraite)
            end
        else
            StopTraitement()
            Wait(1000)
        end
        Wait(0)
    end
end)

function traitementdrugs()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)

	for _, v in pairs(TraitementDrogue) do
		local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, pos['x'], pos['y'], pos['z'], true)
        item = v.item
        name = v.name
        need = v.need
		if distance <= 3 then
            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~menu")
            DrawMarker(6, v.x, v.y, v.z, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)
			return true
        end
	end
end

function StopTraitement()
    item = false 
    need = false
    if traitedrugs then
    	traitedrugs = false
    end
end

function StartTraitement()
    if not traitedrugs then
        traitedrugs = true
    while traitedrugs do
        Wait(2000)
        TriggerServerEvent('Tikoz:TraitementDrugs', name, item, need)
    end
    else
        traitedrugs = false
    end
end

menuvente = {
    Base = {Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 251, 255}, Title = "Vente"},
    Data = {currentMenu = "Menu :"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)

            if btn.name == "Commencer la vente de ~b~"..name then
                StartVente()
            end
        end,
},
    Menu = {
        ["Menu :"] = {
            b = {
            }
        }
    }
}


CreateThread(function()
    while true do
        if Ventedrugs() then
            if IsControlJustPressed(1, 51) then
                menuvente.Menu["Menu :"].b = {}
                table.insert(menuvente.Menu["Menu :"].b, { name = "Commencer la vente de ~b~"..name, ask = "", askX = true})
                CreateMenu(menuvente)
            end
        else
            StopVente()
            Wait(1000)
        end
        Wait(0)
    end
end)

function Ventedrugs()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)

	for _, v in pairs(VenteDrogue) do
		local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, pos['x'], pos['y'], pos['z'], true)
        item = v.item
        name = v.name
        min = v.min
        max = v.max
		if distance <= 3 then
            ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~menu")
            DrawMarker(6, v.x, v.y, v.z, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)
			return true
        end
	end
end

function StopVente()
    item = false 
    if ventetdrugs then
    	ventetdrugs = false
    end
end

function StartVente()
    if not ventetdrugs then
        ventetdrugs = true
    while ventetdrugs do
        Wait(2000)
        TriggerServerEvent('Tikoz:VenteDrugs', name, item, min, max)
    end
    else
        ventetdrugs = false
    end
end
