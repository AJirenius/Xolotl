local M = {}

M.user = {
	progress = 1
}
local path = sys.get_save_file("ludum_game", "progress")

function M.load_progress(self)
	M.user = sys.load(path)
	if M.user.progress == nil then
		M.user = {
			progress = 1
		}
	end
end

function M.save_progress(self, progress)
	if progress ~= nil then M.user.progress = progress end
	sys.save(path, M.user)
end

return M
