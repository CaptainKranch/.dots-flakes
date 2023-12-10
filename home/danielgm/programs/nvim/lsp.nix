
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    #LSP Support
    nvim-lspconfig
    mason-nvim
    mason-lspconfig-nvim

    # Autocompletion
    nvim-cmp
    cmp-buffer
    cmp-path
    cmp_luasnip
    cmp-nvim-lsp
    cmp-nvim-lua

    # Snippets
    luasnip
    friendly-snippets

    # lsp-zero
    {
      plugin = lsp-zero-nvim;
      type = "lua";
      config = /* lua */ ''
        local lsp = require("lsp-zero")
        lsp.preset("recommended")

        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
            'pyright', 
            'rust_analyzer',
            'dockerls',
            'docker_compose_language_service',
            'gopls',
            'jsonls',
            'lua_ls',
            'marksman',
            'taplo',
            'sqlls'
          },
          handlers = {
            lsp.default_setup,
            lua_ls = function()
              local lua_opts = lsp.nvim_lua_ls()
              require('lspconfig').lua_ls.setup(lua_opts)
            end,
          }
        })

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
          },
          formatting = lsp.cmp_format(),
          mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
          }),
        })

        lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = '󰅚 ',
            warn = ' ',
            hint = '󰌶 ',
            info = ' '
          }
        })

        lsp.on_attach(function(client, bufnr)
          local opts = {buffer = bufnr, remap = false}

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
      '';
    }
  ];
}
