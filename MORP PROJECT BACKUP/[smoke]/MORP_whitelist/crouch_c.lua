local prone = true
local movFwd = true
local ctrlStage = 0
local camon = false
local shitcam = 0

function crouchMovement()
	RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Citizen.Wait(0)
    end

  	SetPedMovementClipset(GetPlayerPed(-1), "move_ped_crouched",1.0)
    SetPedWeaponMovementClipset(GetPlayerPed(-1), "move_ped_crouched",1.0)
  	SetPedStrafeClipset(GetPlayerPed(-1), "move_ped_crouched_strafing",1.0)
end

RegisterNetEvent("fuckthis")
AddEventHandler("fuckthis",function()

	while firstPersonActive do
		Citizen.Wait(1)
		local crouchpos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.127,-0.29,0.801)
		if (not DoesCamExist(shitcam)) then
			shitcam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
			SetCamCoord(shitcam, crouchpos)
			SetCamRot(shitcam, 0.0, 0.0, GetEntityHeading(GetPlayerPed(-1)))
			SetCamActive(shitcam,  true)
			RenderScriptCams(true,  false,  0,  true,  true)
			SetCamCoord(shitcam, crouchpos)
			SetCamFov(shitcam, 60.0)
		end

		SetCamCoord(shitcam, crouchpos)
		SetCamRot(shitcam, GetGameplayCamRelativePitch(), 0.0, GetEntityHeading(GetPlayerPed(-1)) + GetGameplayCamRelativeHeading())
		 if IsControlJustReleased(0, INPUT_AIM) then
		 	firstPersonActive = false
		 end
	end

	if (DoesCamExist(shitcam)) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(shitcam, false)
	end

end)
local fixprone = false
RegisterNetEvent("fixprone")
AddEventHandler("fixprone",function()
	if ctrlStage == 2 then
		fixprone = true
	end
end)


function doCrouchIn()

--	RequestAnimDict("swimming@swim")
--	while not HasAnimDictLoaded("swimming@swim") do
--		Citizen.Wait(0)
--	end

--	TaskPlayAnim(GetPlayerPed(-1), "swimming@swim", "recover_down_to_idle", 0.8, 0.8, 1.0, 49, 0, 0, 0, 0)

--	Citizen.Wait(420)
	crouchMovement()
end

