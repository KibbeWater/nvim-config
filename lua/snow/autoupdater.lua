local function get_config_path()
    return vim.fn.stdpath "config"
end

local function run_git_command(path, command, callback)
    local full_command = string.format("cd %s && %s", path, command)
    vim.fn.jobstart(full_command, {
        on_stdout = function(_, data)
            if data[1] ~= "" then
                callback(vim.trim(data[1]))
            end
        end,
        on_stderr = function(_, data)
            if data[1] ~= "" then
                print("Error: " .. vim.trim(table.concat(data, "\n")))
            end
        end,
        stdout_buffered = true,
        stderr_buffered = true,
    })
end

local function check_git_status()
    local config_path = get_config_path()
    local current_hash, remote_hash

    run_git_command(config_path, "git rev-parse HEAD", function(cur_hash_result)
        current_hash = cur_hash_result
        run_git_command(config_path, "git ls-remote origin HEAD | cut -f1", function(remote_hash_result)
            remote_hash = remote_hash_result
            if current_hash ~= remote_hash then
                print "The config is out of date, run :UpdateConfig to update"
            end
        end)
    end)
end

local function update_config(path)
    run_git_command(path, "git pull", function(result)
        if string.find(result, "Abort") then
            print "Update was unsuccessful, please discard or stash changes before pulling"
            return
        else
            print "Update was successful, please restart neovim"
        end
    end)
end

vim.api.nvim_create_user_command("UpdateConfig", function()
    local config_path = get_config_path()
    update_config(config_path)
end, {})

check_git_status()
