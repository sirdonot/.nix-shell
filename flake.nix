{
  description = "NixOS flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser = { url = "github:youwen5/zen-browser-flake"; inputs.nixpkgs.follows = "nixpkgs"; };
    qtengine = { url = "github:kossLAN/qtengine"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = { NixOS = lib.nixosSystem { system = "x86_64-linux"; specialArgs = { inherit inputs; }; modules = [ ./configuration.nix ]; }; };
  };
}
