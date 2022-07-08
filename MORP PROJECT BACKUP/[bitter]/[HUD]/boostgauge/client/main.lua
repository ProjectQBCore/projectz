local maxBoost = 20.0
local lastBoost

Update = function()
  DisplayHud(false)

  local boost = 0.0
  SetVehicleTurboPressure(GetVehiclePedIsIn(GetPlayerPed(-1),false),boost)
  while true do
    local ped = GetPlayerPed(-1)
    local veh = (IsPedInAnyVehicle(ped,false) and GetVehiclePedIsIn(ped,false) or false)
    local modkit = GetVehicleModKit(veh)
    local turbo = (veh and IsToggleModOn(veh,18))
    if veh and turbo and turbo ~= -1 then
      if not hudDisplayed then
        DisplayHud(true)
      end

      local accel   = GetControlNormal(0,71)
      local clutch  = GetVehicleClutch(veh)
      local rpm     = GetVehicleCurrentRpm(veh)
      local mod     = accel * clutch * math.max(0.0,rpm - 0.4)
      local cBoost  = maxBoost*mod*3
      if cBoost > maxBoost then cBoost = maxBoost; end
      if not lastBoost then lastBoost = cBoost; end
      if lastBoost ~= cBoost then
        local difference = cBoost - lastBoost
        if difference > 0.0 then
          difference = math.min(0.5,math.max(0.01,difference/100))
        else
          difference = math.max(-0.5,math.min(-0.01,difference/100))
        end
        lastBoost = math.max(0.0,lastBoost + (difference*5))
      end

      SendNUIMessage({
        type = "set",
        boost = (lastBoost / maxBoost)
      })
    else
      if hudDisplayed then
        DisplayHud(false)
      end
    end
    Wait(0)
  end
end

DisplayHud = function(display)
  hudDisplayed = display
  SendNUIMessage({
    type = "display",
    display = display
  })
end

HelpNotification = function(msg)
  AddTextEntry('boostHelper', msg)
  BeginTextCommandDisplayHelp('boostHelper')
  EndTextCommandDisplayHelp(0, false, true, -1)
end

Round = function(val, scale)
  val,scale = val or 0, scale or 0
  return (
    val < 0 and  math.floor((math.abs(val*math.pow(10,scale))+0.5))*math.pow(10,((scale)*-1))*(-1)
             or  math.floor((math.abs(val*math.pow(10,scale))+0.5))*math.pow(10,((scale)*-1))
  )
end

Citizen.CreateThread(Update)