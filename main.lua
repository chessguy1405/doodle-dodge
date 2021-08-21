--[[DOODLE DODGE!
	A Lua game written by Jeremy Nielsen
]]

-- Requirements, including libraries and classes.
push = require 'push'
Class = require 'class'
require 'Player'
--Title
TITLE = 'Doodle Dodge'

--Window size
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--Virtual size via push
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--Player and enemy speeds
PLAYER_SPEED = 200
ENEMY_SPEED = 200

function love.load()
	--Setting the title of our window
	love.window.setTitle(TITLE)

	--Setting up our RNG seed
	math.randomseed(os.time())

	--Setting the default filter to "nearest neighbor"
	love.graphics.setDefaultFilter('nearest', 'nearest')

	--initialize virtual resolution
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
	fullscreen = false,
	resizable = true,
	vsync = true,
	canvas = false})
end