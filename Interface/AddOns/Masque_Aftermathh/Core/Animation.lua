local A, C, M, L = select(2, ...):unpack()

local Animation = CreateFrame("Frame")
local AnimationBars = {}

function Animation:SetSmoothValue(Value)
	if (Value ~= self:GetValue() or Value == 0) then
		AnimationBars[self] = Value
	else
		AnimationBars[self] = nil
	end
end

function Animation:SetSmooth(self)
    if not (self.SetNewValue) then
		self.SetNewValue = self.SetValue
		self.SetValue = Animation.SetSmoothValue
    end
end

function Animation:ResetSmooth(self)
    if (self.SetNewValue) then
		self.SetValue = self.SetNewValue
		self.SetNewValue = nil
    end
end

function Animation:AddSmooth(self)
    Animation.SetSmooth = Animation.SetSmooth
	Animation:SetSmooth(self)
end

function Animation:UpdateSmooth()
	for Frame, Value in pairs(AnimationBars) do
		local CurrentValue = Frame:GetValue()
		local NewValue = CurrentValue + ((Value - CurrentValue) / 3)

    	if (NewValue ~= NewValue) then
			NewValue = Value
		end
		
		if (CurrentValue == Value or abs(NewValue - Value) < 2) then
			Frame:SetNewValue(Value)
			AnimationBars[Frame] = nil
	    else
			Frame:SetNewValue(NewValue)
		end
	end
end

Animation:SetScript("OnUpdate", Animation.UpdateSmooth)

A["Animation"] = Animation