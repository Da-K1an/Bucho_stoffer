HT = nil

Citizen.CreateThread(function()
	while HT == nil do
		TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
		Citizen.Wait(0)
	end
end)


local shops = {
    --{x=25.965085983276,y=-1347.3123779297,z=29.497024536133} -- 25.84,-1347.51,29.49
    {x=-65.219924926758,y=-1513.1600341797,z=33.436134338379,h=145.10252380371},

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
                for _,v in pairs(shops) do
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x,v.y,v.z, true) <= 2.5 then
                        DrawMarker(20, v.x,v.y,v.z+1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, cfg.Hojde, 0.50, cfg.Laengde, 57, 212, 57, 100, false, true, 2, true, false, false, false) 
                            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x,v.y,v.z, true) <= 1.0 then
                                DrawText3Ds(v.x,v.y,v.z,cfg.Text)
                                if IsControlJustReleased(1, 38) then
                                openMenu()
                            end
                        end
                    end
                end
            end
        end)

        Citizen.CreateThread(function()
            for _,v in pairs(shops) do
                RequestModel(GetHashKey('g_m_y_ballasout_01'))
                    while not HasModelLoaded('g_m_y_ballasout_01') do
                        Citizen.Wait(1)
                    end
                QuestGiver = CreatePed(4, 0x23B88069, v.x,v.y,v.z-1,v.h, false, true)
                SetEntityHeading(QuestGiver, v.h)
                FreezeEntityPosition(QuestGiver, true)
                SetEntityInvincible(QuestGiver, true)
                SetBlockingOfNonTemporaryEvents(QuestGiver, true)
                RequestAnimDict("amb@world_human_hang_out_street@male_b@enter")
                    while not HasAnimDictLoaded("amb@world_human_hang_out_street@male_b@enter") do
                        Citizen.Wait(100)
                    end
                TaskPlayAnim(QuestGiver, "amb@world_human_hang_out_street@male_b@enter", "enter", 8, 8, -1, 1, 0, 0, 0, 0)
            end
        end)

function openMenu()
    local elements = {
        { label = "kokain", value = "kokain" },
        { label = "Amfetamin", value = "kemikalier2" },
        { label = "Meth", value = "kemikalier" },
        { label = "Luk", value = "Luk" }
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu", 
        {
            title    = "Sælg Stoffer",
            align    = "left",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'kokain') then
            menu.close()
            local ped = PlayerPedId()
            TriggerServerEvent('kokain')
        end

        if(data.current.value == 'kemikalier2') then
            menu.close()
            local ped = PlayerPedId()
            TriggerServerEvent('Amfetamin')
        end

        if(data.current.value == 'kemikalier') then
            menu.close()
            local ped = PlayerPedId()
            TriggerServerEvent('Meth')
        end

        if(data.current.value == 'Luk') then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end


--Dialog funktion kan bruges tak til Krogh---
function dialog()
	HT.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dialog', {
		title = "Antal du vil købe?"
	}, function(data, menu)
		menu.close()
		TriggerServerEvent('test')
	end,
	function(data, menu)
		menu.close()	
	end)
end





function DrawText3Ds(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.45
	if onScreen then
        SetTextScale(cfg.TextStoerlse1, cfg.TextStoerlse2)
        SetTextFont(cfg.Font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end

Citizen.CreateThread(function()
                            
    for _, info in pairs(shops) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, cfg.BlipID)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, cfg.BlipFarve)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(cfg.BlipTitle)
      EndTextCommandSetBlipName(info.blip)
    end
end)








