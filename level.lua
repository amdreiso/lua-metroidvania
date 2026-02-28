
local utils = require("utils")
local Level = {
	current = nil,
}

function Level.load(level)
	Level.current = level
	-- TODO: all the other shit
end

function Level.instanceGetAll(name, level)
	local l = level or Level.current
	local instances = {}
	for _, layer in pairs(l.layers) do
		if layer.layerType == Level.LayerType.INSTANCES then
			for _, inst in ipairs(layer.instances) do
				if inst.name == name then
					table.insert(instances, inst)
				end
			end
		end
	end
	return instances
end

-- Layers
Level.LayerType = {
	INSTANCES = 0,
	TILESET = 1,
}
local LayerType = Level.LayerType

local LAYER_COMPONENTS = {}

LAYER_COMPONENTS[ LayerType.INSTANCES ] = {
	instances = {},
	createInstance = function(layer, inst)
		table.insert(layer.instances, inst)
		print("Instance " .. inst.name .. " created at (" .. inst.x .. "," .. inst.y .. ") in layer depth: " .. layer.depth)
	end,
}

LAYER_COMPONENTS[ LayerType.TILESET ] = {
}

function Level.layer(depth, layerType)
	local layer = {}

	-- default components of every layer
	layer.depth = depth
	layer.layerType = layerType or Level.LayerType.INSTANCES

	-- additional components
	utils.merge(layer, LAYER_COMPONENTS[ layerType ])

	return layer
end

function Level.layerGet(level, name)
	if level.layers[name] == nil then
		print("layer" .. name .. "doesn't exist in " .. level.name)
	end
	return level.layers[name]
end

-- Level creation
function Level.create(name, components)
	local level = {}
	local cmp = components or {}

	level.name = name or "level name"
	level.layers = {}
	level.render = {}

	utils.merge(level, cmp)

	-- Layer stuff
	function level.layerCreate(layername, layer)
		level.layers[layername] = layer

		table.insert(level.render, layer)
		table.sort(level.render, function(a, b)
			return a.depth < b.depth
		end)
	end

	return level
end

function Level.drawInstances(instances)
	for _, inst in pairs(instances) do
		inst:draw()
	end
end

function Level.updateInstances(instances, dt)
	for _, inst in pairs(instances) do
		inst:update(dt)
	end
end

function Level.drawTileSet()
end

function Level.draw(level)
	for _, layer in ipairs(level.render) do
		if layer.layerType == LayerType.INSTANCES then
			Level.drawInstances(layer.instances)
		end
	end
end

function Level.update(level, dt)
	for _, layer in ipairs(level.render) do
		if layer.layerType == LayerType.INSTANCES then
			Level.updateInstances(layer.instances, dt)
		end
	end
end

return Level

