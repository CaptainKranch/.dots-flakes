{ config, pkgs, ... }:
{
  imports = [
    ./ui.nix
    ./lsp.nix
    ./syntaxes.nix
    ./telescope.nix
    ./lua-line.nix
    ./tree-lua.nix
    ./fine-cmd-line.nix
    ./dadbod.nix
#    ./dadbod-ui.nix
#    ./theme-tokyonight.nix
#    ./theme-oxocarbon.nix
    ./theme-kanagawa.nix
    ./gen.nix
    ./nvim-notify.nix
    ./neorg.nix
  ];
  home.sessionVariables.EDITOR = "nvim";
    programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
    withNodeJs = true;
    defaultEditor = true;

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

    '';
    extraLuaConfig = /* lua */ ''
      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

      vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

      --Jump between windows in current buffer
      vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


      -- greatest remap ever
      vim.keymap.set("x", "<leader>p", [["_dP]])

      -- next greatest remap ever : asbjornHaland
      vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
      vim.keymap.set("n", "<leader>Y", [["+Y]])

      vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
    '';

    plugins = with pkgs.vimPlugins; [
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

