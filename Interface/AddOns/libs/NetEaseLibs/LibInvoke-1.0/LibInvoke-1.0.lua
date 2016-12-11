--[[
@Date    : 2016-06-15 16:42:46
@Author  : DengSir (ldz5@qq.com)
@Link    : https://dengsir.github.io
@Version : 1
]]

local MAJOR, MINOR = "LibInvoke-1.0", 1
local Invoke, oldminor = LibStub:NewLibrary(MAJOR, MINOR)
if not Invoke then return end

function Invoke:Embed(target)
    target.Invoke = setmetatable({}, {__newindex = function(t, k, v)
        if type(v) ~= 'function' then
            error('You can only invoke function', 2)
        end

        target[k] = function(self, ...)
            local args = {...}
            local argCount = select('#', ...)

            C_Timer.After(0, function()
                v(self, unpack(args, 1, argCount))
            end)
        end
    end})
end