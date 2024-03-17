{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lazygit-nvim;
      type = "lua";
    }
  ];
}
