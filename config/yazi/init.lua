---@diagnostic disable: undefined-global
require("full-border"):setup()

function Status:name()
	local h = self._tab.current.hovered
	if not h then
		return ui.Line({})
	end

	local linked = ""
	if h.link_to ~= nill then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Line(" " .. h.name .. linked)
end

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line({})
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

-- function Status:render(area)
-- 	self.area = area
--
-- 	local left = ui.Line({ self:mode(), self:name() })
-- 	local right = ui.Line({ self:permissions(), self:position() })
-- 	return {
-- 		ui.Paragraph(area, { left }),
-- 		ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
-- 		table.unpack(Progress:render(area, right:width())),
-- 	}
-- end
