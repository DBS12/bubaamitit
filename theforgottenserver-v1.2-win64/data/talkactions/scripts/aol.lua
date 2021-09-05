function onSay(cid, words, param)
if doPlayerRemoveMoney(cid, 10000) then
   doPlayerAddItem(cid,2173,1)
   doSendMagicEffect(getPlayerPosition(cid),12)
   doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You've bought an amulet of loss!")
else
	doPlayerSendCancel(cid,"You don't have enough money.")
	doSendMagicEffect(getPlayerPosition(cid),2)
end
return true
end