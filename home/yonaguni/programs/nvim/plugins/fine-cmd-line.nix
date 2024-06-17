{ inputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          fine-cmd-line-nvim = prev.vimUtils.buildVimPlugin {
            name = "fine-cmdline.nvim";
            src = inputs.plugin-fine-cmd-line-nvim;
          };
        };
      })
    ];
  };
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nui-nvim;
      type = "lua";
    }
    {
      plugin = fine-cmd-line-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
        require('fine-cmdline').setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = '> '
        },
        popup = {
          position = {
            row = '50%',
            col = '50%',
          },
          size = {
            width = '30%',
          },
          border = {
            style = 'rounded',
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        hooks = {
          before_mount = function(input)
            -- code
          end,
          after_mount = function(input)
            -- code
          end,
          set_keymaps = function(imap, feedkeys)
            -- code
          end
        }
      })
    '';
    }
  ];
}
