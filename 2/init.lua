-- // Leo's Neovim Config!
-- // See: https://github.com/lightersup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local Opt = vim.opt
Opt.number = true
Opt.relativenumber = true
Opt.tabstop = 4
Opt.shiftwidth = 4
Opt.expandtab = true
Opt.smartindent = true
Opt.wrap = false
Opt.clipboard = "unnamedplus"
Opt.mouse = "a"
Opt.termguicolors = true
Opt.signcolumn = "yes"
Opt.swapfile = false
Opt.backup = false
Opt.undofile = true
Opt.scrolloff = 8
Opt.sidescrolloff = 8
Opt.completeopt = { "menuone", "noselect" }

local Keymap = vim.keymap.set
Keymap("n", "<leader>w", ":w<CR>", { silent = true })
Keymap("n", "<leader>q", ":q<CR>", { silent = true })
Keymap("n", "<C-s>", ":w<CR>", { silent = true })
Keymap("i", "<C-s>", "<Esc>:w<CR>a", { silent = true })
Keymap("n", "<C-h>", "<C-w>h", { silent = true })
Keymap("n", "<C-j>", "<C-w>j", { silent = true })
Keymap("n", "<C-k>", "<C-w>k", { silent = true })
Keymap("n", "<C-l>", "<C-w>l", { silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})

local Lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(Lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", Lazypath })
end
vim.opt.rtp:prepend(Lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})

vim.cmd.colorscheme("catppuccin-mocha")

