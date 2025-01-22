{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = /* lua */ ''
        -- vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
        vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFindFile<CR>', {noremap = true})
        vim.keymap.set('n', '<leader>cf', '<cmd>NvimTreeToggle<CR>', {noremap = true})
        vim.opt.termguicolors = true
        require("nvim-tree").setup({
          side = "right",
          sort_by = "case_sensitive",
          view = {
            width = 63,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = false,
          },
        })
      '';
    }
  ];
}
