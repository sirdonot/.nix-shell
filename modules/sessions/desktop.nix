{ pkgs, inputs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    kdeconnect.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  imports = [inputs.qtengine.nixosModules.default];

  programs.qtengine.enable = true;

  fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      atkinson-hyperlegible
      liberation_ttf
      wqy_zenhei
  ];

  environment.systemPackages = with pkgs; [
    hypridle
    hyprsunset
    hyprpicker
    hyprshot
    hyprpolkitagent
    noto-fonts
    noto-fonts-cjk-sans
    kitty
    quickshell
    wl-clipboard
    wf-recorder
    cliphist
    playerctl
    unrar
    qalculate-qt
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-admin
    kdePackages.kio-extras
  ];
}
