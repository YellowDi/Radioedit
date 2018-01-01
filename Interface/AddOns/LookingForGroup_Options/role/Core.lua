local LookingForGroup_Options = LibStub("AceAddon-3.0"):GetAddon("LookingForGroup_Options")
local GetLFGRoles = GetLFGRoles
local C_LFGList_GetSearchResultMemberCounts = C_LFGList.GetSearchResultMemberCounts
local math_ceil = math.ceil

function LookingForGroup_Options.FilterRole(id,members,categoryID)
	local _,t,h,d = GetLFGRoles()
	local tb = C_LFGList_GetSearchResultMemberCounts(id)
	local tank = tb.TANK
	local healer = tb.HEALER
	local damager = tb.NOROLE + tb.DAMAGER
	if categoryID == 1 or categoryID == 4 then
		if not (d or (h and healer == 0) or (t and tank == 0)) then
			return true
		end
	elseif categoryID == 2 then
		if not ((d and (damager < 4)) or (h and healer == 0) or (t and tank == 0)) then
			return true
		end
	elseif categoryID == 3 then
		local nm = 15
		if nm < members then
			nm = members
		end
		local maxhealer = math_ceil(nm/5)
		local maxmembers = maxhealer * 5
		if not ((d and damager + 1 < maxmembers) or (h and healer < maxhealer) or (t and tank < 2)) then
			return true
		end
	elseif categoryID == 9 then
		if not ((d and damager < 7) or (h and healer < 3) or (t and tank == 0)) then
			return true
		end
	end
end

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

LookingForGroup_Options:push("role",
{
	name = ROLE,
	type = "group",
	order = 8,
	args =
	{
		comment =
		{
			order = get_order(),
			name = COMMENT,
			type = "input",
			multiline = true,
			width = "full",
			set = function(info,val)
				LookingForGroup_Options.db.profile.role_comment_text = val
			end,
			get = function(info)
				return LookingForGroup_Options.db.profile.role_comment_text
			end,
		},
		cancel =
		{
			order = get_order(),
			name = RESET,
			type = "execute",
			func = function()
				LookingForGroup_Options:RestoreDBVariable("role_comment_text")
			end
		},
		leader =
		{
			order = get_order(),
			name = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:0:19:1:20|t"..LEADER,
			desc = GUIDE_TOOLTIP,
			type = "toggle",
			get = function(info)
				return GetLFGRoles()
			end,
			set = function(info,val)
				local leader,tank,healer,damage = GetLFGRoles()
				SetLFGRoles(val,tank,healer,damage)
			end,
			width = "full",
		},
		tank = 
		{
			order = get_order(),
			name = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:0:19:22:41|t"..TANK,
			desc = ROLE_DESCRIPTION_TANK,
			type = "toggle",
			get = function(info)
				return select(2,GetLFGRoles())
			end,
			set = function(info,val)
				local leader,tank,healer,damage = GetLFGRoles()
				SetLFGRoles(leader,val,healer,damage)
			end,
			width = "full",
		},
		healer = 
		{
			order = get_order(),
			name = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:1:20|t"..HEALER,
			desc = ROLE_DESCRIPTION_HEALER,
			type = "toggle",
			get = function(info)
				return select(3,GetLFGRoles())
			end,
			set = function(info,val)
				local leader,tank,healer,damage = GetLFGRoles()
				SetLFGRoles(leader,tank,val,damage)
			end,
			width = "full",
		},
		damage = 
		{
			order = get_order(),
			name = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:22:41|t"..DAMAGER,
			desc = ROLE_DESCRIPTION_DAMAGER,
			type = "toggle",
			get = function(info)
				return select(4,GetLFGRoles())
			end,
			set = function(info,val)
				local leader,tank,healer,damage = GetLFGRoles()
				SetLFGRoles(leader,tank,healer,val)
			end,
			width = "full",
		},
	}
})
