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
    home-manager.enable = true;
    alacritty = {
      enable = true;
      settings.font.normal.family = "JetBrainsMono Nerd Font";
      settings.window.opacity = 0.85;
      settings.window.padding.x = 5;
    };
    exa.enable = true;
    git = {
      enable = true;
      userName = "Bram Buijs";
      userEmail = "bdbuijs@gmail.com";
    };
    neovim = {
      enable = true;
      extraConfig = ''
        set number relativenumber
      '';
      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
      ];
    };
    ssh = {
      enable = true;
      extraConfig = ''
              Host *
        	    IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
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
        nixup = "pushd ~/src/system-config; nix flake update; nixswitch; popd; nix-collect-garbage; ";
        sysconfig = "codium ~/src/system-config";
        workwork = "open -g -a Slack;open -g -a \"Microsoft Teams\";open -g -a zoom.us";
        eod = "osascript -e 'quit app \"Slack\"';osascript -e 'quit app \"Microsoft Teams\"'";
      };
    };
  };
}
              