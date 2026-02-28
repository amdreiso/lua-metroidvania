
local utils = require("utils")
local Global = require("global")
local Instance = require("instance")
local Level = require("level")

local Player = setmetatable({}, {__index = Instance})
Player.__index = Player

function Player.new(components)
	local self = setmetatable({}, Player)

	self.name = "player"
	self.x = 0
	self.y = 0
	self.hsp = 0
	self.vsp = 0
	self.speed = 150
	self.jumpForce = 3
	self.onGround = false

	utils.merge(self, components or {})

	return self
end

function Player:collisions()
	local collisions = Level.instanceGetAll("collision")

	for _, inst in ipairs(collisions) do
		if self:isCollidingWith(self.x, self.y + self.vsp, inst) then
			while not self:isCollidingWith(self.x, self.y + utils.sign(self.vsp), inst) do
				self.y = self.y + utils.sign(self.vsp)
			end
			self.vsp = 0
			self.onGround = true
		end

		if self:isCollidingWith(self.x + self.hsp, self.y, inst) then
			while not self:isCollidingWith(self.x + utils.sign(self.hsp), self.y, inst) do
				self.x = self.x + utils.sign(self.hsp)
			end
			self.hsp = 0
		end
	end
end

function Player:jump()
	if not self.onGround then return end
	self.vsp = self.vsp - self.jumpForce
	self.onGround = false
end

function Player:movement(dt)
	local k_left = love.keyboard.isDown("a")
	local k_right = love.keyboard.isDown("d")

	local len_w = ((k_right and 1 or 0) - (k_left and 1 or 0))
	self.hsp = self.speed * len_w * dt

	self.vsp = self.vsp + Global.GRAVITY * dt

	self:collisions()

	if love.keyboard.isDown("space") then
		self:jump()
	end

	self.x = self.x + self.hsp
	self.y = self.y + self.vsp
end

function Player:update(dt)
	self:calculateBoundaries()
	self:movement(dt)
end

function Player:draw()
	local hw = self.hitbox.width * self.xscale
	local hh = self.hitbox.height * self.yscale

	love.graphics.setColor({1, 1, 1})
	love.graphics.rectangle("fill", self.x - hw / 2, self.y - hh / 2, hw, hh)

	self:drawDebug()
end

return Player

