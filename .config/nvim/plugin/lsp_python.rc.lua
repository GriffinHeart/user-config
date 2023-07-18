local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function()
end

local util = require('lspconfig/util')
local path = util.path

local function get_pipenv_dir()
    return vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=Pipfile pipenv --venv'))
end

local function get_poetry_dir()
    return vim.fn.trim(vim.fn.system('poetry env info -p'))
end

local function get_python_dir(workspace)
    local pipenv_match = vim.fn.glob(path.join(workspace, 'Pipfile'))
    if pipenv_match ~= '' then
        return get_pipenv_dir()
    end

    local poetry_match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
    if poetry_match ~= '' then
        local poetry_dir = get_poetry_dir()
        return poetry_dir
    end
end

local function setup_virtual_env(workspace)
    local old_venv = vim.env.VIRTUAL_ENV
    vim.env.VIRTUAL_ENV = nil
    local venv = get_python_dir(workspace)

    if (not venv and old_venv) or (venv == old_venv) then
        vim.env.VIRTUAL_ENV = old_venv
        return
    end

    vim.env.VIRTUAL_ENV = venv

    if old_venv then
        vim.env.PATH = vim.env.PATH:gsub("^(.-)/bin", path.join(venv, "/bin"))
    else
        vim.env.PATH = path.join(venv, "/bin:", vim.env.PATH)
    end
end

-- pipx install python-lsp-server[all]
-- user pipx inject python-lsp-server <plugins> to install additional plugins
-- TODO: Revisit these configs after setup
-- local lsputil = require('lspconfig/util')
-- local venv = get_poetry_dir()

nvim_lsp.pyright.setup({
  on_init = function(client)
    -- setup_virtual_env(client.config.root_dir)
    -- local pythonPath = path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    -- client.config.settings.python.pythonPath = pythonPath
  end,
})

--
--
-- nvim_lsp.pylsp.setup {
--   cmd = { "pylsp", "-v" },
--   cmd_env = { VIRTUAL_ENV = venv, PATH = lsputil.path.join(venv, 'bin') .. ':' .. vim.env.PATH },
--   on_attach = on_attach,
--   on_new_config = function(new_config, new_root_dir)
--     setup_virtual_env(new_root_dir)
--   end,
--   settings = {
--     pylsp = {
--       plugins = {
--         -- TODO: check the other tools configs
--         flake8 = {
--           enabled = true,
--         },
--         pylint = {
--           enabled = false,
--         },
--         black = { enabled = true, },
--         pycodestyle = {
--           enabled = false,
--           ignore = { 'W391' },
--           maxLineLength = 100
--         },
--         mypy = { enabled = true },
--       }
--     }
--   }
-- }


