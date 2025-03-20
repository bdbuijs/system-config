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
    pathsToLink = [ "/Applications" ];
    systemPath = [ "/opt/homebrew/bin" "~/src/tools" ];
    systemPackages = with pkgs; [
      coreutils
      nixpkgs-fmt
    ];
  };
  security.pam.services.sudo_local.touchIdAuth = true;
  users.users.bram.home = "/Users/bram";
}
