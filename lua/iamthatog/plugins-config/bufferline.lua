local bufferline_setup, bufferline = pcall(require, 'bufferline')

if not bufferline_setup then
  print('bufferline plugin not setup')
  return
end

local setup = {
  options = {
    separator_style = 'thin',
    color_icons = true,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
    end
  }
}

local highlights_setup, highlights = pcall(require, 'rose-pine.plugins.bufferline')

if not highlights_setup then
  print('rose-pine highlights not setup')
else
  setup['highlights'] = highlights
end

bufferline.setup(setup)

