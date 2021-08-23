Scoreboard = Class{}

function Scoreboard:init(x, y, font)
	self.x = x
	self.y = y
	self.font = font
	self.score = 0


end

function Scoreboard:update(dt)

end

function Scoreboard:render()
	love.graphics.setFont(self.font)
	love.graphics.print(tostring(self.score), self.x, self.y)
end