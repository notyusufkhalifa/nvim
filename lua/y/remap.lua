vim.g.mapleader = " "
vim.g.maplocalleader = " "

local bind = vim.keymap.set

bind("n", "<leader>cd", vim.cmd.Ex)

bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

bind("n", "J", "mzJ'z")
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

bind("n", "<leader>lua", "<cmd>LspRestart<cr>")

bind({ "n", "v" }, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])

-- don't put deleted text in clipboard
bind("x", "<leader>p", [["_dP]])
bind({ "n", "v" }, "<leader>d", [["_d]])

bind("i", "<C-c>", "<Esc>")

bind("n", "<C-j>", "<cmd>cnext<CR>zz")
bind("n", "<C-k>", "<cmd>cprev<CR>zz")

bind("n", "Q", "<nop>")

bind("n", "<leader>k", "<cmd>lnext<CR>zz")
bind("n", "<leader>j", "<cmd>lnext<CR>zz")

bind("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

bind("n", "<leader>y", "<Plug>OSCYankOperator")
bind("v", "<leader>y", "<Plug>OSCYankVisual")

bind("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

bind("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Quickfix
bind("n", "<leader>cl", ":cclose<CR>", { silent = true })
bind("n", "<leader>co", ":copen<CR>", { silent = true })
bind("n", "<leader>cn", ":cnext<CR>zz")
bind("n", "<leader>cp", ":cprev<CR>zz")
bind("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP info" })

bind("n", "<leader>mm", "<cmd>make<CR>")

bind("n", "<leader><leader>", function()
  vim.cmd("so")
end)
