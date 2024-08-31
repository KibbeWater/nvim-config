local function get_config_path()
    local config_path = vim.fn.stdpath "config"
    if not config_path then
        error "Failed to get config path"
    end
    return config_path
end

local function run_git_command(path, command, callback)
    if not path or not command then
        error "Invalid arguments for run_git_command"
    end
    local full_command = string.format("cd %s && %s", path, command)
    vim.fn.jobstart(full_command, {
        on_stdout = function(_, data)
            if data and data[1] and data[1] ~= "" then
                callback(vim.trim(data[1]))
            end
        end,
        on_stderr = function(_, data)
            if data and data[1] and data[1] ~= "" then
                vim.api.nvim_err_writeln("Error: " .. vim.trim(table.concat(data, "\n")))
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
        if not cur_hash_result then
            vim.api.nvim_err_writeln "Failed to get current hash"
            return
        end
        current_hash = cur_hash_result
        run_git_command(config_path, "git ls-remote origin HEAD | cut -f1", function(remote_hash_result)
            if not remote_hash_result then
                vim.api.nvim_err_writeln "Failed to get remote hash"
                return
            end
            remote_hash = remote_hash_result
            if current_hash ~= remote_hash then
                print "The config is out of date, run :UpdateConfig to update"
            end
        end)
    end)
end

local function update_config(path)
    if not path then
        error "Invalid path for update_config"
    end
    run_git_command(path, "git pull", function(result)
        if not result then
            vim.api.nvim_err_writeln "Update failed: No result from git pull"
        elseif string.find(result, "Abort") then
            vim.api.nvim_err_writeln "Update was unsuccessful, please discard or stash changes before pulling"
        else
            print "Update was successful, please restart neovim"
        end
    end)
end

vim.api.nvim_create_user_command("UpdateConfig", function()
    local config_path = get_config_path()
    if not config_path then
        vim.api.nvim_err_writeln "Failed to get config path"
        return
    end
    update_config(config_path)
end, {})

check_git_status()
