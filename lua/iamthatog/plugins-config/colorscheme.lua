local colorSchemeSet, colorScheme = pcall(require, 'nord')

if not colorSchemeSet then
  print('Color scheme not found!...')
  return
end

colorScheme.setup({
  comments = {italic = true},
  styles = {
    bufferline = {
      curernt = {},
      modified = {italic = true},
    }
  }
})

function ColorMyPencils(color)
  if not color then
    color = 'rose-pine'
    return
  end

  vim.cmd.colorscheme(color)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils('nord')

