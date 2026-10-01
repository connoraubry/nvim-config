return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},

	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			defaults = {
				mappings = {
					i = { ["<c-enter>"] = "to_fuzzy_refine" },
				},
			},
			pickers = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local diff_base = require("config.diff_base")

		-- Custom live_grep function to search in git root
		local function live_grep_git_root()
			local git_root = diff_base.find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end
		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

		-- Telescope picker listing files changed vs a single git revision
		-- (working tree included), with a diff preview and <CR> to open the file.
		local function diff_files_picker(spec)
			local git_root = diff_base.find_git_root()
			local results = vim.fn.systemlist({ "git", "-C", git_root, "diff", "--name-only", spec.rev })
			if vim.v.shell_error ~= 0 then
				vim.notify("git diff failed: " .. table.concat(results, "\n"), vim.log.levels.ERROR)
				return
			end
			if spec.include_untracked then
				local untracked = vim.fn.systemlist({ "git", "-C", git_root, "ls-files", "--others", "--exclude-standard" })
				vim.list_extend(results, untracked)
			end
			if #results == 0 then
				vim.notify("No changed files (" .. spec.title .. ")", vim.log.levels.INFO)
				return
			end

			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local previewers = require("telescope.previewers")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			pickers
				.new({}, {
					prompt_title = spec.title,
					finder = finders.new_table({ results = results }),
					sorter = conf.generic_sorter({}),
					previewer = previewers.new_termopen_previewer({
						get_command = function(entry)
							return { "git", "-C", git_root, "diff", spec.rev, "--", entry.value }
						end,
					}),
					attach_mappings = function(prompt_bufnr)
						actions.select_default:replace(function()
							local entry = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							vim.cmd("edit " .. git_root .. "/" .. entry.value)
						end)
						return true
					end,
				})
				:find()
		end

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		-- vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
		-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set(
			"n",
			"<leader>fs",
			require("telescope.builtin").live_grep,
			{ desc = "[F]ind [S]earch (using grep)" }
		)
		vim.keymap.set("n", "<leader>fG", ":LiveGrepGitRoot<cr>", { desc = "[F]ind by [G]rep on Git Root" })
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind [B]uffers" })

		-- [F]ind [C]hanged files vs whatever diff base is currently active
		-- (see <leader>gw / <leader>g1 / <leader>gm below).
		vim.keymap.set("n", "<leader>fc", function()
			if diff_base.current == "worktree" then
				builtin.git_status()
				return
			end
			local spec = diff_base.spec()
			if not spec then
				vim.notify("Could not resolve diff base", vim.log.levels.ERROR)
				return
			end
			diff_files_picker(spec)
		end, { desc = "[F]ind [C]hanged files (vs current diff base)" })

		vim.keymap.set("n", "<leader>gw", function()
			diff_base.set("worktree")
		end, { desc = "[G]it diff base: [W]orking tree" })
		vim.keymap.set("n", "<leader>g1", function()
			diff_base.set("HEAD~1")
		end, { desc = "[G]it diff base: HEAD~[1]" })
		vim.keymap.set("n", "<leader>gm", function()
			diff_base.set("main")
		end, { desc = "[G]it diff base: [M]ain" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })
	end,
}
