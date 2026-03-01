
local utils 						= require("utils")
local Level 						= require("level")
local Enum 							= require("enum")
local Global 						= require("global")
local Console 					= require("console")
local utf8							= require("utf8")
local TERM_COLORS 			= Global.TERM_COLORS

local FLAGS = {}
FLAGS["editor"] = function()
	Global.GAME_STATE = Enum.GAME_STATE.EDITOR
end

local function RunFlags()
	table.remove(arg, 1) -- remove love folder path
	for _, flag in ipairs(arg) do
		local f = FLAGS[flag]
		if f == nil then
			print(TERM_COLORS.RED .. "Invalid flag: " .. TERM_COLORS.RED .. "'" .. flag .. "'")
			break
		end
		FLAGS[flag]()
	end
end

function love.load()
	RunFlags()
	if Global.GAME_STATE == Enum.GAME_STATE.GAME then Level.load(require("levels.level_template")) end

	local font = love.graphics.newFont("fonts/SauceCodeProNerdFontMono-Regular.ttf", 12)
	love.graphics.setFont(font)
end

function love.update(dt)
	if Global.GAME_STATE == Enum.GAME_STATE.GAME then Level.update(Level.current, dt) end
end

function love.draw()
	if Global.GAME_STATE == Enum.GAME_STATE.GAME then Level.draw(Level.current) end

	Console.draw()
end

function love.keypressed(key, scancode)
	if key == "tab" then
		Global.CONSOLE = not Global.CONSOLE
		Console.input = ""
		return
	end

	if Global.CONSOLE then
		if key == "backspace" then
			local byteoffset = utf8.offset(Console.input, -1)
			if byteoffset then
				Console.input = string.sub(Console.input, 1, byteoffset - 1)
			end
		elseif key == "return" then
			Console.run()
			Console.input = ""
		end
	end
end

function love.textinput(text)
	if Global.CONSOLE then
		Console.input = Console.input .. text
	end
end

