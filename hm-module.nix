{nvimWithSchema, config, nixvim'}: 
	{ pkgs, lib, config, ... }:
	with lib;
	let
	  cfg = config.jabbi.nixvim;
	in
	{
	  options.jabbi.nixvim = {
	    enable = mkEnableOption "Enable Nixvim";
	    base64scheme = mkOption {
	      type = types.attrs;
	      description = "Base64 encoded schema";
	    };
	  };

	  config = mkIf cfg.enable {
home.packages = [(nvimWithSchema {schema = cfg.base64scheme;}) ];
		#home.packages = [ (nixvim'.makeNixvimWithModule {
		#  inherit pkgs;
		#  module = config;
		#  # You can use `extraSpecialArgs` to pass additional arguments to your module files
		#  extraSpecialArgs = {
		#    # inherit (inputs) foo;
		#  };
		#})
		#];
	  };
	}
