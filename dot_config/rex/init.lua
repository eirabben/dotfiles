-- Rex configuration. See https://www.superlogical.com/rex/docs/customize/config
-- Reload after `chezmoi apply` with: rex config reload

-- Zellij-style MoveFocusOrTab: focus the pane in `direction`, or switch to the
-- previous/next tab when there is no pane that way.
--
-- Tabs and focus are owned by the app, so this only inspects the layout and
-- queues client actions; changing the server's active window directly is
-- ignored by the app.

local function collect_rects(node, out)
  if type(node) ~= "table" then
    return
  end
  if node.block_id and type(node.rect) == "table" then
    out[node.block_id] = node.rect
  end
  for _, child in pairs(node) do
    if type(child) == "table" then
      collect_rects(child, out)
    end
  end
end

local function has_neighbor(view, direction)
  local window
  for _, w in ipairs(view.windows or {}) do
    if w.window_id == view.active_window_id then
      window = w
    end
  end
  if not window or not window.focused_block_id then
    return false
  end

  local rects = {}
  for _, layer in ipairs(window.layers or {}) do
    if layer.kind == "tiled" then
      collect_rects(layer.layout, rects)
    end
  end
  local f = rects[window.focused_block_id]
  if not f then
    return false
  end

  local eps = 1e-6
  local fx, fy, fw, fh = f[1], f[2], f[3], f[4]
  for id, r in pairs(rects) do
    if id ~= window.focused_block_id then
      local x, y, w, h = r[1], r[2], r[3], r[4]
      local overlaps_y = y < fy + fh - eps and y + h > fy + eps
      local overlaps_x = x < fx + fw - eps and x + w > fx + eps
      if direction == "left" and overlaps_y and x + w <= fx + eps then
        return true
      elseif direction == "right" and overlaps_y and x >= fx + fw - eps then
        return true
      elseif direction == "up" and overlaps_x and y + h <= fy + eps then
        return true
      elseif direction == "down" and overlaps_x and y >= fy + fh - eps then
        return true
      end
    end
  end
  return false
end

rex.action({
  name = "focus_pane_or_tab",
  title = "Focus Pane or Tab",
  category = "Pane",
  args = { direction = "string" },
  run = function(_, args)
    local view = rex.session.view({})
    if view and has_neighbor(view, args.direction) then
      rex.client.queue("pane.focus", { direction = args.direction })
    elseif args.direction == "left" then
      rex.client.queue("client.tab.previous")
    elseif args.direction == "right" then
      rex.client.queue("client.tab.next")
    end
  end,
})

rex.bind("alt+h", "focus_pane_or_tab", { direction = "left" })
rex.bind("alt+l", "focus_pane_or_tab", { direction = "right" })
rex.bind("alt+j", "pane.focus", { direction = "down" })
rex.bind("alt+k", "pane.focus", { direction = "up" })