myWep = 0
local runningMovement = false
--[[RegisterNetEvent("proneMovement")
AddEventHandler("proneMovement",function()
	if runningMovement then
		return
	end
	runningMovement = true

	if ((IsControlPressed(1,32)) and not movFwd) or (fixprone and (IsControlPressed(1,32))) and not isDead then
		fixprone = false
		movFwd = true
		SetPedMoveAnimsBlendOut(GetPlayerPed(-1))
		local pronepos = GetEntityCoords(GetPlayerPed(-1))
		TaskPlayAnimAdvanced(GetPlayerPed(-1), "move_crawl", "onfront_fwd", pronepos["x"],pronepos["y"],pronepos["z"]+0.1, 0.0, 0.0, GetEntityHeading(GetPlayerPed(-1)), 100.0, 0.4, 1.0, 7, 2.0, 1, 1)
		Citizen.Wait(500)
	elseif ( not (IsControlPressed(1,32)) and movFwd) or (fixprone and not (IsControlPressed(1,32))) then
		fixprone = false
		curWep = GetSelectedPedWeapon(GetPlayerPed(-1))
		myWep =  GetSelectedPedWeapon(GetPlayerPed(-1))
		local pronepos = GetEntityCoords(GetPlayerPed(-1))
		TaskPlayAnimAdvanced(GetPlayerPed(-1), "move_crawl", "onfront_fwd", pronepos["x"],pronepos["y"],pronepos["z"]+0.1, 0.0, 0.0, GetEntityHeading(GetPlayerPed(-1)), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
		Citizen.Wait(500)
		movFwd = false
	end
	runningMovement = false

end)
]]
local foreskin = false
local timelimit = 0
local isHolding = false
local isFlying = false
-- 0 = default, 1 = crouch, 2 = prone
incrouch = true

Citizen.CreateThread(function()

	local Triggered1 = false
	local Triggered2 = false

	while true do

		if ctrlStage == 3 then

			if IsControlJustPressed(2, 36) then
				firstPersonActive = false
				ctrlStage = 0
				TriggerEvent("AnimSet:Set")
				jumpDisabled = false
				SetPedStealthMovement(GetPlayerPed(-1),0,0)
				
			else
				if not Triggered3 then
					ClearPedTasks(GetPlayerPed(-1))
					Triggered1 = false
					Triggered2 = false
					Triggered3 = true
					crouchMovement()

				else
					if IsControlJustReleased(1,73) then
						SetPedStealthMovement(GetPlayerPed(-1),true,"")
						firstPersonActive = false
						ctrlStage = 0

						TriggerEvent("AnimSet:Set")

					    Citizen.Wait(100)
					    ClearPedTasks(GetPlayerPed(-1))

						jumpDisabled = false

						
						Citizen.Wait(500)
						SetPedStealthMovement(GetPlayerPed(-1),false,"")
						Triggered3 = false

					else
					  	if GetEntitySpeed(GetPlayerPed(-1)) > 1.0 and not incrouch then
					  		incrouch = true
						  	SetPedWeaponMovementClipset(GetPlayerPed(-1), "move_ped_crouched",1.0)
						  	SetPedStrafeClipset(GetPlayerPed(-1), "move_ped_crouched_strafing",1.0)
						elseif incrouch and GetEntitySpeed(GetPlayerPed(-1)) < 1.0 and (GetFollowPedCamViewMode() == 4 or GetFollowVehicleCamViewMode() == 4) then

							incrouch = false
					        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
					        ResetPedStrafeClipset(GetPlayerPed(-1))
						end
					end
				end
			end
		end



		if ctrlStage == 2 then

			if IsControlJustPressed(2,23) then
				ClearPedTasks(GetPlayerPed(-1))
				firstPersonActive = false
				ctrlStage = 0
				TriggerEvent("AnimSet:Set")
				jumpDisabled = false
				SetPedStealthMovement(GetPlayerPed(-1),0,0)
				
			else


				DisableControlAction( 0, 21, true ) -- sprint


				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)

				if not Triggered2 then
					ClearPedTasks(GetPlayerPed(-1))
--[[					RequestAnimSet("move_crawl")
				    while not HasAnimSetLoaded("move_crawl") do
				        Citizen.Wait(0)
				    end]]

					Triggered2 = true
					Triggered1 = false
					Triggered3 = false
					fixprone = true

					--TriggerEvent("proneMovement")
				else
					if IsControlJustReleased(1,20) then
--[[						local pronepos = GetEntityCoords(GetPlayerPed(-1))
						TaskPlayAnimAdvanced(GetPlayerPed(-1), "move_crawl", "onfront_fwd", pronepos["x"],pronepos["y"],pronepos["z"]+0.2, 0.0, 0.0, GetEntityHeading(GetPlayerPed(-1)), 1.0, 1.0, 1.0, 7, 2.0, 0, 0)
						Citizen.Wait(50)
						ClearPedTasks(GetPlayerPed(-1))
						firstPersonActive = false
						ctrlStage = 0
						TriggerEvent("AnimSet:Set")
						jumpDisabled = false
						SetPedStealthMovement(GetPlayerPed(-1),0,0)
]]						
						Citizen.Wait(500)
					else

						if IsControlPressed(1,34) then
							SetEntityHeading(GetPlayerPed(-1),GetEntityHeading(GetPlayerPed(-1)) + 1)
						end

						if IsControlPressed(1,9) then
							SetEntityHeading(GetPlayerPed(-1),GetEntityHeading(GetPlayerPed(-1)) - 1)
						end


						--TriggerEvent("proneMovement")
					end
				end
			end

		end
		if timelimit > 0 then
			timelimit = timelimit - 1
		end

		if IsControlJustReleased(1,20) and not IsPedSprinting(GetPlayerPed(-1)) and not ( IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) ) and not (handCuffed or handCuffedWalking or isDead == 1) then
			if GetPedStealthMovement(GetPlayerPed(-1)) then
				SetPedStealthMovement(GetPlayerPed(-1),0,0)
			end
			firstPersonActive = false
