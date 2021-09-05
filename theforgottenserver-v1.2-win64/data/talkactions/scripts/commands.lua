function onSay(cid, words, param)
local p = Player(cid)
local file = io.open("data/talkactions/talkactions.xml", "r+")
local str = ""
local text = ""
for line in (file:lines()) do
  str = str.."\n"..line
end
file:close()

for a in string.gmatch(str, '<talkaction words="(.-)"') do
  text = text..'\n'..a
end

  p:showTextDialog(2160, text)
  return true
end