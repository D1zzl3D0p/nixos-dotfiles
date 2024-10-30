{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "dizzler";
  home.homeDirectory = "/home/dizzler";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder

    nmap # A utility for network discovery and security auditing

    # misc
    cowsay
    file
    which
    tree

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    vesktop
    ffmpeg
    easyeffects
    helvum
    mullvad-vpn
    transmission
    brave
    r2modman
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "D1zzl3D0p";
    userEmail = "spn1kolat3sla@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "https";
      prompt = "enabled";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
    };
    # set some aliases, feel free to add more or remove some
    shellAliases = {
      nixos-dir = "cd $HOME/.nixos";
      update = "nixos-dir && sudo nix flake update && sudo nixos-rebuild switch --flake .";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
