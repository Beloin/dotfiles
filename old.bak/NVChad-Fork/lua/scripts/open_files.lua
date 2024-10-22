local M = {}

M.get_focused_file_path = function ()
    local lib = require'nvim-tree.lib'
    local current_node = lib.get_node_at_cursor()
    if current_node and current_node.absolute_path then
        return current_node.absolute_path
    else
        return nil
    end
end


M.call_gweenview = function ()
    print("HIIIII")
    local fl = M.get_focused_file_path()
    print("HIIIII")
    os.execute("gwenview " .. fl)
end

return M
