---------------------------------------------------------------------
                --[[SCRIPT MADE BY : ALEXMIHAI04]]--
               --[[DO NOT SELL OR COPY THIS SCRIPT]]--
                   --[[github.com/ItsAlexYTB]]--
        --[[ENJOY THE SCRIPT , DO NOT MAKE 1000 NPCS :))))) ]]
---------------------------------------------------------------------

--[[EXPLANATION [EN]: 

-1,2,3 : Coordonates
-4 : Name for the drawtext
-5 : Ped heading
-6 : Ped hash
-7: Ped model

]]--

--[[DO NOT TOUCH IF YOU DON'T KNOW WHAT YOU DO]]--

--[[EXPLANATION [RO]
-1,2,3 : sunt coordonatele de la npc
-4 : Numele care apare deasupra npc-ului
-5 : Heading (partea in care sta orientat)
-6 : Hash de la ped , se poate lua de pe net
-7 : Modelul de la ped , asemenea , il gasiti pe net


]]--

local coordonate = {
	{-1144.56,4909.11,220.0,"daily reward",31.09,-132842964,"BF4RusEngineer"},
	{-1150.13,4940.6,221.27,"Weapons Attachment",251.81,-132842964,"BF4RusEngineer"},
	{-1132.44,4941.42,219.50,"Trader",246.83,-132842964,"BF4RusEngineer"},
    {453.26,-1021.22,27.36,"Customs",58.67,-132842964,"BF4RusEngineer"},
    {-1111.12,4937.71,217.32,"Shop",149.63,-132842964,"BF4RusEngineer"},
    {-1067.83,4932.9,210.80,"Buy Weapon ",118.99,-132842964,"BF4RusEngineer"},
    {-1149.02,4906.7,220.0,"Sell Weapon",304.83,-132842964,"BF4RusEngineer"},
    {-1115.45,4955.38,219.30,"Mask",49.7,-132842964,"BF4RusEngineer"},
    {-1115.45,4955.38,219.30,"Mask",49.7,-132842964,"BF4RusEngineer"},
    {-1119.78,4959.66,219.30,"Cloth",195.77,-132842964,"BF4RusEngineer"},
    {-1115.94,4959.13,219.30,"Accessoires",130.6,-132842964,"BF4RusEngineer"},
    {-1094.53,4951.31,217.30,"Mechanic",163.44,-132842964,"BF4RusEngineer"},---mechanic 1
    {-1025.64,4931.72,201.25,"PVT . Omega_01",327.9,-2024704891,"BF4UsSupport"},-- fornt baricate guard 1
    {-1044.61,4913.9,207.40,"PVT . Omega_02",293.13,-2024704891,"BF4UsSupport"},-- guard 2 main gate
    {-1041.74,4906.81,207.40,"PVT . Omega_03",293.04,-2024704891,"BF4UsSupport"},-- guard 3 main gate
    {-1044.85,4917.66,211.55,"PVT . Alpha_01",301.01,-2024704891,"BF4UsSupport"},--sniper in 1 wt (1st watch tower)
    {-1061.9,4967.57,212.37,"PVT . Alpha_02",281.8,-2024704891,"BF4UsSupport"} --sniper in 2 wt (1st watch tower)-1067.83,4932.9,221.0

}

--[[ local tbl=ObjToNet(CreateObjectNoOffset(GetHashKey("prop_toolchest_05"),-1113.51,4903.47,218.6,true,false)) ]]--

Citizen.CreateThread(function()

    AddRelationshipGroup("mil")
    SetRelationshipBetweenGroups(5, GetHashKey("mil"), GetHashKey("zombie"))
    SetRelationshipBetweenGroups(5, GetHashKey("zombie"), GetHashKey("mil"))

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("weapons@submg@f")
      while not HasAnimDictLoaded("weapons@submg@f") do
        Wait(1)
      end

      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      GiveWeaponToPed(ped, GetHashKey('WEAPON_BULLPUPRIFLE'), 250, false, true)
      SetCurrentPedWeapon(ped, GetHashKey('WEAPON_BULLPUPRIFLE'), true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      --GiveWeaponObjectToPed( 'WEAPON_CARBINERIFLE', ped)
      TaskPlayAnim(ped,"weapons@submg@f","idle", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

      SetPedRelationshipGroupHash(ped, GetHashKey("mil"))
    end
end)

Citizen.CreateThread(function()

    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~g~"..v[4], 1.2, 1)
                DrawText3D(x,y,z+1.95, "~w~welcome", 1.0, 1)
            end
        end
    end
end)


function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--[[ENJOY]]--