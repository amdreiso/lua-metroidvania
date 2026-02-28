
local utils = require("utils")
local Global = require("global")
local Instance = require("instance")
local Level = require("level")

local Collision = setmetatable({}, {__index = Instance})
Collision.__index = Collision

function Collision.new(components)
	local self = setmetatable({}, Collision)
	self.name = "collision"
	utils.merge(self, components or {})
	return self
end

function Collision:draw()
	if Global.DEBUG then
		local hw = self.hitbox.width * self.xscale
		local hh = self.hitbox.height * self.yscale

		love.graphics.setColor({1, 0, 0, 0.8})
		love.graphics.rectangle("fill", self.x - hw / 2, self.y - hh / 2, hw, hh)

		self:drawDebug()
	end
end

return Collision

