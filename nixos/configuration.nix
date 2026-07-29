# Edit this configuration file to define what should be installed on your system. Help is 
# available in the configuration.nix(5) man page, on https://search.nixos.org/options and 
# in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{ 
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix 
    
    # Fetch home manager.
    (let 
      home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
    in 
      import "${home-manager}/nixos"
    )
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Configure network connections interactively with nmcli or nmtui.
  networking = {
    networkmanager.enable = true;
    hostName = "bigc";
  };

  environment = with pkgs; { 
    systemPackages = [ 
      wget 
    ]; 
  };

  services = {
    openssh = {
      enable = true; 
      openFirewall = true; 

      # As long as a user has sudo access, ssh'ing directly as root shouldn't be necessary.
      # settings = { 
      #  PermitRootLogin = "yes";
      # };
    };
    
    # This allows for ssh'ing with <hostname>.local 
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
      }; 
    };

    # May take this out tbh.
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # I believe this is require for some system wide dameon?
    gnome.gnome-keyring = {
      enable = true;
    };
  };

  # This should unlock user keyring on login.
  # NOTE: must always match DM!
  security.pam.services.sddm.enableGnomeKeyring = true;

  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
    };
    
    # Attempting to defer most hyperland config to user.
    # I think this will set up the defualt hyprland config for the
    # user.
    # Outlining all of the hyprland config in nixos language is
    # a pain tbh.
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true; 
    };
  };

  users = {
    defaultUserShell = pkgs.bashInteractive;

    users = {
      chathamabate = {
        description = "Chatham Abate";
        extraGroups = [ "wheel" ]; # sudo access bby.
        isNormalUser = true;
      };
    };
  };

  home-manager.users = {
    chathamabate = import ./chathamabate.nix;
  };

  # Copy the NixOS configuration file and link it from the resulting system 
  # (/run/current-system/configuration.nix). This is useful in case you accidentally delete 
  # configuration.nix. system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular 
  # machine, and is used to maintain compatibility with application data (e.g. databases) 
  # created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason, 
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from, so 
  # changing it will NOT upgrade your system - see 
  # https://nixos.org/manual/nixos/stable/#sec-upgrading for how to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is out 
  # of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would 
  # make to your configuration, and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or 
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

