-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local m = {}

function m.splitChr(str, delimiter, fn)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        if fn then
          match = fn(match)
        end
        if match then
          table.insert(result, match)
        end
    end
    return result
end

function m.splitNth(str, n, fn)
  local result = {}
  for i=1, math.ceil(string.len(str) / n) do
    local id = string.sub(str, 1 + n*(i-1), n*i)
    if fn then
      id = fn(id)
    end
    if id then
      table.insert(result, id)
    end
  end
  return result
end

function m.cleanupCodes(str)
  if str == nil then
    return str
  end
  return str:gsub("%[[%a%d/]*%]", "")
end

return m
