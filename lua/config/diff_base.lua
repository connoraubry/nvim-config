-- Shared "diff base" state: one global setting (worktree / HEAD~1 / main)
-- that both the Telescope "changed files" picker and gitsigns' hunk
-- navigation (]c / [c) read from, so they never disagree.
local M = {}

M.current = "worktree"

local function git(dir, args)
	local cmd = vim.list_extend({ "git", "-C", dir }, args)
	local out = vim.fn.systemlist(cmd)
	return out, vim.v.shell_error
end

function M.find_git_root()
	local cwd = vim.fn.getcwd()
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir = current_file == "" and cwd or vim.fn.fnamemodify(current_file, ":h")
	local out, code = git(current_dir, { "rev-parse", "--show-toplevel" })
	if code ~= 0 then
		vim.notify("Not a git repository. Using current working directory", vim.log.levels.WARN)
		return cwd
	end
	return out[1]
end

-- main -> master -> origin/HEAD's resolved default branch
function M.resolve_main_branch()
	local git_root = M.find_git_root()
	for _, candidate in ipairs({ "main", "master" }) do
		local _, code = git(git_root, { "rev-parse", "--verify", "--quiet", candidate })
		if code == 0 then
			return candidate
		end
	end
	local out, code = git(git_root, { "rev-parse", "--abbrev-ref", "origin/HEAD" })
	if code == 0 and out[1] and out[1] ~= "" then
		return out[1]:gsub("^origin/", "")
	end
	return nil
end

-- Returns { rev = "<sha-or-rev>", title = "...", include_untracked = bool }
-- describing the active base, or nil for "worktree" (handled by git_status directly).
function M.spec()
	local git_root = M.find_git_root()
	if M.current == "HEAD~1" then
		return { rev = "HEAD~1", title = "Changed vs HEAD~1", include_untracked = false }
	elseif M.current == "main" then
		local branch = M.resolve_main_branch()
		if not branch then
			return nil
		end
		local out, code = git(git_root, { "merge-base", branch, "HEAD" })
		if code ~= 0 or not out[1] then
			return nil
		end
		return { rev = out[1], title = "Changed vs " .. branch, include_untracked = true }
	end
	return nil
end

function M.set(base)
	M.current = base
	local ok, gitsigns = pcall(require, "gitsigns")

	if base == "worktree" then
		if ok then
			gitsigns.change_base(nil, true)
		end
		vim.notify("Diff base: working tree")
		return
	end

	local spec = M.spec()
	if not spec then
		vim.notify("Could not resolve diff base: " .. base, vim.log.levels.ERROR)
		return
	end
	if ok then
		gitsigns.change_base(spec.rev, true)
	end
	vim.notify("Diff base: " .. spec.title)
end

return M
