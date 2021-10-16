vim.cmd 'packadd packer.nvim'

local g = vim.g
local o = vim.opt
local remap = vim.api.nvim_set_keymap

require('packer').startup(function()
	use { 'wbthomason/packer.nvim' }
	use { 'lilydjwg/colorizer' }
	use { 'romgrk/barbar.nvim' }
	use { 'hoob3rt/lualine.nvim' }
	use { 'sheerun/vim-polyglot' }
	use { 'navarasu/onedark.nvim' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
	}
end)

g.mapleader = ' '

o.tabstop = 4
o.shiftwidth = 4
o.encoding = 'UTF-8'
o.clipboard = 'unnamedplus'

o.mouse = 'a'
o.title = true
o.wrap = false
o.number = true
o.hlsearch = true
o.incsearch = true
o.showmode = false
o.showmatch = true
o.swapfile = false
o.expandtab = true
o.autoindent = true
o.smartindent = true

remap('', '<leader>q', ':bd<CR>', { noremap = true })
remap('', '<leader><Up>', ':tabnew<CR>', { noremap = true })
remap('', '<leader><Left>', ':tabprev<CR>', { noremap = true })
remap('', '<leader><Right>', ':tabnext<CR>', { noremap = true })

remap('', '<leader>o', ':Telescope oldfiles<CR>', { noremap = true })
remap('', '<leader>t', ':Telescope find_files<CR>', { noremap = true })
remap('', '<leader>f', ':Telescope file_browser<CR>', { noremap = true })
remap('', '<leader>s', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true })

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				['<esc>'] = actions.close
			}
		}
	}	
})

g.modes = {
	n = 'Normal',
	i = 'Insert',
	v = 'Visual',
	V = 'V-Line',
	R = 'Replace',
	c = 'Command',
	Rv = 'V-Replace',
	['<C-V>'] = 'V-Block',
} 

g.bufferline = {
	icons = false,
	autohide = true,
	closable = true,
	clickable = true,
	animation = false,
	icon_close_tab = 'x',
	no_name_title = 'New File',
}

require('lualine').setup({
	options = {
		theme = 'onedark',
		icons_enabled = false,
	}
})

require('onedark').setup()
