local firstItems = {2173, 2481, 2465, 2478, 2529, 2643}

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		for i = 1, #firstItems do
			player:addItem(firstItems[i], 1)
		end
		player:addItem(1988):addItem(2160, 10)
	end
	return true
end
