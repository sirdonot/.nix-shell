{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ./modules/sessions/desktop.nix ./modules/sessions/steam.nix ./modules/services.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.systemd.enable = true;
  boot.initrd.kernelModules = [ "lz4" ];

  boot.kernelParams = [ "zswap.enabled=1" "zswap.compressor=lz4" "zswap.max_pool_percent=50" "zswap.shrinker_enabled=1" "amdgpu.ppfeaturemask=0xffff7fff" ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  console = {
    keyMap = "br-abnt2";
  };

  users.users.sirdonot = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # packages = with pkgs; [];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    btop
    fish
    fastfetch
  ];

  hardware.graphics = {
      enable = true;
      enable32Bit = true;
  };

  nixpkgs.config.allowUnfree = true; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
