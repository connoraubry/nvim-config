local work_notes_dir = vim.fn.expand("~/Documents/work-notes")
local daily_dir = work_notes_dir .. "/daily"
local weekly_dir = work_notes_dir .. "/weekly"
local accomplishments_path = work_notes_dir .. "/accomplishments.md"

local function ensure_dir(path)
	vim.fn.mkdir(path, "p")
end

-- Most recent Sunday on/before today (today itself if today is Sunday).
local function sunday_of_this_week()
	local wday = tonumber(os.date("%w")) -- 0 = Sunday
	local sunday_time = os.time() - (wday * 86400)
	return os.date("%Y-%m-%d", sunday_time)
end

-- Opens `path`, creating its parent dir if needed. If the file doesn't
-- already exist, seeds it with `template_lines` and writes it so the
-- template is only ever inserted once.
local function open_note(path, template_lines)
	ensure_dir(vim.fn.fnamemodify(path, ":h"))
	local is_new = vim.fn.filereadable(path) == 0

	vim.cmd.edit(path)

	if is_new and template_lines then
		vim.api.nvim_buf_set_lines(0, 0, -1, false, template_lines)
		vim.cmd.write()
	end
end

local function open_daily_note()
	local date = os.date("%Y-%m-%d")
	open_note(daily_dir .. "/" .. date .. ".md", {
		"# " .. date,
		"",
		"## Today",
		"-",
		"",
		"## Decisions / Blockers / Notable Context",
		"-",
		"",
		"## Possible Accomplishment Bullets",
		"-",
		"",
	})
end

local function open_weekly_note()
	local date = sunday_of_this_week()
	open_note(weekly_dir .. "/" .. date .. ".md", {
		"# Week of " .. date,
		"",
		"## Completed / Advanced",
		"-",
		"",
		"## Problems Solved",
		"-",
		"",
		"## Collaboration / Support",
		"-",
		"",
		"## Decisions / Risks / Blockers",
		"-",
		"",
		"## Accomplishment Bullets",
		"-",
		"",
	})
end

local function open_accomplishments_log()
	open_note(accomplishments_path, nil)
end

vim.keymap.set("n", "<leader>nd", open_daily_note, { desc = "[N]ote: [D]aily" })
vim.keymap.set("n", "<leader>nw", open_weekly_note, { desc = "[N]ote: [W]eekly" })
vim.keymap.set("n", "<leader>na", open_accomplishments_log, { desc = "[N]ote: [A]ccomplishments" })
