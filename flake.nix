{
  description = "A nixvim configuration for multiple architectures";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim
    , flake-parts
    , nixpkgs
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly

      # Define the supported systems
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # Function to generate nixvim configuration for each system
      forSystem = system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
            schema = {
              base00 = "#16161D";
              base01 = "#2c313c";
              base02 = "#3e4451";
              base03 = "#6c7891";
              base04 = "#565c64";
              base05 = "#abb2bf";
              base06 = "#9a9bb3";
              base07 = "#c5c8e6";
              base08 = "#e06c75";
              base09 = "#d19a66";
              base0A = "#e5c07b";
              base0B = "#98c379";
              base0C = "#56b6c2";
              base0D = "#0184bc";
              base0E = "#c678dd";
              base0F = "#a06949";
            };
          };
        };
        nvimWithSchema = { schema }: nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
            schema = schema;
          };
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration for ${system}";
          };
        };

        packages.${system} = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        homeManagerModules.default = import ./hm-module.nix { 
          nvimWithSchema = nvimWithSchema; 
          config = config; 
          nixvim' = nixvim'; 
        };
      };
    in
    {
      # Loop over all supported systems
      for system in systems: forSystem system;
    };
}

