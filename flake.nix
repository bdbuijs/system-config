{
  description = "Bram's MacOS configuration flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations.Brams-MBP = 
      inputs.darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = import inputs.nixpkgs {
          system = "x86_64-darwin";
        };
      modules = [
        ({ pkgs, ...}: {
          users.users.bram.home = "/Users/bram";
          programs.zsh.enable = true;
          environment.shells = [ pkgs.zsh];
          environment.loginShell = pkgs.zsh;
          environment.systemPath = [ "/opt/homebrew/bin" ];
          environment.pathsToLink = [ "/Applications" ];
          nix.extraOptions = ''
            experimental-features = nix-command flakes
          '';
          environment.systemPackages = [
            pkgs.coreutils
            pkgs.python311
          ];
          system.keyboard.enableKeyMapping = true;
          services.nix-daemon.enable = true;
          system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
          system.defaults.finder.AppleShowAllExtensions = true;
          system.defaults.finder._FXShowPosixPathInTitle = true;
          homebrew = {
            enable = true;
            global.brewfile = true;
            casks = [
              "1password"
              "adobe-acrobat-pro"
              "adobe-creative-cloud"
              "audacity"
              "bluejeans"
              "brave-browser"
              "cemu"
              "chromium"
              "discord"
              "dropbox"
              "firefox"
              "google-chrome"
              "inkscape"
              "libreoffice"
              "libreoffice-language-pack"
              "mailbutler"
              "megasync"
              "microsoft-office"
              "microsoft-teams"
              "musescore"
              "nordvpn"
              "paragon-ntfs"
              "postman"
              "pycharm-ce"
              "qlab"
              "reflector"
              "skype"
              "slack"
              "spotify"
              "steam"
              "sublime-text"
              "teamviewer"
              "the-unarchiver"
              "tor-browser"
              "transmission"
              "virtualbox"
              "vlc"
              "vlcstreamer"
              "voov-meeting"
              "vscodium"
              "whatsapp"
              "zoom"
            ];
            masApps = {
              Notability = 360593530;
              "Remote Mouse" = 403195710;
            };
          };
          
          # other system config goes here

        })
        inputs.home-manager.darwinModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.bram.imports = [
              ({pkgs, ... }:
                {
                  fonts.fontconfig.enable = true;
                  home.stateVersion = "23.05";
                  home.packages = [
                    pkgs.nerdfonts
                    pkgs.ripgrep
                    pkgs.fd
                    pkgs.curl
                  ];
                  programs.alacritty = {
                    enable = true;
                    settings.font.normal.family = "JetBrainsMono Nerd Font";
                  };
                  programs.exa.enable = true;
                  programs.git.enable = true;
                  programs.starship.enable = true;
                  programs.starship.enableZshIntegration = true;
                  programs.zsh.enable = true;
                  programs.zsh.enableCompletion = true;
                  programs.zsh.enableAutosuggestions = true;
                  programs.zsh.syntaxHighlighting.enable = true;
                  programs.zsh.shellAliases = {
                    ls = "ls --color=auto -F";
                  };
                }
              )
            ];
          };
        }
      ];
    };
  };
}
