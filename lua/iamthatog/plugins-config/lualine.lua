local lualine_setup, lualine = pcall(require, 'lualine')

if not lualine_setup then
  print('lualine plugin not installed')
  return
end

lualine.setup {
  options = {
    theme = 'nord'
  }
}

