{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = telescope-nvim;
      type = "lua";
      config = /* lua */ ''
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      '';
    }
  };
