
{ pkgs, ... }: {
  home = with pkgs; {
    packages = [
      tmux
      neovim
      waybar
      hyprpaper
      ripgrep
      tree
      git
    ];
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = catppuccin-cursors.mochaDark;
      name = "Catppuccin Cursors";
    };

    # DO NOT CHANGE
    stateVersion = "26.05"; 
  };

  programs = {
    chromium = { enable = true; };
    kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      extraConfig = "background_opacity 0.9";
    };
    bash = { 
      enable = true; 
      shellAliases = {
	sudo = "sudo ";
        vi = "nvim";
        vim = "nvim";
      }; 
    };
  };
}
