
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = /* lua */ ''
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<CR>', {noremap = true})
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
