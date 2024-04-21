{ pkgs, self, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "alacritty";
      };

      window = {
        padding = {
          x = 20;
          y = 20;
        };
        opacity = 0.8;
      };

      live_config_reload = true;
      scrolling.history = 100000;

      font = {
        size = 14;
      };
    };
  };
}