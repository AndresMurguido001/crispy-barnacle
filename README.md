# Asciify

Simple function to utilize figlet to create new startup font everytime starting up nvim.
Meant to work with alpha.nvim.

```lua
local status, ascii_art = pcall(require, "ascii_art")
if not status then
  return
end

-- Alpha.nvim dashboard section header. Displays 'NEOVIM'
-- with random figlet font on every startup
dashboard.section.header.val = ascii_art.asciify("NEOVIM")
```
