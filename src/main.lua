JOYPAD_UP    = 5
JOYPAD_DOWN  = 6
JOYPAD_LEFT  = 7
JOYPAD_RIGHT = 8

AXIS_LEFT_X = 1
AXIS_LEFT_Y = 2

local pad_velo = 20.

function love.load()
	print('DBG:', 'load')

	x0, y0, width, height = 5, 5, 10, 20
end

function love.update(dt)
	-- PAD
	if love.joystick.isDown(1, JOYPAD_LEFT) then
		width = width - 1 * pad_velo * dt
	end
	if love.joystick.isDown(1, JOYPAD_RIGHT) then
		width = width + 1 * pad_velo * dt
	end
	if love.joystick.isDown(1, JOYPAD_UP) then
		height = height - 1 * pad_velo * dt
	end
	if love.joystick.isDown(1, JOYPAD_DOWN) then
		height = height + 1 * pad_velo * dt
	end
	-- AXIS
	x0 = x0 + love.joystick.getAxis(1, AXIS_LEFT_X)
	y0 = y0 + love.joystick.getAxis(1, AXIS_LEFT_Y)
end

function love.joystickpressed(joystick, button)
	-- print("JOY k", joystick, button)
end

function love.draw()
	love.graphics.rectangle('fill', x0, y0, width, height)
end
