local opts = {
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  termguicolors = true,
  number = true,
  relativenumber = true,
  timeout = true,
  timeoutlen = 500,
}

-- Set options from table
for opt, val in pairs(opts) do
  vim.o[opt] = val
end
