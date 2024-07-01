{ pkgs, ... }: {
  imports = [
    ./brew.nix
    ./system.nix
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  environment = {
    shells = [ pkgs.zsh ];
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPath = [ "/opt/homebrew/bin" "~/src/tools" ];
    systemPackages = with pkgs; [
      coreutils
      nixpkgs-fmt
    ];
  };
  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;
  users.users.bram.home = "/Users/bram";
}
