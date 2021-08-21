--[[DOODLE DODGE!
	A Lua game written by Jeremy Nielsen
]]

-- Requirements, including libraries and classes.
push = require 'lib/push'
Class = require 'lib/class'
require 'class/Player'
require 'class/Scoreboard'
--Title
TITLE = 'Doodle Dodge'

--Window size
WINDOW_WIDTH = 640*1.5
WINDOW_HEIGHT = 360*1.5

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

	--add our font
	scorefont = love.graphics.newFont('font.ttf', 36)

	--introduce the Player
	player1 = Player()

	--add scoring system
	score1 = Scoreboard(25, 25, scorefont)
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
	if love.keyboard.isDown('w') then
		player1.dy = -PLAYER_SPEED
	elseif love.keyboard.isDown('s') then
		player1.dy = PLAYER_SPEED
	else
		player1.dy = 0
	end
	if love.keyboard.isDown('a') then
		player1.dx = -PLAYER_SPEED
	elseif love.keyboard.isDown('d') then
		player1.dx = PLAYER_SPEED
	else
		player1.dx = 0
	end
	player1:update(dt)
	--score1:update(dt)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
	push:start()

	love.graphics.clear(40/255, 45/255, 52/255, 255/255)

	player1:render()
	score1:render()

	push:finish()
end