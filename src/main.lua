function love.load()
	print('DBG:', 'load')
end

function love.gamepadpressed(i, key)
	print(">>", i, key)

	if key == 'start' then
		love.quit()
	end
end
function love.gamepadreleased()
end