--			ctrlStage = 2
		end

		if IsControlJustReleased(1,20) then

			if robbing then
			end
			if not robbing then
				if IsPedSprinting(GetPlayerPed(-1)) then
					if GetPedStealthMovement(GetPlayerPed(-1)) then
						SetPedStealthMovement(GetPlayerPed(-1),0,0)
					end
					firstPersonActive = false

--[[					TaskPlayAnim(GetPlayerPed(-1), "move_jump", "dive_start_run", 25.0, 0.6, -1, 0, 0.0, 0, 0, 0)
					Citizen.Wait(1000)
					ctrlStage = 2]]
				else
					if GetPedStealthMovement(GetPlayerPed(-1)) then
						SetPedStealthMovement(GetPlayerPed(-1),0,0)
					end
					firstPersonActive = false
--[[					TaskPlayAnim(GetPlayerPed(-1), "move_crawl", "onfront_fwd", 1.0, 1.0, -1, 1, 0.0, 0, 0, 0)
					Citizen.Wait(1000)
					ctrlStage = 2]]
				end
			else
				ctrlStage = 0
			end
		end

		if IsPedJacking(GetPlayerPed(-1)) or IsPedInMeleeCombat(GetPlayerPed(-1)) or IsControlJustReleased(1,22) or IsPedRagdoll(GetPlayerPed(-1)) or handCuffed or handCuffedWalking or isDead == 1 or ( IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) ) then
			if ctrlStage == 2 then
				local pronepos = GetEntityCoords(GetPlayerPed(-1))
--				TaskPlayAnimAdvanced(GetPlayerPed(-1), "move_crawl", "onfront_fwd", pronepos, 0.0, 0.0, GetEntityHeading(GetPlayerPed(-1)), -1.0, -1.0, 1.0, 7, 1.0, 1, 1)
				Citizen.Wait(500)
			end
			if ctrlStage ~= 0 then
				ClearPedTasks(GetPlayerPed(-1))
				firstPersonActive = false
				ctrlStage = 0
				TriggerEvent("AnimSet:Set")
				jumpDisabled = false
				SetPedStealthMovement(GetPlayerPed(-1),0,0)
				
				Triggered1 = false
				Triggered2 = false
				Triggered3 = false
			end

		end
		Citizen.Wait(1)

		if IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) then
			Citizen.Wait(1000)
		end
	end
end)

local tempenabled = false
local tempset = "move_m@injured"
RegisterNetEvent('AnimSet:Set:temp');
AddEventHandler('AnimSet:Set:temp', function(enabled,enabledSet)
    tempenabled = enabled
    tempset = enabledSet
    TriggerEvent("AnimSet:Set")
end)


local crouched = false
local crouchKey = 36

Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 1 )
		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) then 
			DisableControlAction( 0, crouchKey, true ) 
			if not IsPauseMenuActive() then 
				if IsDisabledControlJustPressed(0,crouchKey)then 
					RequestAnimSet( "move_ped_crouched" )
					
					while not HasAnimSetLoaded( "move_ped_crouched" ) do 
						Citizen.Wait(100)
					end 		
					if crouched then 
						ResetPedMovementClipset(ped)
						ResetPedStrafeClipset(ped)
						crouched = false 
					else
						SetPedMovementClipset(ped, "move_ped_crouched", 0.35 )
						SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
						crouched = true 
					end 
				end
			end
		else
			crouched = false
		end
	end
end)
