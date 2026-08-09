{ pkgs, ... }: {
  home = with pkgs; {
    packages = [ 
      # Sometimes it's preferred to have packages here when we want
      # NixOS to do no extra configuration work.
      tmux
      neovim
      waybar
      hyprpaper

      ripgrep
      tree
      unzip

      gnumake

      python3
      python3Packages.python-lsp-server

      vscode-langservers-extracted

      pkgsCross.i686-embedded.buildPackages.binutils
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
    # Configurable programs which need only a few simple configurations
    # will live here in the nixos file.
    # More complex configurations will live in program specific 
    # config files (examples: vim and tmux).

    bash = { 
      enable = true; 
      shellAliases = {
	sudo = "sudo ";
        vi = "nvim";
        vim = "nvim";
      };

      # Here we allow the creation of an extras bash script!
      bashrcExtra = 
      ''
      # bashrcExtra from NixOS Config #
      if [ -z "$EXTRAS_SCRIPT" ]; then EXTRAS_SCRIPT=~/git/neovimrc/bash/extras.sh; fi
      if [ -f "$EXTRAS_SCRIPT" ]; then source "$EXTRAS_SCRIPT"; fi
      #################################
      '';
    };

    kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      extraConfig = "background_opacity 0.9";
    };

    chromium = { enable = true; };

    git = {
      enable = true;
      settings = {
        push = { autoSetupRemote = true; };

        credential.helper = "${pkgs.git.override { 
          withLibsecret = true; 
        }}/bin/git-credential-libsecret";

        user = {
          name = "Chatham Abate";
          email = "chathamabate@gmail.com";
        };
      };
    };
  }; 

  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
  };
}
