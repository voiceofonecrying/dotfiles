vim.g.mapleader = " "

local m = vim.keymap

m.set("n", "<leader>pv", vim.cmd.Ex)

m.set("v", "J", ":m '>+1<CR>gv=gv")
m.set("v", "K", ":m '>-2<CR>gv=gv")

m.set("n", "J", "mzJ`z")

m.set("n", "<C-d>", "<C-d>zz")
m.set("n", "<C-u>", "<C-u>zz")
m.set("n", "n", "nzzzv")
m.set("n", "N", "Nzzzv")
m.set("n", "=ap", "ma=ap'a")

-- greatest remap ever
m.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
m.set({ "n", "v" }, "<leader>y", [["+y]])
m.set("n", "<leader>Y", [["+Y]])

m.set({ "n", "v" }, "<leader>d", "\"_d")

m.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

m.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
m.set("n", "<leader>fml", "<cmd>CellularAutomaton game_of_life<CR>")

