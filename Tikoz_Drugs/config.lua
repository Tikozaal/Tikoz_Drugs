Config = {}

RecolteDrogue = { -- name = le nom pour le bouton, item = le nom de l'item que vous voulez récolté 
    {name = "Weed", item = "weed", x = -324.2, y = -955.48, z = 30.08},
    {name = "Coke", item = "coke", x = -322.43, y = -951.76, z = 30.08},
    {name = "Meth", item = "meth", x = -321.31, y = -948.27, z = 30.08},
    {name = "Opium", item = "opium", x = -319.74, y = -944.94, z = 30.08}
}

TraitementDrogue = { -- name = le nom pour le bouton, need = l'item qu'il vous faut pour traiter, item = l'item que vous voulez récuperer 
    {name = "Weed", need = "weed", item = "weed_pooch", x = -328.18, y = -953.63, z = 30.08},
    {name = "Coke", need = "coke", item = "coke_pooch", x = -326.57, y = -950.55, z = 30.08},
    {name = "Meth", need = "meth", item = "meth_pooch", x = -326.21, y = -946.64, z = 30.08},
    {name = "Opium", need = "opium", item = "opium_pooch", x = -324.51, y = -943.24, z = 30.08}
}

VenteDrogue = { -- name = le nom pour le bouton, item = le nom de l'item que vous voulez vendre, min et max = le prix lors de la vente 
    {name = "Weed", item = "weed_pooch", min = 5, max = 10, x = -313.92, y = -958.65, z = 30.08},
    {name = "Coke", item = "coke_pooch", min = 10, max = 20, x = -312.62, y = -955.16, z = 30.08},
    {name = "Meth", item = "meth_pooch", min = 30, max = 40, x = -311.23, y = -951.93, z = 30.08},
    {name = "Opium", item = "opium_pooch", min = 40, max = 50, x = -310.2, y = -948.29, z = 30.08}
}