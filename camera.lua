
local Camera = {
	x = 0,
	y = 0,
	width = 1280,
	height = 720,
	target = nil,
}
Camera.__index = Camera

function Camera.new()
	local self = setmetatable({}, Camera)
	return self
end

function Camera:target(inst)
	self.target = inst
	print("Camera: set target to " .. inst.name)
end

function Camera:update(dt)
	if self.target ~= nil then
		self.x = self.target.x
		self.y = self.target.y
		print(self.x, self.y)
	end
end

function Camera:setSize(w, h)
	self.width, self.height = w, h
end

function Camera:apply()
	love.graphics.push()
	love.graphics.translate(love.graphics.getWidth() / 2 - self.x, love.graphics.getHeight() / 2 - self.y)
end

function Camera:reset()
	love.graphics.pop()
end

return Camera

