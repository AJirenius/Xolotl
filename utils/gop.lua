local M = {}

local gop_tables = {}

function M.get_properties(url)
	url = url or msg.url(".")
	if type(url) == "string" then url = msg.url(url) end
	if gop_tables[url.path] == nil then gop_tables[url.path] = {} end
	return gop_tables[url.path]
end

function M.final(url)
	url = url or msg.url(".")
	if type(url) == "string" then url = msg.url(url) end
	gop_tables[url.path] = nil
end

return M
