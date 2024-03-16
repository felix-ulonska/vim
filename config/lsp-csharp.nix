{helpers, pkgs, ...}: {
    extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
    name = "csharp.nvim";
    src = pkgs.fetchFromGitHub {
	owner = "iabdelkareem";
repo = "csharp.nvim";
	rev = "48d72dfad26177295744d6da958f1dc08046a9d9";
	hash = "sha256-YjtFg83bREcSNASarMbebqFRihbdOZF4uE0OMSEtcYg=";
	    };
	}) 
    (pkgs.vimUtils.buildVimPlugin {
    name = "structlog.nvim";
    src = pkgs.fetchFromGitHub {
	owner = "Tastyep";
repo = "structlog.nvim";
	rev = "main";
	hash = "sha256-Bq4YNpLQ1+iSBuN5MG4OBmI5r3DGWyDou4kRCMnked0=";
	    };
	}) 

	];
plugins.dap.enable = true;
      extraConfigLua = ''
      require("mason").setup() -- Mason setup must run before csharp
      require("csharp").setup()
'';

}
