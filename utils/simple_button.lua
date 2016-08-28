local M = {}

M.buttons = {}

function M.create(context, node, callback, data)
	if type(node) == "string" then node = gui.get_node(node) end
	if M.buttons[context] == nil then M.buttons[context] = {} end
	local button = {
		node = node,
		cb = callback, 
		data = data,
		scale = gui.get_scale(node),
	}
	table.insert(M.buttons[context], button)
	return button
end

function M.enable(button)
	gui.set_enabled(button.node, true)
end

function M.disable(button)
	gui.set_enabled(button.node, false)
end

function M.on_input(context, action_id, action)
	local btns = M.buttons[context]
	if btns == nil then return end
	if action_id == hash("touch") then
		local btn 
		for i,v in ipairs(btns) do
			if gui.pick_node(v.node, action.x, action.y) == true and gui.is_enabled(v.node) then
				btn = v
			end
		end
		if action.pressed and btn then
			local sc = btn.scale*0.95
			M.pressed_btn = btn
			gui.animate(btn.node, "scale", sc, gui.EASING_LINEAR, 0.04, 0)
		elseif action.released then
			if M.pressed_btn then
				gui.animate(M.pressed_btn.node, "scale", M.pressed_btn.scale, gui.EASING_LINEAR, 0.2, 0)
				M.pressed_btn = nil
				if btn then
					btn.cb(btn.node, btn.data)
				end
			end
		end
	end
end

function M.final(context)
    M.buttons[context] = nil
end

return M