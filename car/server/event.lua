AddEvent("OnVehicleDamage", function(vehicle, healthDamage, damageIndex, damageAmount)
    local healt_car = GetVehicleHealth(vehicle)

    local ALive = GetVehiclePropertyValue(vehicle, "ALive")
    local alarm = GetVehiclePropertyValue(vehicle, "alarm")
    local locked = GetVehiclePropertyValue(vehicle, "locked")

    if ALive == true then
        if healt_car <= 0 then
            ExplodeCar(vehicle)
            if GetVehiclePropertyValue(vehicle, 'alarm') then
                StopAlarm(vehicle)
            end
        end

        if alarm ~= true and GetVehicleDriver(vehicle) == 0 and locked then
            StartAlarm(vehicle)
        end
    end
end)

function ExplodeCar(vehicle)
    local driver = GetVehicleDriver(vehicle)
    local seats = GetVehicleNumberOfSeats(vehicle)

    for id_seat = 1, seats do
        local playerSeat = GetVehiclePassenger(vehicle, id_seat)

        if playerSeat ~= 0 then SetPlayerHealth(playerSeat, 0) end
    end

    if driver ~= 0 then SetPlayerHealth(driver, 0) end

    local x,y,z = GetVehicleLocation(vehicle)
    SetVehiclePropertyValue(vehicle, "ALive", false, true)
    SetVehiclePropertyValue(vehicle, "locked", false, true)
    SetVehicleLinearVelocity(vehicle, 250.0, 0.0, 0.0, true)
    CreateExplosion(10, x,y,z, true, 1500.0, 600.0)
end

function OnPlayerQuit(player)
	for _, v in pairs(GetAllVehicles()) do
        local owner = json_decode(GetVehiclePropertyValue(v, 'owner'))
        local p = getplayer(player)

        if has_value(owner, p.id) then
            if GetVehiclePropertyValue(v, 'alarm') then
                StopAlarm(v)
            end
        end
    end
end
AddEvent("OnPlayerQuit", OnPlayerQuit)


function OnPackageStop()
    SetAllOnTheRoad(false)
end
AddEvent("OnPackageStop", OnPackageStop)

AddEvent("OnPlayerEnterVehicle", function(player, vehicle, seat)
    if seat == 1 then
        OpenDialogClient(player, "vehicle")
        local fuel = GetFuel(vehicle)
        if tonumber(fuel) > 0 then 
            StartVehicleEngine(vehicle)
        else
            local x,y,z = GetVehicleLocation(vehicle)
            NewSoun3d('car_engine_break'..vehicle, 'files_client/sound/car_engine_break.mp3', x, y, z,  _Car.engine_beak.distance_sound, _Car.engine_beak.volume, false)
        end
	end
end)

AddEvent("OnPlayerLeaveVehicle", function(player, vehicle, seat)
    if seat == 1 then
        CloseDialogClient(player, 'vehicle')    
        StopVehicleEngine(vehicle)
        DestroySound3d('car_engine_break'..vehicle)
	end
end)