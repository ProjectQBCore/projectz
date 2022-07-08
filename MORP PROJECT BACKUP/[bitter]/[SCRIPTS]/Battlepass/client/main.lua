RegisterKeyMapping(Config.CheckMyLevelCommand, 'Check My Level', 'keyboard', Config.CheckMyLevelControl) -- This will do the same as Config.CheckMyLevelCommand, but this will triggered by pressing i. You can change the i to another letter.

RegisterKeyMapping(Config.MyBattlePass, 'Check My BattlePass Information', 'keyboard', Config.CheckMyBattlePassControl) -- This will do the same as Config.MyBattlePass, but this will triggered by pressing o. You can change the o to another letter.

local EventCode
local MYXP

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Wait(500)
	while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
	Wait(2000)
	TriggerServerEvent("getxp")
	while not MYXP do
		Wait(10)
	end

	Wait(500)
	local xpatual = MYXP
	local MyBeginNivel, MyEndNivel = GetIniFiniLevelfrmxp(xpatual)
	local MyActualNvl = GetMyActualNvl(xpatual)
	ShowMyInfo(MyBeginNivel,MyEndNivel,xpatual,xpatual,MyActualNvl,false)
end)

RegisterNetEvent('GetEventCodes')
AddEventHandler('GetEventCodes', function(CD)
	EventCode = CD
end)

local floord, floorh, floorm, textito
local itemdata, mmenu2
local tempo
local tmp2
local breakloop = false
local _menuPool = NativeUI.CreatePool()
RegisterNetEvent('BattlePass:GetMyXP')
AddEventHandler('BattlePass:GetMyXP', function(XP,teste,teste2,noloop)
	tempo = teste
	tmp2 = teste2
	MYXP = XP
	if noloop and mmenu2 then
		if mmenu2:Visible() then
			_menuPool:CloseAllMenus()
			AbrirMenu()
		end
	else
		ComecLoop()
	end
end)

