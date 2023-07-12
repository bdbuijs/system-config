{ ... }: {
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
}
