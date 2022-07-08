ESX = nil
local hurt = false
local player = PlayerPedId()
local injuredcounter = 0
Citizen.CreateThread(function()
	while true do
			Wait(0)
			if GetEntityHealth(GetPlayerPed(-1)) <= 159 then
				setHurt()
				StillInjured = true
				
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
				Citizen.Wait(3000)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
				Citizen.Wait(3000)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
			elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 160 then
				setNotHurt()
				showNotHurt()
			end
				if GetEntityHealth(GetPlayerPed(-1)) <= 145 then
					--	setHurt()
					StillInjured = true
				
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
					Citizen.Wait(1000)
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
					Citizen.Wait(1000)
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
					Citizen.Wait(1000)
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
					Citizen.Wait(1000)
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
					Citizen.Wait(1000)
					--blackout()
				end
					if GetEntityHealth(GetPlayerPed(-1)) <= 130 then
						setHurt()
						StillInjured = true
				
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
--							blackout()
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
							Citizen.Wait(750)
--							blackout()
							--blackout()
					end
			
							if  GetEntityHealth(GetPlayerPed(-1)) <= 120 then
								setHurt()
--								blackout()
								DisableControlAction(0, 22, true)
									ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
									chapohurt()
									Citizen.Wait(2000)
									ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
									Citizen.Wait(2000)
--									blackout()
									ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
									Citizen.Wait(2000)
									ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
									Citizen.Wait(2000)
--									blackout()
									ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
							end
		
				Citizen.Wait(6000)   -- here u can delay the loop :)
	end
end)



RegisterNetEvent('esx_chapo:health')
AddEventHandler('esx_chapo:health', function(source)
	local item = "health"
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
	local maxHealth = GetEntityMaxHealth(playerPed)
	local newHealth = 170
	local item = "health"
		if  GetEntityHealth(GetPlayerPed(-1)) <= 159 then
			if IsPedSittingInAnyVehicle(playerPed) then
			--[[ english
			TriggerEvent("pNotify:SendNotification",{
				text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You Can't use it in vehicle</font></p></center>",
				type = "error",
				timeout = (2500),
				layout = "centerleft",
				queue = "killer"
			})]]
---


			--arabic
			--[[	TriggerEvent("pNotify:SendNotification",{
                    text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>لا يمكن الاستعمال حاليا</font></p></center>",
                    type = "error",
                    timeout = (2500),
                    layout = "centerleft",
                    queue = "killer"
                })]]

		else
			if IsPedOnFoot(playerPed) then
					chapohurt2()
					SetEntityHealth(playerPed, newHealth)
					Citizen.Wait(500)
			else

				--[[ english
				TriggerEvent("pNotify:SendNotification",{
                    text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You have to be on foot 🦶</font></p></center>",
                    type = "error",
                    timeout = (2500),
                    layout = "centerleft",
                    queue = "killer"



				})]]
				----

				--arabic
			--[[
				TriggerEvent("pNotify:SendNotification",{
                    text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>يجب عليك ان تكون على القدمين 🦶</font></p></center>",
                    type = "error",
                    timeout = (2500),
                    layout = "centerleft",
                    queue = "killer"
                })]]
			end
		end
	elseif  GetEntityHealth(GetPlayerPed(-1)) > 160 then
		TriggerServerEvent('returnItem', item)
		--[[ english
		TriggerEvent("pNotify:SendNotification",{
			text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You don't need help</font></p></center>",
			type = "error",
			timeout = (2500),
			layout = "centerleft",
			queue = "killer"
		})]]
		--



		--arabic
	--[[	TriggerEvent("pNotify:SendNotification",{
			text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>انت لست بحاجة الى مساعدة</font></p></center>",
			type = "error",
			timeout = (2500),
			layout = "centerleft",
			queue = "killer"
		})]]
	end
end)


-- HERE IS FUNCTION FOR BLACK SCREEN
function blackout()
	
	if not isBlackedOut then
		isBlackedOut = true
		
		Citizen.CreateThread(function()
			DoScreenFadeOut(100)
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end
			Citizen.Wait(2000)
			DoScreenFadeIn(250)
			isBlackedOut = false
		end)
	end
end



function setHurt()
hurt = true
RequestAnimSet("move_m@injured")
SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
Citizen.Wait(3000)
showHurt()
end

function showHurt()
--[[ english
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You feel pain, please go to the hospital</font></p></center>",
		type = "error",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})]]
--

	--arabic
	--[[
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>انت تشعر بالألم الرجاء الذهاب الى المشفى</font></p></center>",
		type = "error",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})]]
end


function showHurt2()
	--[[english
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You feel very pain, go to the hospital and take medicine</font></p></center>",
		type = "error",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})--]]

	---arabic
	--[[
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>انت تشعر بالألم الشديد توجه الى المشفى او خز دواء</font></p></center>",
		type = "error",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})]]
end

function chapohurt()
	
		local ped = PlayerPedId()
		Citizen.CreateThread(function()
		
		  RequestAnimDict("creatures@monkey@move")
		  Citizen.Wait(100)
		  TaskPlayAnim((ped), 'creatures@monkey@move', 'dying', 2.0, 2.0, -1, 81, 0, 0, 0, 0)
		  --FreezeEntityPosition(PlayerPedId(), true)
		  Citizen.Wait(3000)
		  ClearPedTasks(ped)
		--  FreezeEntityPosition(PlayerPedId(), false)
		end)
	
	
end


