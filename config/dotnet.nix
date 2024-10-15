{ helpers, pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "easy-dotnet.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "GustavEikaas";
        repo = "easy-dotnet.nvim";
        rev = "942467f4b2148bd9c924dee8dba2867980f9ea25";
        hash = "sha256-YQe3GpiWLTV/FXBf3VrTIsBomE9/5OnT1tx7yoPWFBk=";
      };
    })
  ];
  extraConfigLua = ''
	  require("easy-dotnet").setup()
  '';
}
