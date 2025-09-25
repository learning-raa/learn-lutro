JOYPAD_START = 4
JOYPAD_UP    = 5
JOYPAD_DOWN  = 6
JOYPAD_LEFT  = 7
JOYPAD_RIGHT = 8

AXIS_LEFT_X  = 1
AXIS_LEFT_Y  = 2
AXIS_RIGHT_X = 3
AXIS_RIGHT_Y = 4

local player_1 = { n = 1, x = 5, y = 5, width = 10, height = 10 }
local player_2 = { n = 2, x = 50, y = 50, width = 10, height = 10 }

local pad_velo = 20.

function love.load()
	print('DBG:', 'Vestion', love.getVersion())
	print('DBG:', 'load')

	wind_width, wind_height = love.graphics.getDimensions()
	print(wind_width, wind_height)
end

function player_input(player, dt)
	-- system
	if player.n == 1 then
		if love.joystick.isDown(player.n, JOYPAD_START) then
			love.event.quit( 'restart' )
		end
	end
	-- PAD
	if love.joystick.isDown(player.n, JOYPAD_LEFT) then
		player.width = player.width - 1 * pad_velo * dt
	end
	if love.joystick.isDown(player.n, JOYPAD_RIGHT) then
		player.width = player.width + 1 * pad_velo * dt
	end
	if love.joystick.isDown(player.n, JOYPAD_UP) then
		player.height = player.height - 1 * pad_velo * dt
	end
	if love.joystick.isDown(player.n, JOYPAD_DOWN) then
		player.height = player.height + 1 * pad_velo * dt
	end
	-- AXIS
	player.x = player.x + love.joystick.getAxis(player.n, AXIS_LEFT_X)
	player.y = player.y + love.joystick.getAxis(player.n, AXIS_LEFT_Y)
end

function love.update(dt)
	player_input(player_1, dt)
	player_input(player_2, dt)
end

function love.draw()
	love.graphics.rectangle('fill', player_1.x, player_1.y, player_1.width, player_1.height)

	-- love.graphics.translate(player_2.x, player_2.y)
	love.graphics.rectangle('line', player_2.x, player_2.y, player_2.width, player_2.height)
	-- love.graphics.rectangle('line', 0, 0, player_2.width, player_2.height)
	-- love.graphics.translate(-player_2.x, -player_2.y)
end

