{helpers, pkgs, ...}: {
    extraPlugins = [ (pkgs.vimUtils.buildVimPlugin {
    name = "mason.nvim";
    src = pkgs.fetchFromGitHub {
	owner = "williamboman";
repo = "mason.nvim";
	rev = "main";
	hash = "sha256-gsxfSciuYNZsPv1ve1gNSjn6WwY4EZNfIIWkaDNd2ks=";
	    };
	})];
}
