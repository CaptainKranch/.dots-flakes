{ config, pkgs, ... }:
{
  imports = [
    ./ui.nix
    ./lsp.nix
    ./syntaxes.nix
    ./telescope.nix
  ];
  home.sessionVariables.EDITOR = "nvim";
    programs.neovim = {
    enable = true;

    extraConfig = /* vim */ ''
      "Use system clipboard
      set clipboard=unnamedplus

      "Set fold level to highest in file
      "so everything starts out unfolded at just the right level
      augroup initial_fold
        autocmd!
        autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
      augroup END

      "Tabs
      set tabstop=4 "4 char-wide tab
      set expandtab "Use spaces
      set softtabstop=0 "Use same length as 'tabstop'
      set shiftwidth=0 "Use same length as 'tabstop'
      
      "Fix nvim size according to terminal
      "(https://github.com/neovim/neovim/issues/11330)
      augroup fix_size
        autocmd VimEnter * silent exec "!kill -s SIGWINCH" getpid()
      augroup END

      "Line numbers
      set number relativenumber

      "Scroll up and down
      nmap <C-h> <C-e>
      nmap <C-l> <C-y>

      "Buffers
      nmap <C-k> :bnext<CR>
      nmap <C-j> :bprev<CR>
      nmap <C-q> :bdel<CR>

      "Loclist
      nmap <space>l :lwindow<cr>
      nmap [l :lprev<cr>
      nmap ]l :lnext<cr>

      nmap <space>L :lhistory<cr>
      nmap [L :lolder<cr>
      nmap ]L :lnewer<cr>

      "Quickfix
      nmap <space>q :cwindow<cr>
      nmap [q :cprev<cr>
      nmap ]q :cnext<cr>

      nmap <space>Q :chistory<cr>
      nmap [Q :colder<cr>
      nmap ]Q :cnewer<cr>

      "Make
      nmap <space>m :make<cr>

      "Grep (replace with ripgrep)
      nmap <space>g :grep<space>
      if executable('rg')
          set grepprg=rg\ --vimgrep
          set grepformat=%f:%l:%c:%m
      endif

      "Close other splits
      nmap <space>o :only<cr>

      "Sudo save
      cmap w!! w !sudo tee > /dev/null %

      "telescope
      "Find files using Telescope command-line sugar.
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      " Using Lua functions
      nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
      nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
      nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
      nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
    '';
    extraLuaConfig = /* lua */ ''
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

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    '';

    plugins = with pkgs.vimPlugins; [
      vim-table-mode
      editorconfig-nvim
      vim-surround
      lualine-nvim
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = /* lua */ ''
          require('nvim-autopairs').setup{}
        '';
      }
    ];
  };

  xdg.configFile."nvim/init.lua".onChange = ''
    XDG_RUNTIME_DIR=''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
    for server in $XDG_RUNTIME_DIR/nvim.*; do
      nvim --server $server --remote-send ':source $MYVIMRC<CR>' &
    done
  '';

  xdg.desktopEntries = {
    nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      comment = "Edit text files";
      exec = "nvim %F";
      icon = "nvim";
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-python"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      terminal = true;
      type = "Application";
      categories = [ "Utility" "TextEditor" ];
    };
  };
}

