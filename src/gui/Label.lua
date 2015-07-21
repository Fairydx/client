local TLabel = {}
local TLabelMetatable = {__index = TLabel}
TLabel.Type = "Label"
setmetatable(TLabel, gui.TGadgetMetatable)

function gui.CreateLabel(Text, x, y, Parent)
	local Label = TLabel.New()
	if Parent:AddGadget(Label) then
		Label:SetText(Text)
		Label:SetPosition(x, y)
		return Label
	end
end

function TLabel.New()
	return setmetatable({}, TLabelMetatable)
end

function TLabel:SetText(Text)
	local Font = self:GetFont()
	self.Text = Text
	self.Size = {Width = Font:getWidth(Text), Height = Font:getHeight()}
end

function TLabel:Render()
	if not self.Hidden then
		local x, y = self:x(), self:y()
		local Width, Height = self:Width(), self:Height()
		local Theme = self:GetTheme()
		local Font = self:GetFont()
		love.graphics.setScissor(x - 1, y - 1, Width + 2, Height + 2)
		love.graphics.setColor(unpack(Theme.Text))
		love.graphics.setFont(Font)
		love.graphics.print(self.Text, x, y)
	end
end