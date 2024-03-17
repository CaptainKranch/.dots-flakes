{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lazygit-nvim;
      type = "lua";
      config = /* lua */ ''
        " setup mapping to call :LazyGit
        nnoremap <silent> <leader>gg :LazyGit<CR>
      '';
    }
  ];
}
