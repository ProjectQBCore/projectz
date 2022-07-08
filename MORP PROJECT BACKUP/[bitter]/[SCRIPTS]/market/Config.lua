
-- Add here the items you want to allow to be sold.
-- Images must be included in the img folder in png, jpg or gif format
-- name = name of the item in the database
-- label = name of the item that is shown to the player
-- price_recommended is the recommended price for each item.
list_products = {
    {name="bread", label = "Bread", img = "img/bread.png", price_recommended = 50},
    {name="backpack", label = "Backpack", img = "img/backpack.png", price_recommended = 75},
    {name="kitmedic", label = "Kit Medic", img = "img/backpack.png", price_recommended = 75},
    {name="revolver", label = "Revolver", img = "img/backpack.png", price_recommended = 75},
}

Config = {
    positionX   = "50%",
    positionY   = "50%",
    size        = "1.0",
}

-- Configure the public and log WEBHOOK here
WEBHOOKS = {
    -- Here is placed the Webhook of the public discord channel
    PUBLIC_WEBHOOK      = "",
    TITLE_ANNOUNCE_ITEM = "New item offered for sale!",
    COLOR_ANNOUNCE      = 3066993, -- GREEN

    -- Here is the Webhook of logs for admin.
    ADMIN_WEBHOOK       = "",
    TITLE_BUY_ITEM      = "Market: purchased item",
    COLOR_BUY           = 3066993, -- GREEN
    TITLE_REMOVE_ITEM   = "Market: item removed",
    COLOR_REMOVE        = 15158332, -- red


    -- Put Footer with a name you want and your server image.
    DISCORD_IMAGE       = "https://dunb17ur4ymx4.cloudfront.net/webstore/logos/2fbe8cb923d1f82c29f6b4ef71b9dbe1c917af7b.png",
    DISCORD_FOOTER      = "Legendary Team",
    DISCORD_FOOTER_IMG  = "https://dunb17ur4ymx4.cloudfront.net/webstore/logos/2fbe8cb923d1f82c29f6b4ef71b9dbe1c917af7b.png",


    -- COLORS = {
    --     AQUA                = 1752220,
    --     GREEN               = 3066993,
    --     BLUE                = 3447003,
    --     PURPLE              = 10181046,
    --     GOLD                = 15844367,
    --     ORANGE              = 15105570,
    --     RED                 = 15158332,
    --     GREY                = 9807270,
    --     DARKER_GREY         = 8359053,
    --     NAVY                = 3426654,
    --     DARK_AQUA           = 1146986,
    --     DARK_GREEN          = 2067276,
    --     DARK_BLUE           = 2123412,
    --     DARK_PURPLE         = 7419530,
    --     DARK_GOLD           = 12745742,
    --     DARK_ORANGE         = 11027200,
    --     DARK_RED            = 10038562,
    --     DARK_GREY           = 9936031,
    --     LIGHT_GREY          = 12370112,
    --     DARK_NAVY           = 2899536,
    --     LUMINOUS_VIVID_PINK = 16580705,
    --     DARK_VIVID_PINK     = 12320855
    -- }
}

translate = {
    -- Graphical interface translations
    TR_TITLE            = "Market",
    TR_SUBTITLE         = "Put or buy something for sale",
    TR_OPTIONS_TITLE    = "OPTIONS MARKET",
    TR_OPTIONS_1        = "Adverts:",
    TR_OPTIONS_2        = "My Ads:",
    TR_ANNOUNCES        = "adverts",
    TR_SEARCH           = "Search for a product",
    TR_BY_OWNER         = "By:",
    TR_SIMBOL_MONEY     = "$ ",
    TR_WEIGHT           = "Weight:",
    TR_DISPONIBLE       = "Available:",
    TR_UNITS            = "units",
    TR_TOTAL_PRICE      = "Total price:",
    TR_BUTTON_BUY       = "Buy",
    TR_BUTTON_ANNOUNCE  = "Announce",
    TR_BUTTON_REMOVE    = "Remove",
    TR_BUTTON_CANCEL    = "Cancel",
    TR_MODAL_TITLE      = "Advertise Product",
    TR_MODAL_ITEM       = "Item",
    TR_MODAL_AMOUNT     = "Amount:",
    TR_MODAL_PRICE      = "Price per unit",
    TR_MODAL_ANONYMOUS  = "Anonymous",

    -- Notification translations
    TR_DONT_FULL        = "Your inventory is too full.",
    TR_DONT_MONEY       = "You don't have enough money.",
    TR_SUCESS           = "Purchase successful",
    TR_REMOVED_ITEM     = "Item successfully removed",
    TR_DONT_AMOUNT      = "There aren't that many items for sale.",
    TR_NOT_FOUND        = "Item already sold or not found.",
    TR_ADVERTISE_ITEM   = "Successfully advertised item.",
    TR_DONT_AMOUNT2     = "You don't have that amount.",    
    TR_DONT_SELF        = "You cannot buy your own item.",

    -- Translations of the public Webhook.
    TR_WEBHOOK_OWNER    = "Announced by: ",
    TR_WEBHOOK_AMOUNT   = "Available amount: ",
    TR_WEBHOOK_PRICE    = "Price per unit: ",

    -- Translations from Webhook to Log admin.
    TR_WEBHOOK_LOG_BUY          = "Purchased item",
    TR_WEBHOOK_LOG_BUY_BY       = "Purchased by: ",
    TR_WEBHOOK_LOG_BUY_AMOUNT   = "Amount: ",
    TR_WEBHOOK_LOG_BUY_PRICE    = "Price: ",
    TR_WEBHOOK_LOG_REMOVE       = "Item removed: ",
}