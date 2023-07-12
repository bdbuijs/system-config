{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    curl
    cargo
    fd
    nerdfonts
    python311
    ripgrep
    rustc
    rustfmt
  ];
  programs = {
    alacritty = {
      enable = true;
      settings.font.normal.family = "JetBrainsMono Nerd Font";
    };
    exa.enable = true;
    git = {
      enable = true;
      userName = "Bram Buijs";
      userEmail = "bdbuijs@gmail.com";
    };
    starship.enable = true;
    starship.enableZshIntegration = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "ls --color=auto -F";
        nixswitch = "darwin-rebuild switch --flake ~/src/system-config/.#";
        nixup = "pushd ~/src/system-config; nix flake update; nixswitch; popd;";
      };
    };
  };
}
              