
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = /* lua */ ''
        require("nvim-tree").setup({
          sort_by = "case_sensitive",
          view = {
            width = 27,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })
      '';
    }
  ];
}
