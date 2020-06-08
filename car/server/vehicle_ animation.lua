function PlayVehicleLockSequence(vehicle_id)
    SetVehicleLightEnabled(vehicle_id, true)
    local x, y, z = GetVehicleLocation(vehicle_id)
    NewSoun3d('car_open'..vehicle_id, 'files_client/sound/car_lock.mp3', x, y, z,  _Car.lock_unlock.distance_sound, _Car.lock_unlock.volume, false)
    Delay(400, function()
        SetVehicleLightEnabled(vehicle_id, false)
	end)
end
