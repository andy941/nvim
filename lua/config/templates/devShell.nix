{
  description = ''
    Basic Nix Flake for a Development Shell

    # Run inheriting your environment for development
    nix develop -c $SHELL

    # Run without your environment for production
    # (to check that all the necessary packages are specified in the flake)
    nix develop --ignore-environment

    # Build a docker image
    nix build .#<system>.prod

  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        # Import nixpkgs for the current system
        pkgs = import nixpkgs { inherit system; };
        pyPkgs = (ps: with ps; [ black pandas pysam ]);
        rPkgs = (with pkgs.rPackages; [
          languageserver
          styler
          ggplot2
          tidyverse
          reticulate
        ]);

        prodPackages = with pkgs; [
          # Add dependencies
          zsh
          (pkgs.rWrapper.override { packages = rPkgs; })
          (pkgs.python3.withPackages (pyPkgs))
          (quarto.override {
            extraPythonPackages = pyPkgs;
            extraRPackages = rPkgs;
          })
        ];
      in {
        devShells.default = pkgs.mkShell {

          packages = prodPackages;

          # 🏗️ System-wide Environment Variables
          shellHook = ''
            # Runs when the shell starts
            echo "${pkgs.python3}"
            export RETICULATE_PYTHON=$(which python)
            echo "Welcome to Quarto for data science!"
            tree
          '';

          # 🔄 Allow unfree packages (if needed)
          allowUnfree = false;
        };

        # Docker image for production shell (no system dependencies)
        dockerImages.prod = pkgs.dockerTools.buildImage {
          name = "prod";
          tag = "latest";

          # Start from a base image, e.g., Alpine
          # fromImage = "alpine:latest";

          # Copy the production environment into the image
          copyToRoot = pkgs.buildEnv {
            name = "prod-env";
            paths = prodPackages;
          };

          # Optionally, configure the Docker container (e.g., default command)
          config = {
            Cmd = [ "zsh" ];
            Env = [ "SHELL=/bin/bash" ];
          };
        };
      });
}
