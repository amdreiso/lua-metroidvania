
local Global = require("global")
local Console = {}

local k0, k1, k2 = love.graphics.newImage("textures/kitty1.png"),love.graphics.newImage("textures/kitty2.png"),love.graphics.newImage("textures/kitty3.png")

Console.input = ""
Console.commands = {}
Console.logs = {}

Console.commands["exit"] = function()
	love.window.close()
end

Console.commands["welcome"] = function()
    Console.log("         .->    (`-')  _                     <-. (`-')    (`-')  _    (`-')               ", {1.0, 0.0, 0.0})
    Console.log(" (`(`-')/`) ( OO).-/  <-.    _               .->      \\(OO )_  ( OO).-/    ( OO).->       .->   ", {1.0, 0.38, 0.0})
    Console.log(",-`( OO).',(,------.,--. )   \\-,-----.(`-')----. ,--./  ,-.)(,------.    /    '._  (`-')----. ", {1.0, 0.75, 0.0})
    Console.log("|  |\\  |  | |  .---'|  (`-')  |  .--./( OO).-.  '|    `.'   | |  .---'    |'--...__)( OO).-.  '", {0.88, 1.0, 0.0})
    Console.log("|  | '.|  |(|  '--. |  |OO ) /_) (`-')( _) | |  ||  |'.'|  |(|  '--.      `--.  .--'( _) | |  |", {0.5, 1.0, 0.0})
    Console.log("|  |.'.|  | |  .--'(|  __ | ||  |OO ) \\|  |)|  ||  |  |  |  | |  .--'         |  |    \\|  |)|  |", {0.13, 1.0, 0.0})
    Console.log("|  ,'.   | |  `---.|     |'(_'  '--'\\  '  '-'  '|  |  |  | |  `---.        |  |      '  '-'  '", {0.0, 1.0, 0.25})
    Console.log("`--'   '--' `------'`-----'    `-----'   `-----' `--'   `--' `------'        `--'      `-----' ", {0.0, 1.0, 0.63})
    Console.log("                                  <-. (`-')_  (`-').->                     (`-')  _             ", {0.0, 1.0, 1.0})
    Console.log("             _               .->      \\( OO) ) ( OO)_       .->       <-.    ( OO).-/             ", {0.0, 0.63, 1.0})
    Console.log("             \\-,-----.(`-')----. ,--./ ,--/ (_)--\\_)(`-')----.  ,--. )  (,------.              ", {0.0, 0.25, 1.0})
    Console.log("              |  .--./( OO).-.  '|   \\ |  | /    _ /( OO).-.  ' |  (`-') |  .---'              ", {0.12, 0.0, 1.0})
    Console.log("             /_) (`-')( _) | |  ||  . '|  |)\\_..`--.( _) | |  | |  |OO )(|  '--.               ", {0.5, 0.0, 1.0})
    Console.log("             ||  |OO ) \\|  |)|  ||  |\\    | .-._)    \\\\|  |)|  |(|  '__ | |  .--'               ", {0.87, 0.0, 1.0})
    Console.log("            (_'  '--'\\  '  '-'  '|  | \\    | \\        / '  '-'  ' |     |' |  `---.              ", {1.0, 0.0, 0.75})
    Console.log("               `-----'   `-----' `--'  `--'  `-----'   `-----'  `-----'  `------'              ", {1.0, 0.0, 0.37})
end

