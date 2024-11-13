{ ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "D1zzl3D0p";
      userEmail = "spn1kolat3sla@gmail.com";
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "https";
	prompt = "enabled";
      };
    };
  };

}
