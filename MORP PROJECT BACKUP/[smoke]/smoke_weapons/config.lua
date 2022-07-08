Config                = {}
Config.DrawDistance   = 100
Config.Size           = { x = 1.5, y = 1.5, z = 1.5 }
Config.Color          = { r = 0, g = 128, b = 255 }
Config.Type           = 1
Config.Locale         = 'en'
Config.EnableLicense  = true
Config.LicensePrice   = 30000

Config.Zones = {

    GunShop = {
        legal = 0,
        Items = {
            {name  = "WEAPON_PISTOL", price = 100, label = "Pistol"} -- d
        },
        Items1 = {
            {name  = "WEAPON_APPISTOL", price = 100, label = "Automatic Pistol"} -- c
        },
        Items2 = {
            {name  = "WEAPON_PISTOL50", price = 100, label = "Deagle"} -- b
        },
        Items3 = {
            {name  = "WEAPON_MG", price = 100, label = "LMG"} -- a
        },
        Items4 = {
            {name  = "WEAPON_MINIGUN", price = 100, label = "MINIGUN"} -- s
        },
        Pos   = {
            { x = -1067.83,   y = 4932.9,   z = 210.80 },

        }
    },

    BlackWeashop = {
        legal = 1,
        Items = {},
        Pos   = {
            { x = -1306.239,   y = -394.018,  z = 35.695 },
        }
    },

}
