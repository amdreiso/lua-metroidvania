
local Enum = require("enum")

local Global = {}

Global.DEBUG = true
Global.CONSOLE = false
Global.GRAVITY = 10
Global.SUBPIXEL = 0.1
Global.TERM_COLORS = {
	RED = "\27[31m",
	YELLOW = "\27[33m",
	RESET = "\27[0m"
}
Global.GAME_STATE = Enum.GAME_STATE.GAME

return Global

