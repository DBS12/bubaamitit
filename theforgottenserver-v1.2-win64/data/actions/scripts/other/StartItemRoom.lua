--[[
	Rune Script 8.6
	By Bartastkd
]]--

local config = {

    [1017] = {potion = 12645, cost = 10000,}, 
    [1001] = {potion = 12642, cost = 10000,}, 
    [1002] = {potion = 12643, cost = 10000,}, 
    [1003] = {potion = 12644, cost = 10000,}, 
    [1004] = {potion = 2644, cost = 10000,}, 
    [1005] = {potion = 10502, cost = 10000,}, 
    [1006] = {potion = 2198, cost = 10000,}, 
    [1007] = {potion = 12318, cost = 10000,}, 
    [1008] = {potion = 12649, cost = 10000,}, 
    [1009] = {potion = 3965, cost = 10000,}, 
    [1010] = {potion = 2298, cost = 10000,}, 
    [1011] = {potion = 2281, cost = 10000,}, 
    [1012] = {potion = 2307, cost = 10000,}, 
    [1013] = {potion = 5785, cost = 10000,}, 
    [1014] = {potion = 1953, cost = 10000,}, 
	[1015] = {potion = 14324, cost = 10000,}, 
	[1016] = {potion = 6542, cost = 0,}, 

   
} -- config end --
 
function onUse(cid, item, fromPosition, itemEx, toPosition)

	local potion = config[item.uid]
	if isInArray({1945, 1946}, item.itemid) ~= TRUE then

		return TRUE
	end
 

	if doPlayerRemoveMoney(cid,potion.cost) == TRUE then 
		if getItemName(potion.potion) == "Buba's Egg" then 
			doPlayerAddItem(cid,potion.potion,100)
		else
			doPlayerAddItem(cid,potion.potion,1)
			doSendMagicEffect(getPlayerPosition(cid), 13)
			doPlayerSendTextMessage(cid,19,"You got " .. getItemName(potion.potion) .. "!")
			end



 	else
		doPlayerSendCancel(cid, "You Dont Have Money.")
			end
    return false
    end