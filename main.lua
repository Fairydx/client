game = {
	VERSION = "0.0.0.1a",
	CODENAME = "LuaJIT Rox",
	DATE = "13/07/2015",
}
CLIENT = true

require("src.hook")
Hook.Create("draw")
Hook.Create("update")

ffi = require("ffi")
require("enet")
require("src.lib")
require("src.console")
require("src.gui")
require("src.constants")
require("src.commands")
require("src.config")
require("src.language")
require("src.core")
require("src.binds")
require("src.interface")
require("src.namespaces")

function love.draw(dt)
	Hook.Call("draw", dt)
	
	-- Interface is always at top of everything
	Interface.Render(dt)
end

function love.update(dt)
	Interface.Update(dt)
	
	Hook.Call("update", dt)
end

function love.load()
	Commands.Load()
	Config.Load()
	Lang.Load()
	Interface.Load()
	Core.Load()
end