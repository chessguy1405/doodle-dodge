--Make this a class so that we could (theoretically) have
--as many players as we want with the same basic attributes
--instead of creating a brand new thing every time that defined
--a player's attributes.
Player = Class{}

--Initialize the player, or establish its attributes.
function Player:init()
	
	self.image = love.graphics.newImage('images/Player.png')
	self.width = (self.image:getWidth() / 4)
	self.height = (self.image:getHeight() / 4)

	self.x = VIRTUAL_WIDTH / 2 - (self.width/2)
	self.y = VIRTUAL_HEIGHT / 2 - (self.height/2)


	self.dx = 0
	self.dy = 0
end

function Player:update(dt)
	if self.dy < 0 or self.dy > 0 then
        self.y = math.max(0, self.y + self.dy * dt)
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
	if self.dx < 0 or self.dx > 0 then
		self.x = math.max(0, self.x + self.dx * dt)
		self.x = math.min(VIRTUAL_WIDTH - self.width, self.x +self.dx * dt)
	end
end

function Player:render()
	love.graphics.draw(self.image, self.x, self.y, 0, 0.25, 0.25)
	--love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end