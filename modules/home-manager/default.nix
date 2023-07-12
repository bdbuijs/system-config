{pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.stateVersion = "23.05";
  home.packages = [
    pkgs.nerdfonts
    pkgs.ripgrep
    pkgs.fd
    pkgs.curl
  ];
  programs = {
    alacritty = {
      enable = true;
      settings.font.normal.family = "JetBrainsMono Nerd Font";
    };
    exa.enable = true;
    git.enable = true;
    starship.enable = true;
    starship.enableZshIntegration = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "ls --color=auto -F";
      };
    };
  };
}
              