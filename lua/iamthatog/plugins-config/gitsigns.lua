-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  print('gitsigns plugin not installed')
  return
end

-- configure/enable gitsigns
gitsigns.setup()

