local sure = true

RegisterNetEvent('setz_combatlogsend')
AddEventHandler('setz_combatlogsend', function(konum, gameid, saat, sebep)
    Citizen.CreateThread(function()
        Wait(60000)
        sure= false
    end)

    Citizen.CreateThread(function()
        sure = true
        while sure do
            local mesafe = #(GetEntityCoords(PlayerPedId()) - konum)
            if mesafe < 15.0 then
                DrawMarker(3, konum.x, konum.y, konum.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 0, 120, 255, 100, 0, 0, 0, 1, 0, 0, 0)
                if mesafe < 3 then
                    DrawText3D(konum.x, konum.y, konum.z + 0.8, "[~b~ Oyuncu ID: ~w~ ".. gameid .." ~w~ - ~b~"..saat.. " ~w~] ")
                    DrawText3D(konum.x, konum.y, konum.z + 0.73, "~w~[ Sebep: ~y~"..sebep.."~w~ ]")

                end
            end
            Wait(7)
        end
    end)
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
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