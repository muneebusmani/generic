local current_file = arg[0]:match("^.+/(.+)$")

-- Get the current working directory
local cwd = io.popen("cd"):read("*l")

-- List all files in the current directory
for file in io.popen("ls " .. cwd .. "/*.lua"):lines() do
    local filename = file:match("^.+/(.+)$")
    if filename ~= current_file then
        -- Import the module
        require(filename:sub(1, -5))
    end
end

