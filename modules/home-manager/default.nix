{pkgs, ... }:
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
              