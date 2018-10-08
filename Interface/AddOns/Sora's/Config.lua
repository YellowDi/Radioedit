-- Engine
local S, C, L, DB = unpack(select(2, ...))

-- Variables
if not C.Core then
    C.Core = {}
end

C.Core.UIScale = 1.00 -- 全局UI缩放比例
C.Core.FontScale = 1.00 -- 全局字体缩放比例