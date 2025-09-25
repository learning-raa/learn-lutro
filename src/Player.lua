local Player = {}

function Player:new(id, x, y)
	local instance = setmetatable({}, {__index = self})
		instance.id = id
		instance.x = x
		instance.y = y
		instance.width = 10
		instance.height = 10
	return instance
end

local pad_velo = 20.
function Player:update(dt)
	-- system
	if self.id == 1 then
		if love.joystick.isDown(self.id, JOYPAD_START) then
			love.event.quit( 'restart' )
		end
	end
	-- PAD
	if love.joystick.isDown(self.id, JOYPAD_LEFT) then
		self.width = self.width - 1 * pad_velo * dt
	end
	if love.joystick.isDown(self.id, JOYPAD_RIGHT) then
		self.width = self.width + 1 * pad_velo * dt
	end
	if love.joystick.isDown(self.id, JOYPAD_UP) then
		self.height = self.height - 1 * pad_velo * dt
	end
	if love.joystick.isDown(self.id, JOYPAD_DOWN) then
		self.height = self.height + 1 * pad_velo * dt
	end
	-- AXIS
	self.x = self.x + love.joystick.getAxis(self.id, AXIS_LEFT_X)
	self.y = self.y + love.joystick.getAxis(self.id, AXIS_LEFT_Y)
end

function Player:draw()
	if self.id == 1 then
		love.graphics.setColor(200, 0, 0)
		love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
	else
		love.graphics.setColor(0, 0, 200)
		love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
	end
end

return Player