Console.commands["welcomed"] = function()
	Console.log("	     .->    (`-')  _                             <-. (`-')   (`-')  _    (`-')               ", {0.0, 0.0, 0.0})
	Console.log(" (`(`-')/`) ( OO).-/  <-.    _             .->      \\(OO )_  ( OO).-/    ( OO).->       .->   ", {0.0, 0.0, 0.0})
	Console.log(",-`( OO).',(,------.,--. )   \\-,-----.(`-')----. ,--./  ,-.)(,------.    /    '._  (`-')----. ", {0.0, 0.0, 0.0})
	Console.log("|  |\\  |  | |  .---'|  (`-')  |  .--./( OO).-.  '|   `.'   | |  .---'    |'--...__)( OO).-.  '", {0.0, 0.0, 0.0})
	Console.log("|  | '.|  |(|  '--. |  |OO ) /_) (`-')( _) | |  ||  |'.'|  |(|  '--.     `--.  .--'( _) | |  |", {0.0, 0.0, 0.0})
	Console.log("|  |.'.|  | |  .--'(|  '__ | ||  |OO ) \\|  |)|  ||  |   |  | |  .--'        |  |    \\|  |)|  |", {0.0, 0.0, 0.0})
	Console.log("|   ,'.   | |  `---.|     |'(_'  '--'\\  '  '-'  '|  |   |  | |  `---.       |  |     '  '-'  '", {0.0, 0.0, 0.0})
	Console.log("`--'   '--' `------'`-----'    `-----'   `-----' `--'   `--' `------'       `--'      `-----' ", {0.0, 0.0, 0.0})
	Console.log("                                 <-. (`-')_  (`-').->                    (`-')  _             ", {0.0, 0.0, 0.0})
	Console.log("             _             .->      \\( OO) ) ( OO)_      .->      <-.    ( OO).-/             ", {0.0, 0.0, 0.0})
	Console.log("             \\-,-----.(`-')----. ,--./ ,--/ (_)--\\_)(`-')----.  ,--. )  (,------.             ", {0.0, 0.0, 0.0})
	Console.log("              |  .--./( OO).-.  '|   \\ |  | /    _ /( OO).-.  ' |  (`-') |  .---'             ", {0.0, 0.0, 0.0})
	Console.log("             /_) (`-')( _) | |  ||  . '|  |)\\_..`--.( _) | |  | |  |OO )(|  '--.              ", {0.0, 0.0, 0.0})
	Console.log("             ||  |OO ) \\|  |)|  ||  |\\    | .-._)   \\\\|  |)|  |(|  '__ | |  .--'              ", {0.0, 0.0, 0.0})
	Console.log("            (_'  '--'\\  '  '-'  '|  | \\   | \\       / '  '-'  ' |     |' |  `---.             ", {0.0, 0.0, 0.0})
	Console.log("               `-----'   `-----' `--'  `--'  `-----'   `-----'  `-----'  `------'             ", {0.0, 0.0, 0.0})
end

function Console.log(str, color)
	table.insert(Console.logs, 1, {text=str, color=color or {1,1,1}})
end

function Console.run(str)
	local c = str or Console.input
	Console.log(c)

	local cmd = Console.commands[c]
	if cmd == nil then
		Console.log("Command '" .. c .. "' doesn't exist", {1, 0.2, 0.2})
		return
	end
	cmd()
end

function Console.draw()
	if not Global.CONSOLE then return end

	local xoff = 5
	local fh = 16
	local w, h = 707, 20 * fh
	local p = 10
	local c = 0.05
	local cb = {1, 0.5, 1}

	love.graphics.setColor({c, c, c, 0.95})
	love.graphics.rectangle("fill", 0, 0, w+p, h+p)
	love.graphics.setColor(cb)
	love.graphics.rectangle("line", 1, 1, w+p, h+p)

	for i, log in ipairs(Console.logs) do
		love.graphics.setColor(log.color)
		love.graphics.print(log.text, xoff, h - i * fh - fh)
	end

	love.graphics.setColor({1, 1, 1})
	love.graphics.print("> " .. Console.input .. "█", xoff, h - fh)

	love.graphics.draw(k0, w+p - 75, h+p - 79, 0, 0.15, 0.15)
	love.graphics.draw(k2, w+p - 255, h+p - 77, 0, 0.15, 0.15)
	love.graphics.draw(k1, w+p - 155, h+p - 77, 0, 0.15, 0.15)
end

return Console

