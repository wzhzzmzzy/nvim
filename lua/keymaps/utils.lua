local table_assign = function(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

-- telescope
---@return string
local get_visual_selection = function()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

return {
  common = vim.keymap.set,
  del = vim.keymap.del,
  force = { remap = true },
  assign = table_assign,
  visual_selection = get_visual_selection,
}