RegisterNetEvent('BattlePass:AddXP')
AddEventHandler('BattlePass:AddXP', function(XPadded)
	local nvlbefore = GetMyActualNvl(MYXP)
	local somaxp = MYXP+XPadded
	local configstuff = Config.RewardsAndStuff[#Config.RewardsAndStuff]
	local xpaltura = MYXP
	MYXP = somaxp
	local nvldps = GetMyActualNvl(somaxp)
	local dif = nvldps - nvlbefore
	if dif > 0 then
		Wait(500)
		PlaySoundFrontend(-1, "Friend_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true)
		local xpini, xpfini = GetIniFiniLevelfrmlvl(nvlbefore)
		ShowMyInfo(xpini, xpfini, xpaltura, xpfini, nvlbefore, false)
		for i = 1, dif,1 do 
			Wait(500)
			if dif == i then
				local newlvlit = nvlbefore+i
				local xpinix, xpfinix = GetIniFiniLevelfrmlvl(newlvlit)
				ShowMyInfo(xpinix, xpfinix, xpinix, somaxp, newlvlit, false)
			else
				local newlvlit = nvlbefore+i
				local xpinix, xpfinix = GetIniFiniLevelfrmlvl(newlvlit)
				ShowMyInfo(xpinix, xpfinix, xpinix, xpfinix, newlvlit, false)
			end
		end
	else
		Wait(500)
		PlaySoundFrontend(-1, "Friend_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true)
		local xpini, xpfini = GetIniFiniLevelfrmlvl(nvlbefore)
		ShowMyInfo(xpini, xpfini, xpaltura, somaxp, nvlbefore, false)
	end
end)

function ComecLoop()
	Citizen.CreateThread(function()
		while true do
			if tempo then
				local temprestante = (((tmp2-tempo)/60)/60)/24
				floord = math.floor(temprestante)
				floorh = math.floor((temprestante-floord)*24)
				floorm = math.floor(((temprestante-floord)*24-floorh)*60)
				textito = string.format(Config.Messages["timetextlittle"],floord,floorh,floorm)
				local nvlbefore = GetMyActualNvl(800)
				local nvldps = GetMyActualNvl(900+1200)
				local dif = nvldps - nvlbefore
			end
			Wait(10000)
			tempo = tempo+10
			if itemdata and mmenu2 then
				itemdata:Description(string.format(Config.Messages["timetextphrase"],floord,floorh,floorm))
				itemdata:RightLabel("~b~"..textito.."")
				mmenu2:DrawCalculations()
			end
		end
	end)
end
RegisterNetEvent('BattlePass:RemXP')
AddEventHandler('BattlePass:RemXP', function(XPrem)
	local nvlbefore = GetMyActualNvl(MYXP)
	local somaxp = MYXP-XPrem
	local xpaltura = MYXP
	MYXP = somaxp
	local nvldps = GetMyActualNvl(somaxp)
	local dif = math.abs(nvldps - nvlbefore)
	if dif > 0 then
		Wait(500)
		local xpini, xpfini = GetIniFiniLevelfrmlvl(nvlbefore)
		ShowMyInfo(xpini, xpfini, xpaltura, xpini, nvlbefore, true)
		for i = 1, dif,1 do 
			Wait(500)
			if dif == i then
				local newlvlit = nvlbefore-i
				local xpinix, xpfinix = GetIniFiniLevelfrmlvl(newlvlit)
				ShowMyInfo(xpinix, xpfinix, xpfinix, somaxp, newlvlit, true)
			else
				local newlvlit = nvlbefore-i
				local xpinix, xpfinix = GetIniFiniLevelfrmlvl(newlvlit)
				ShowMyInfo(xpinix, xpfinix, xpfinix, xpinix, newlvlit, true)
			end
		end
	else
		Wait(500)
		local xpini, xpfini = GetIniFiniLevelfrmlvl(nvlbefore)
		ShowMyInfo(xpini, xpfini, xpaltura, somaxp, nvlbefore, true)
	end
end)

function GetIniFiniLevelfrmlvl(lvl)
	local init = 0
	local finit = 800
	if lvl > 1 then
		for i = 1, #Config.RewardsAndStuff do 
			if i == lvl then
				init = Config.RewardsAndStuff[i-1].xp
				finit = Config.RewardsAndStuff[i].xp
			end
		end
	end
	return init,finit
end

function GetIniFiniLevelfrmxp(xp)
	local init, finit = 0
	init, finit = GetIniFiniLevelfrmlvl(GetMyActualNvl(xp))
	return init, finit
end

function GetMyActualNvl(xp)
	local actualnvl = 1
	local level = 0
	for k,v in pairs(Config.RewardsAndStuff)do
		if xp >= v.xp then
			level = k+1
		end
	end
	if level == 0 then
		return 1
	end
	return level
end

RegisterCommand(Config.CheckMyLevelCommand, function(source, args, rawCommand)
	local xpatual = MYXP
	local MyBeginNivel, MyEndNivel = GetIniFiniLevelfrmxp(xpatual)
	local MyActualNvl = GetMyActualNvl(xpatual)
	ShowMyInfo(MyBeginNivel,MyEndNivel,xpatual,xpatual,MyActualNvl,false)
end)


RegisterCommand(Config.MyBattlePass, function(source, args, rawCommand)
	if mmenu2 ~= nil then
		if not mmenu2:Visible() then
			AbrirMenu()
		end
	else
		AbrirMenu()
	end
end)
function AbrirMenu()
	local totalnvls = #Config.RewardsAndStuff
	local mainMenu = NativeUI.CreateMenu(Config.Messages["MenuTitle"], Config.Messages["MenuDescription"])
	_menuPool:Add(mainMenu)
	local newitem = NativeUI.CreateItem(Config.Messages["MenuTotalLevelsTitle"], string.format(Config.Messages["MenuTotalLevelsDesc"],totalnvls))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..totalnvls)
	---------
	while not MYXP do
		Wait(10)
	end
	newitem = NativeUI.CreateItem(Config.Messages["MenuCurrLevelsTitle"], string.format(Config.Messages["MenuCurrLevelsDesc"],GetMyActualNvl(MYXP)))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..GetMyActualNvl(MYXP))
	---------
	local percentagem = math.floor((MYXP*100)/Config.RewardsAndStuff[totalnvls].xp)
	local mesage = string.format(Config.Messages["MenuProgressDesc"],percentagem)
	local clr = "~r~"
	if percentagem <= 25 then
		local clr = "~r~"
	elseif percentagem <= 50 then	
		clr = "~g~"
	elseif percentagem <= 75 then	
		clr = "~b~"
	elseif percentagem < 100 then	
		clr = "~g~"
	elseif percentagem == 100 then
		clr = "~g~"
		mesage = Config.Messages["MenuProgressBPCompleted"]
	end
	newitem = NativeUI.CreateItem(Config.Messages["MenuProgressTitle"], clr..mesage)
    mainMenu:AddItem(newitem)
	newitem:RightLabel(clr..percentagem.."%")
	-------------------
	local xpnec = Config.RewardsAndStuff[totalnvls].xp-MYXP
	newitem = NativeUI.CreateItem(Config.Messages["MenuMyXPTitle"], string.format(Config.Messages["MenuMyXPDec"],MYXP))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..MYXP.." XP")
	-------------------------
	newitem = NativeUI.CreateItem(Config.Messages["MenuXPEndTitle"], string.format(Config.Messages["MenuXPEndDec"],xpnec))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..xpnec.." XP")
	-------------------
	xpnec = Config.RewardsAndStuff[GetMyActualNvl(MYXP)].xp-MYXP
	newitem = NativeUI.CreateItem(Config.Messages["MenuXPNxtLvlTitle"], string.format(Config.Messages["MenuXPNxtLvlDec"],xpnec))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..xpnec.." XP")
	------------------------
	xpnec = Config.RewardsAndStuff[GetMyActualNvl(MYXP)].xp-MYXP
	newitem = NativeUI.CreateItem(Config.Messages["MenuTimeLeftTitle"], string.format(Config.Messages["timetextphrase"],floord,floorh,floorm))
    mainMenu:AddItem(newitem)
	newitem:RightLabel("~b~"..textito.."")
	itemdata = newitem
	mmenu2 = mainMenu
	--------------------------------------------------
	local Description = ""
    local Niveis = {}
	for i = 1, #Config.RewardsAndStuff do 
		table.insert(Niveis,i)
	end
    local Item = NativeUI.CreateListItem(Config.Messages["MenuRewardsTitle"], Niveis, 1, Description)
    mainMenu:AddItem(Item)
	Item:Description(Config.RewardsAndStuff[1].RewardsLabel)
	local item23 = Item
    mainMenu.OnListChange = function(sender, item, index)
        if item == Item then
			item23:Description(Config.RewardsAndStuff[index].RewardsLabel)
			mainMenu:DrawCalculations()
            local currentSelectedIndex = item:IndexToItem(index)
        end
    end
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainMenu:Visible(true)
	while true do
        Citizen.Wait(5)
		if mainMenu:Visible() then
			_menuPool:ProcessMenus()
		else
			_menuPool:RefreshIndex()
			break
		end
    end
