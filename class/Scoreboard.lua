Scoreboard = Class{}

function Scoreboard:init(x, y, font)
	self.x = x
	self.y = y
	self.font = font
	self.score = 0

	function wait(seconds)
		local start = os.time()
		repeat until os.time() > start + seconds
	end
end

function Scoreboard:update(dt)
	wait(3)
	self.score = (self.score + 1)
end

function Scoreboard:render()
	love.graphics.setFont(self.font)
	love.graphics.print(tostring(self.score), self.x, self.y)
end