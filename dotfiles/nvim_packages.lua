vim.cmd 'packadd packer.nvim'

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
