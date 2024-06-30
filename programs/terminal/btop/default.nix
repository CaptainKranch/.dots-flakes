{ catppuccin-btop, ... }:
{
  # https://github.com/catppuccin/btop/blob/main/themes/catppuccin_mocha.theme

  # replacement of htop/nmon
  programs.btop = {
    enable = true;
    settings = {
        theme_background = false;   # make btop transparent 
    };
  };
}
