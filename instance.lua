
local utils = require("utils")

local Instance = {
	name = "instance",
	x = 0,
	y = 0,
	hitbox = {
		width = 16,
		height = 16,
	},
	xscale = 1,
	yscale = 1,
	north = 0,
	south = 0,
	east = 0,
	west = 0,
}
Instance.__index = Instance

function Instance.new(components)
	local self = setmetatable({}, Instance)
	utils.merge(self, components or {})
	return self
end

function Instance:positionSet(x, y)
	self.x = x
	self.y = y
end

function Instance:isCollidingWith(x, y, inst)
	return (x + self.hitbox.width  / 2 * self.xscale > inst.west and
					x - self.hitbox.width  / 2 * self.xscale < inst.east and
					y - self.hitbox.height / 2 * self.yscale < inst.south and
					y + self.hitbox.height / 2 * self.yscale > inst.north)
end

function Instance:setHitbox(width, height)
	self.hitbox.width = width * self.xscale
	self.hitbox.height = height * self.yscale
end

function Instance:calculateBoundaries()
	self.west  = self.x - self.hitbox.width / 2 * self.xscale
	self.east  = self.x + self.hitbox.width / 2 * self.xscale
	self.north = self.y - self.hitbox.height / 2 * self.yscale
	self.south = self.y + self.hitbox.height / 2 * self.yscale
end

function Instance:update(dt)
	self:calculateBoundaries()
end

function Instance:drawDebug()
	love.graphics.circle("fill", self.west, self.north, 1)
	love.graphics.circle("fill", self.east, self.north, 1)
	love.graphics.circle("fill", self.west, self.south, 1)
	love.graphics.circle("fill", self.east, self.south, 1)
end

function Instance:draw()
end

return Instance

