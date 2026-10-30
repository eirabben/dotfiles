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

local function tiled_rects(window)
  local rects = {}
  for _, layer in ipairs(window.layers or {}) do
    if layer.kind == "tiled" then
      collect_rects(layer.layout, rects)
    end
  end
  return rects
end

local function active_window_index(view)
  for i, w in ipairs(view.windows or {}) do
    if w.window_id == view.active_window_id then
      return i
    end
  end
end

-- The pane to land on when entering a window from one side: the leftmost pane
-- when coming from the left, the rightmost when coming from the right (topmost
-- breaks ties).
local function edge_block(window, side)
  local best, best_r
  for id, r in pairs(tiled_rects(window)) do
    local better
    if not best_r then
      better = true
    elseif side == "left" then
      better = r[1] < best_r[1] or (r[1] == best_r[1] and r[2] < best_r[2])
    else
      local edge, best_edge = r[1] + r[3], best_r[1] + best_r[3]
      better = edge > best_edge or (edge == best_edge and r[2] < best_r[2])
    end
    if better then
      best, best_r = id, r
    end
  end
  return best
end

local function has_neighbor(view, direction)
  local index = active_window_index(view)
  local window = index and view.windows[index]
  if not window or not window.focused_block_id then
    return false
  end

  local rects = tiled_rects(window)
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
    if not view then
      return
    end
    if has_neighbor(view, args.direction) then
      rex.client.queue("pane.focus", { direction = args.direction })
      return
    end
    if args.direction ~= "left" and args.direction ~= "right" then
      return
    end

    -- Pre-select the pane the target tab should open on, then let the app
    -- switch tabs (it wraps around at the ends).
    local windows = view.windows or {}
    local index = active_window_index(view)
    if index and #windows > 1 then
      local step = args.direction == "right" and 1 or -1
      local target = windows[(index - 1 + step) % #windows + 1]
      local entry_side = args.direction == "right" and "left" or "right"
      local block = edge_block(target, entry_side)
      if block then
        rex.session.focus_block({ block_id = block })
      end
    end
    rex.client.queue(args.direction == "right" and "client.tab.next" or "client.tab.previous")
  end,
})

rex.bind("alt+h", "focus_pane_or_tab", { direction = "left" })
rex.bind("alt+l", "focus_pane_or_tab", { direction = "right" })
rex.bind("alt+j", "pane.focus", { direction = "down" })
rex.bind("alt+k", "pane.focus", { direction = "up" })
