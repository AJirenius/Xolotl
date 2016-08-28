local M = {}

function M.register(url)
	M.url = url
end

function M.play(id, delay, gain)
	local s = msg.url(M.url)
	s.fragment = id
	msg.post(s, "play_sound", { delay = delay, gain = gain } )
end


return M
