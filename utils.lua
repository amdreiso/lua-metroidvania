
local utils = {}

function utils.merge(dest, src)
	for k, v in pairs(src) do
		if type(v) == "table" then
			if type(dest[k]) ~= "table" then
				dest[k] = {}
			end
			utils.merge(dest[k], v)
		else
			dest[k] = v
		end
	end
end

function utils.tprint(t, indent)
	local i = indent or 0
	local space = string.rep(" ", i)
	for k, v in pairs(t) do
		if type(v) == "table" then
			print(space .. k .. " = {")
			utils.tprint(v, i + 2)
			print(space .. "}")
		else
			print(space .. k .. " = " .. tostring(v))
		end
	end
end

function utils.sign(x)
	if x < 0 then
		return -1
	elseif x == 0 then
		return 0
	elseif x > 0 then
		return 1
	end
end

return utils