end

function ShowMyInfo(Beginnvl,Endnvl,xpbfr,xpaft,nvl,removes,time)
	local animspeed = 3000
	if time then
		animspeed = 9000
	end
	if not HasHudScaleformLoaded(19) then
		RequestHudScaleform(19)	
		while not HasHudScaleformLoaded(19) do
			Wait(1)
		end
	end
	BeginScaleformMovieMethodHudComponent(19, "SET_COLOUR")
	
	PushScaleformMovieFunctionParameterInt(116)
    PushScaleformMovieFunctionParameterInt(140)
	EndScaleformMovieMethodReturn()
	
	if removes then
		local corb = Config.LooseBarColor
		local corc = Config.LooseCircleColor
		ReplaceHudColourWithRgba(116, corb.r, corb.g, corb.b, corb.a)
		ReplaceHudColourWithRgba(140, corc.r, corc.g, corc.b, corc.a)
	else
		local corb = Config.BarColor
		local corc = Config.CircleColor
		ReplaceHudColourWithRgba(116, corb.r, corb.g, corb.b, corb.a)
		ReplaceHudColourWithRgba(140, corc.r, corc.g, corc.b, corc.a)
	end
  
	BeginScaleformMovieMethodHudComponent(19, "SET_RANK_SCORES")
	PushScaleformMovieFunctionParameterInt(Beginnvl)
	PushScaleformMovieFunctionParameterInt(Endnvl)
	PushScaleformMovieFunctionParameterInt(xpbfr)
	PushScaleformMovieFunctionParameterInt(xpaft)
	PushScaleformMovieFunctionParameterInt(nvl)
	PushScaleformMovieFunctionParameterInt(100)
    EndScaleformMovieMethodReturn()
	
	BeginScaleformMovieMethodHudComponent(19, "OVERRIDE_ANIMATION_SPEED")
	PushScaleformMovieFunctionParameterInt(animspeed)
    EndScaleformMovieMethodReturn()
end