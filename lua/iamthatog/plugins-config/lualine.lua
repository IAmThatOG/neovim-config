local setup, lualine = pcall(require, 'lualine')

if not setup then
  print('lualine plugin not installed')
  return
end

lualine.setup {
  options = {
    theme = 'rose-pine'
  }
}

