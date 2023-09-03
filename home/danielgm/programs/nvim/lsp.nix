{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # LSP
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = /* lua */ ''
        local lspconfig = require('lspconfig')

        function add_lsp(binary, server, options)
          options["cmd"] = { binary }
          if vim.fn.executable(binary) == 1 then server.setup(options) end
        end

        add_lsp("docker-langserver", lspconfig.dockerls, {})
        add_lsp("bash-language-server", lspconfig.bashls, {})
        add_lsp("clangd", lspconfig.clangd, {})
        add_lsp("nil", lspconfig.nil_ls, {})
        add_lsp("pylsp", lspconfig.pylsp, {})
        add_lsp("dart", lspconfig.dartls, {})
        add_lsp("haskell-language-server", lspconfig.hls, {})
        add_lsp("kotlin-language-server", lspconfig.kotlin_language_server, {})
        add_lsp("solargraph", lspconfig.solargraph, {})
        add_lsp("phpactor", lspconfig.phpactor, {})
        add_lsp("terraform-ls", lspconfig.terraformls, {})
        add_lsp("texlab", lspconfig.texlab, {})
        add_lsp("gopls", lspconfig.gopls, {})
        add_lsp("tsserver", lspconfig.tsserver, {})
        add_lsp("lua-lsp", lspconfig.lua_ls, {})
        add_lsp("jdt-language-server", lspconfig.jdtls, {})
        add_lsp("texlab", lspconfig.texlab, {
          chktex = {
            onEdit = true,
            onOpenAndSave = true
          }
        })
        add_lsp("ltex-ls", lspconfig.ltex, {})

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
        vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { desc = "Format code" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set("n", "<space>c", vim.lsp.buf.code_action, { desc = "Code action" })
        -- Diagnostic
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { desc = "Diagnostics on loclist" })
        vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "Diagnostics on quickfix" })

        function add_sign(name, text)
          vim.fn.sign_define(name, { text = text, texthl = name, numhl = name})
        end

        add_sign("DiagnosticSignError", "󰅚 ")
        add_sign("DiagnosticSignWarn", " ")
        add_sign("DiagnosticSignHint", "󰌶 ")
        add_sign("DiagnosticSignInfo", " ")
      '';
    }
    {
      plugin = rust-tools-nvim;
      type = "lua";
      config = /* lua */ ''
        local rust_tools = require('rust-tools')
        if vim.fn.executable("rust-analyzer") == 1 then
          rust_tools.setup{ tools = { autoSetHints = true } }
        end
        vim.api.nvim_set_hl(0, '@lsp.type.comment.rust', {})
      '';
    }

    # Completions
    cmp-nvim-lsp
    cmp-buffer
    lspkind-nvim
    {
      plugin = nvim-cmp;
      type = "lua";
      config = /* lua */ ''
        local cmp = require('cmp')

        cmp.setup{
          formatting = { format = require('lspkind').cmp_format() },
          -- Same keybinds as vim's vanilla completion
          mapping = {
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          },
          sources = {
            { name='buffer', option = { get_bufnrs = vim.api.nvim_list_bufs } },
            { name='nvim_lsp' },
          },
        }


      '';
    }
  ];
}
