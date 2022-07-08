
M = {}


local function fetch_font_names()
  local font_names = {}
  local handle = io.popen("ls $(figlet -I2)")

  if handle == nil then
    return
  end

  for line in handle:lines() do
    if string.match(line, ".*.flf") then
      table.insert(font_names, line)
    end
  end
  handle:close()
  return font_names
end

-- TODO: adjust the font width to fit the alpha dashbaard
-- TODO: save the 'font_names' table for reuse since it is not changed often (if at all)
function M.asciify(text)
  local font_names = fetch_font_names()
  local chosen_font = font_names[math.random(#font_names)]
  local handle = io.popen("figlet -f " .. chosen_font .. " " .. text)

  if handle == nil then
    return
  end

  local result = handle:read("*a")
  print("Chosen Font: " .. chosen_font)

  handle:close()
  return result
end


return M
