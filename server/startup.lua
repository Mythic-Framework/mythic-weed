local _started

function Startup()
	if _started then return end
	_started = true

	MySQL.query("SELECT id, data FROM weed_plants", {}, function(results)
		local count = 0

		if results and #results > 0 then
			for _, row in ipairs(results) do
				local ok, plant = pcall(json.decode, row.data or "{}")
				if ok and plant and plant.planted then
					if os.time() - plant.planted <= Config.Lifetime then
						plant._id = row.id

						_plants[plant._id] = {
							plant = plant,
							stage = getStageByPct(plant.growth or 0),
						}

						count = count + 1
					end
				end
			end
		end

		Logger:Trace("Weed", string.format("Loaded ^2%s^7 Weed Plants", count), { console = true })
	end)

	Reputation:Create("weed", "Weed", {
		{ label = "Rank 1", value = 3000 },
		{ label = "Rank 2", value = 6000 },
		{ label = "Rank 3", value = 12000 },
		{ label = "Rank 4", value = 21000 },
		{ label = "Rank 5", value = 50000 },
	}, true)
end
