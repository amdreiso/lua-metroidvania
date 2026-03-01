
local Global = require("global")
local Console = {}

Console.input = ""
Console.commands = {}

Console.commands["exit"] = function()
	print("exit")
end

function Console.run(str)
end

function Console.draw()
	if not Global.CONSOLE then return end

	local w, h = 300, 200

	love.graphics.setColor({0.1, 0.1, 0.1})
	love.graphics.rectangle("fill", 0, 0, w, h)

	love.graphics.setColor({1, 1, 1})
	love.graphics.print("> " .. Console.input, 0, h)
end

return Console

