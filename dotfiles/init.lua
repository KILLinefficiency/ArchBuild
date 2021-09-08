vim.cmd 'packadd packer.nvim'

require('packer').startup(function()
	use { 'wbthomason/packer.nvim' }
	use { 'monsonjeremy/onedark.nvim' }
	use { 'hoob3rt/lualine.nvim' }
--	use { 'mhinz/vim-startify' }
	use { 'sheerun/vim-polyglot' }
	use { 'lilydjwg/colorizer' }
	use { 'francoiscabrol/ranger.vim' }
	use { 'glepnir/dashboard-nvim' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
	}
end)

require('lualine').setup {
	options = { theme = 'onedark' },
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
		lualine_y = {},
		lualine_z = { 'location' }
	}
}

vim.g.mapleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.title = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.paste = true

vim.api.nvim_set_keymap('', '<leader>r', ':Ranger<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<leader>t', ':Telescope find_files<CR>', { noremap = true })

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {

	' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
	' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
	' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
	' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
	' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
	' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',

}

vim.cmd 'colorscheme onedark'
