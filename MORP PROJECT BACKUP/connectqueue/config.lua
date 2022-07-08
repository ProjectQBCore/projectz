Config = {}
local Prefix = "Defferring connection "
Config.ServerName = "Mallu Official RolePlay" -- Enter your server name.
Config.DiscordServerID = 731079395548201000 -- Change To Your Server ID
Config.ApiLink = "" -- If you are using API.
Config.ApiKey = ""
Config.Roles = {
    GovDonatorSilver = {
        roleID = "820562158814887966",
        points = 600,
        name = "MORP Premium Diamond"
    },

    GovDonatorGold = {
        roleID = "820562079970230332",
        points = 1200,
        name = "MORP Premium Platinum"
    },

    GovDonatorDiamond = {
        roleID = "820561968187310081",
        points = 2000,
        name = "MORP Premium Crystal"
    },

    GovDonatorPlatinum = {
        roleID = "820561732115496960",
        points = 4000,
        name = "MORP Premium Titan"
    },

    Staff = {
        roleID = "731587232946978917",
        points = 5000,
        name = "Staff"
    },

    Owner = {
        roleID = "731079882636787842",
        points = 99999999999999999,
        name = "Owner"
    },

    Developer = {
        roleID = "731079886894006302",
        points = 999999999999999,
        name = "Developer"
    },

}

Config.Colors = {
	"accent",
	"good",
	"warning",
	"attention",
}

Config.OnlyInDiscord = false

Config.Verifiying = Prefix .. "Please wait, Downloading content from MORP Servers."
Config.VerifiyingLauncher = Prefix .. "Please wait, Verifiying you entered through the launcher."
Config.VerifiyingDiscord = Prefix .. "Please wait, Verifiying your Discord ID."
Config.VerifiyingSteam = Prefix .. "Please wait, Verifiying your Steam."
Config.VerifiyingQueue = Prefix .. "Please wait, Adding you to the queue."

Config.NotWhitelisted = Prefix .. "Sorry, You are not whitelisted in MORP Servers."
Config.NoDiscord = Prefix .. "Please make sure your Discord is open."
Config.NoSteam = Prefix .. "Please make sure your Steam is open."
Config.NoLauncher = Prefix .. "The server can only be accessed through its launcher."
Config.Blacklisted = Prefix .. "You're blacklisted from the server, Please Contact server ADMIN."

Config.Welcome = Prefix .. "Welcome to MORP!"
Config.Error = Prefix .. "Error, Please try again later."
Config.HandshakingWith = Prefix .. "Handshaking With MORP Servers."
