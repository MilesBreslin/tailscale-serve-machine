{
  description = "Tailscale Serve Machine flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs lib.systems.doubles.all;
    eachSystemPkgs = func: eachSystem (system: func nixpkgs.legacyPackages.${system});
  in rec {
    applications = eachSystem (system: rec {
      inherit (packages.${system}) ts-serve-machine;
      default = ts-serve-machine;
    });
    packages = eachSystemPkgs (pkgs: rec {
      inherit (pkgs) go;
      ts-serve-machine = pkgs.callPackage ./. { src = self; };
    });
  };
}
