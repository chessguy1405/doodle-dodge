--[[Make this a class so that we could (theoretically) have
	as many players as we want with the same basic attributes
	instead of creating a brand new thing every time that defined
	a player's attributes.]]
Player = Class{}

--Initialize the player, or establish its attributes.
function Player.init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.dx = 0
	self.dy = 0
end

function Player:render()