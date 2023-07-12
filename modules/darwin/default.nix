{ pkgs, ...}: {
  homebrew = ./homebrew
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh];
  environment.loginShell = pkgs.zsh;
  environment.pathsToLink = [ "/Applications" ];
  environment.systemPath = [ "/opt/homebrew/bin" ];
  environment.systemPackages = [
    pkgs.coreutils
    pkgs.python311
  ];
  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;
  system.keyboard.enableKeyMapping = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;

  # other system config goes here

  users.users.bram.home = "/Users/bram";
}