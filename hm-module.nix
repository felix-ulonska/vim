{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.jabbi.nixvim;
in
{
  options.jabbi.nixvim = {
    enable = mkEnableOption "Enable Nixvim";
    base64schema = {
      type = types.str;
      description = "Base64 encoded schema";
    };
  };

  config = mkIf cfg.enable {
        home.packages = [ (nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
          };
        })
	];
  };

}
