-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
if not C.Chat then
    C.Chat = {}
end

C.Chat.TimeStamp = true -- 启用聊天时间戳
C.Chat.ShortChannel = true -- 启用聊天频道名缩写
C.Chat.ChatFrameSize = {450, 132} -- 聊天框体大小
C.Chat.ChatFramePostion = {"BOTTOMLEFT", UIParent, 28, 28} -- 聊天框体位置
