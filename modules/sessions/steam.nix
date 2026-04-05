{ pkgs, ... }:

{
  programs.gamescope = {
      enable = true;
      capSysNice = true;
  };

  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;  # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting

    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        OBS_VKCAPTURE = true;
      };

      extraPkgs = pkgs': with pkgs'; [
        libXcursor
        libXi
        libXinerama
        libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
