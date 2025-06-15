{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    dap-cs = {
      url = "github:felix-ulonska/nvim-dap-cs";
      flake = false;
    };
  };

  outputs =
    { nixvim
    , flake-parts
    , nixpkgs
    , dap-cs
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly
      system = "x86_64-linux"; # Example system, replicate this structure for each supported system
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
          inherit pkgs dap-cs;
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
          inherit pkgs dap-cs;
          schema = schema;
        };
      };
    in
    {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "A nixvim configuration";
        };
      };

      packages.x86_64-linux = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
      homeManagerModules.default = import ./hm-module.nix { nvimWithSchema = nvimWithSchema; config = config; nixvim' = nixvim'; };
    };
}
