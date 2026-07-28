{ pkgs, ... }: {
  home.packages = with pkgs; [ kitty ];
  
  # Should we get neovim in here actually, to make this editing easier??
  programs = {
    bash = {
      enable = true;
    };

    chromium = {
      enable = true;
    };

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

  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" ];
  };
  

  # DO NOT CHANGE
  home.stateVersion = "26.05"; 
}