function chapohurt2()
	
		local ped = PlayerPedId()
		Citizen.CreateThread(function()
		
		  RequestAnimDict("anim@heists@narcotics@funding@gang_idle")
		  Citizen.Wait(100)

		  --english
		  exports['progressBars3']:startUI(10000, 'In use')
		  ---arabic
		--  exports['progressBars3']:startUI(10000, 'جاري الاستخدام')
		  TaskPlayAnim((ped), 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01', 2.0, 2.0, -1, 81, 0, 0, 0, 0)
		  FreezeEntityPosition(PlayerPedId(), true)
		  Citizen.Wait(10000)
		  ClearPedTasks(ped)
		  FreezeEntityPosition(PlayerPedId(), false)
		end)
	
	
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if injuredcounter == 20000 then
		ApplyDamageToPed(GetPlayerPed(-1),  23, false)
		elseif injuredcounter == 36000 then
		local ped = GetPlayerPed(-1)
 		local currentHealth = GetEntityHealth(ped)
		GetEntityHealth(ped, currentHealth - 5)
        Citizen.Wait(5000)
		elseif injuredcounter == 46000 then -- 46000
		
			--[[english
			TriggerEvent("pNotify:SendNotification",{
				text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You need to get to a hospital now! 🚑</font></p></center>",
				type = "error",
				timeout = (2500),
				layout = "centerleft",
				queue = "killer"
			})]]
			--

			--[[
		TriggerEvent("pNotify:SendNotification",{
			text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>يجب عليك التوجه الى المشفى حالة !!!! 🚑</font></p></center>",
			type = "error",
			timeout = (2500),
			layout = "centerleft",
			queue = "killer"
		})]]
		elseif injuredcounter == 54000 then -- 54000
			-- dead kill them AGAIN
			ApplyDamageToPed(player, 800, false)
			--[[english
			TriggerEvent("pNotify:SendNotification",{
				text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You did not get treated in time. 😥</font></p></center>",
				type = "error",
				timeout = (2500),
				layout = "centerleft",
				queue = "killer"
			})]]


			--[[arabic
			TriggerEvent("pNotify:SendNotification",{
				text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>لم يتم علاجك في الوقت المناسب 😥</font></p></center>",
				type = "error",
				timeout = (2500),
				layout = "centerleft",
				queue = "killer"
			})]]
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if StillInjured then
		injuredcounter = injuredcounter + 1
		else
			Citizen.Wait(0)
		end
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end



function showNotHurt()
	--[[english
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>😀You've been treated</font></p></center>",
		type = "success",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})]]

	--[[arabic
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>😀 تم علاجك</font></p></center>",
		type = "success",
		timeout = (2500),
		layout = "centerleft",
		queue = "killer"
	})]]
end

function setNotHurt()
hurt = false
StillInjured = false
injuredcounter = 0
ResetPedMovementClipset(GetPlayerPed(-1))
ResetPedWeaponMovementClipset(GetPlayerPed(-1))
ResetPedStrafeClipset(GetPlayerPed(-1))
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if  GetEntityHealth(GetPlayerPed(-1)) <= 120  then
				--[[english
				TriggerEvent("pNotify:SendNotification",{
					text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>You feel so much pain you cannot jump 😥</font></p></center>",
					type = "error",
					timeout = (2500),
					layout = "centerleft",
					queue = "killer"
				})	]]



				--[[arabic
				TriggerEvent("pNotify:SendNotification",{
					text = "<center><p style='color:#FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;'><font size='4'>انت تشعر بالألم الشديد لا يمكنك القفز 😥</font></p></center>",
					type = "error",
					timeout = (2500),
					layout = "centerleft",
					queue = "killer"
				})	]]
		
			
		end
		Citizen.Wait(9000)
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if  GetEntityHealth(GetPlayerPed(-1)) <= 125 then
			--DisableControlAction(0, 1, true) -- Disable pan
			--DisableControlAction(0, 2, true) -- Disable tilt
			--DisableControlAction(0, 24, true) -- Attack
			--DisableControlAction(0, 257, true) -- Attack 2
			--DisableControlAction(0, 25, true) -- Aim
			--DisableControlAction(0, 263, true) -- Melee Attack 1
		--	DisableControlAction(0, 32, true) -- W
		--	DisableControlAction(0, 34, true) -- A
		--	DisableControlAction(0, 31, true) -- S
		--	DisableControlAction(0, 30, true) -- D

			--DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			

			--DisableControlAction(0, 37, true) -- Select Weapon
			--DisableControlAction(0, 23, true) -- Also 'enter'?

			--DisableControlAction(0, 288,  true) -- Disable phone
			---DisableControlAction(0, 289, true) -- Inventory
			--DisableControlAction(0, 170, true) -- Animations
			---DisableControlAction(0, 167, true) -- Job

			---DisableControlAction(0, 0, true) -- Disable changing view
			--DisableControlAction(0, 26, true) -- Disable looking behind
			--DisableControlAction(0, 73, true) -- Disable clearing animation
			---DisableControlAction(2, 199, true) -- Disable pause screen

			--DisableControlAction(0, 59, true) -- Disable steering in vehicle
			--DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			--DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			--DisableControlAction(2, 36, true) -- Disable going stealth

			---DisableControlAction(0, 47, true)  -- Disable weapon
			--DisableControlAction(0, 264, true) -- Disable melee
			--DisableControlAction(0, 257, true) -- Disable melee
			--DisableControlAction(0, 140, true) -- Disable melee
			--DisableControlAction(0, 141, true) -- Disable melee
			--DisableControlAction(0, 142, true) -- Disable melee
			--DisableControlAction(0, 143, true) -- Disable melee
			--DisableControlAction(0, 75, true)  -- Disable exit vehicle
			---DisableControlAction(27, 75, true) -- Disable exit vehicle

			
		else
			Citizen.Wait(500)
		end
	end
	
	
end)