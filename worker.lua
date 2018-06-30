
function Worker(x, y, job)
	local w = {}
	w.x   = x
	w.y   = y
	w.w   = 16
	w.h   = 16
	w.job = job
	w.sprite = love.graphics.newImage("images/workers/base.png")
	
	function w:draw()
		love.graphics.draw(self.sprite, self.x, self.y)
	end
	
	return w
end