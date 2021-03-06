local PLAY2D = {}
local Path = ...

function PLAY2D.Require(Name, ...)
	if love.filesystem.isDirectory(Path.."/"..Name) then
		return assert(love.filesystem.load(Path.."/"..Name.."/init.lua"))(Path:gsub("/", ".").."."..Name, PLAY2D, ...)
	end
	return assert(love.filesystem.load(Path.."/"..Name..".lua"))(Path:gsub("/", ".").."."..Name, PLAY2D, ...)
end

PLAY2D.gui = PLAY2D.Require("gui")
PLAY2D.Terminal = PLAY2D.Require("terminal")
PLAY2D.Interface = PLAY2D.Require("interface")

function PLAY2D.load()
	PLAY2D.gui.load()
	PLAY2D.Interface.load()
end

function PLAY2D.update(dt)
	PLAY2D.gui.update(dt)
end

function PLAY2D.draw()
	PLAY2D.gui.draw()
end

function PLAY2D.mousepressed(...)
	PLAY2D.gui.mousepressed(...)
end

function PLAY2D.mousereleased(...)
	PLAY2D.gui.mousereleased(...)
end

function PLAY2D.mousemoved(...)
	PLAY2D.gui.mousemoved(...)
end

function PLAY2D.wheelmoved(...)
	PLAY2D.gui.wheelmoved(...)
end

function PLAY2D.keypressed(...)
	PLAY2D.gui.keypressed(...)
end

function PLAY2D.textinput(...)
	PLAY2D.gui.textinput(...)
end

return PLAY2D