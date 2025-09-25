require('constants')

local Player = require('Player')

local player_1 = Player:new( 1, 5, 5)
local player_2 = Player:new( 2, 50, 50)


function love.load()
	print('DBG:', 'load')
	print('DBG:', 'Vestion', love.getVersion())

	screen_width  = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()
	print('DBG: size', screen_width, screen_height)
end

function love.update(dt)
	player_1:update(dt)
	player_2:update(dt)
end

function love.draw()
	player_1:draw()
	player_2:draw()
end

