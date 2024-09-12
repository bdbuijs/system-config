{ ... }: {
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    global.brewfile = true;
    brews = [
      "gh"
      "python@3.10"
      "python@3.11"
      "python@3.12"
    ];
    casks = [
      "1password"
      "1password-cli"
      "adobe-acrobat-pro"
      "adobe-creative-cloud"
      "amethyst"
      "audacity"
      # "backblaze" (manually installed)
      "blockblock"
      "bluejeans"
      "brave-browser"
      "cemu"
      "chromium"
      "discord"
      "dropbox"
      "firefox"
      "google-chrome"
      "hiddenbar"
      "inkscape"
      "kextviewr"
      "knockknock"
      "krisp"
      "libreoffice"
      "libreoffice-language-pack"
      "lulu"
      "mailbutler"
      "megasync"
      "microsoft-office"
      "microsoft-teams"
      "musescore"
      "neovide"
      "netiquette"
      "nordvpn"
      "oversight"
      "paragon-ntfs"
      "postman"
      "pycharm-ce"
      "qlab"
      "ransomwhere"
      "reflector"
      "reikey"
      "secretive"
      "skype"
      "slack"
      "spotify"
      "steam"
      "sublime-text"
      "taskexplorer"
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
      "yubico-authenticator"
      "yubico-yubikey-manager"
      "zoom"
    ];
    masApps = {
      Notability = 360593530;
      "Remote Mouse" = 403195710;
      "Hand Mirror" = 1502839586;
    };
  };
}
