local M = {}
local config = require "main.config"

function M.register(url)
	M.url = url
end

local current_music

function M.play_music(id)
	if config.SOUND_OFF == true then return end
	local s = msg.url(M.url)
	s.fragment = id
	if current_music then 
		msg.post(current_music, "stop_sound") 
	end
	current_music = s
	msg.post(current_music, "play_sound")
end

function M.stop(url)
	msg.post(url, "stop_sound") 
end

function M.play(id, delay, gain)
	if config.SOUND_OFF == true then return end
	local s = msg.url(M.url)
	s.fragment = id
	msg.post(s, "play_sound", { delay = delay, gain = gain } )
	return s
end


return M
