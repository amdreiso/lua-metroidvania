
local Level = require("level")
local Global = require("global")
local Enum = require("enum")

local Player = require("instances.player")
local Collision = require("instances.collision")

local level_Test = Level.create("level_Test")
level_Test.layerCreate("Instances_0", Level.layer(100, Enum.LAYER_TYPE.INSTANCES))
level_Test.layerCreate("Instances_1", Level.layer(50, Enum.LAYER_TYPE.INSTANCES))

local player = Player.new()
player:positionSet(300, 250)

local layer = Level.layerGet(level_Test, "Instances_0")
layer.createInstance(layer, player)
layer.createInstance(layer, Collision.new({x=300, y=308, xscale=3}))
layer.createInstance(layer, Collision.new({x=332, y=300, yscale=3}))

return level_Test

