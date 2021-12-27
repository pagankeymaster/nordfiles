local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
    map("n", "<leader>cc", ":Telescope <CR>", opt)
    map("n", "<leader>q", ":q <CR>", opt)
end)

hooks.add("install_plugins", function(use)
    use "rinx/nvim-minimap"

    use '9mm/vim-closer'

    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    use {
        "karb94/neoscroll.nvim",
        opt = true,
        config = function() require("neoscroll").setup() end,

        -- lazy loading
        setup = function()
            require("core.utils").packer_lazy_load "neoscroll.nvim"
        end
    }

    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            local autosave = require "autosave"

            autosave.setup {
                enabled = true,
                execution_message = "autosaved at : " ..
                    vim.fn.strftime "%H:%M:%S",
                events = {"InsertLeave", "TextChanged"},
                conditions = {
                    exists = true,
                    filetype_is_not = {},
                    modifiable = true
                },
                clean_command_line_interval = 2500,
                on_off_commands = true,
                write_all_buffers = false
            }
        end,
        disable = true
    }

    use {
        "Pocco81/TrueZen.nvim",
        cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
        disable = true
    }

    use "nathom/filetype.nvim"

    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

    use "nvim-lua/popup.nvim"

    use {"Shatur/neovim-session-manager", disable = true}

    use "chrisbra/Colorizer"

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        disable = true
    }

    use "elkowar/yuck.vim"

    use "wakatime/vim-wakatime"

    use "rcarriga/nvim-notify"

    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}

    use 'andweeb/presence.nvim'

    use {'vimsence/vimsence', disable = true}

    use 'sheerun/vim-polyglot'

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("null-ls").setup() end,
        requires = {"nvim-lua/plenary.nvim"}
    })

    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            {'nvim-telescope/telescope.nvim'}, {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        }
    }

    use {
        'KadoBOT/nvim-spotify',
        requires = 'nvim-telescope/telescope.nvim',
        config = function()
            local spotify = require 'nvim-spotify'
            spotify.setup {
                refresh_token = "AQAp3kFcxfmzV3zUHmaT8JkSG6dNmYbhDJ33NQChNJP5RWSHjaQDt5SL2PKFwKd0B-KdXw7TaHDlKf9JKIFp6fuhzyPlX5qN8PwhOchf7kFEJW-H-ji8vvHjUQsvdd-F1mw"
            }
        end,
        run = 'make',
        disable = true
    }

end)

-- vim:ft=lua:nowrap
