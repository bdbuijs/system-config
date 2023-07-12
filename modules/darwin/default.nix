{ pkgs, ...}: {
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
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  environment = {
    shells = [ pkgs.zsh];
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPath = [ "/opt/homebrew/bin" ];
    systemPackages = [
      pkgs.coreutils
      pkgs.python311
    ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;
  
  system.keyboard.enableKeyMapping = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;

  # other system config goes here

  users.users.bram.home = "/Users/bram";
}