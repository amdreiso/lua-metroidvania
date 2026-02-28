
local utils = require("utils")
local Player = require("instances.player")
local Collision = require("instances.collision")
local Level = require("level")
local LayerType = Level.LayerType

local level_Test = Level.create("level_Test")
level_Test.layerCreate("Instances_0", Level.layer(100, LayerType.INSTANCES))
level_Test.layerCreate("Instances_1", Level.layer(50, LayerType.INSTANCES))

Level.load(level_Test)

local player = Player.new()
player:positionSet(300, 250)

local layer = Level.layerGet(level_Test, "Instances_0")
layer.createInstance(layer, player)
layer.createInstance(layer, Collision.new({x=300, y=308, xscale=3}))
layer.createInstance(layer, Collision.new({x=332, y=300, yscale=3}))

function love.load()
end

function love.update(dt)
	Level.update(level_Test, dt)
end

function love.draw()
	Level.draw(level_Test)
end





