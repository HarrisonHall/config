VERSION = "1.0.0"
local micro = import("micro")


function init()
	just_pressed = -1
	return true
end

function onBufferOpen(buf)
	return true
end

function onCenter(bufpane)
	just_pressed = (just_pressed + 1) % 3
	local v = bufpane.GetView()
	return true
end
