
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-dadbod
    {
      plugin = vim-dadbod-ui;
      type = "lua";
    }
  ];
}
