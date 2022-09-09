local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

local masonLsp_ok, masonLsp = pcall(require, 'mason-lspconfig')
if not masonLsp_ok then
  return
end

local servers = require('user.lsp').servers

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

local on_attach = function(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()


masonLsp.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

for _, server in ipairs(servers) do
  local ok, config = pcall(require, 'user.lsp.' .. server)
  if not ok then
    require('user.lsp.default_server').setup(on_attach, capabilities, server)
  else
    config.setup(on_attach, capabilities)
  end
end