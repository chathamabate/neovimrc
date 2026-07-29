{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    # Sometimes it's preferred to have packages here when we want
    # NixOS to do no extra configuration work.
    tmux
    neovim
    ripgrep
    tree

    python3
    python3Packages.python-lsp-server
  ];

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
      themeFile = "GruvboxMaterialDarkMedium";
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

    # Consider not having this here tbh.
    waybar = {
      enable = true;
      settings = [ 
        {
          layer = "top";
	  position = "top";
	  mod = "dock";
	  height = 30;
	  modules-center = [ "clock" ];
	}
      ];
    };
  }; 

  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };

    # Wallpaper type shi. Also consider putting this into lua.
    hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [ "~/statics/wps/*" ];
        wallpaper = [
	  {
	    monitor = "";
	    path = "~/statics/wps/wp.jpg";
	  }
        ];
      };
    };
  };

  # DO NOT CHANGE
  home.stateVersion = "26.05"; 
}
