{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityAgent ~/.1password/agent.sock

      Host github_personal
        HostName github.com
        User git
        IdentityFile ~/.ssh/github_personal.pub
        IdentitiesOnly yes

      Host codeberg_personal
        HostName codeberg.org
        User git
        IdentityFile ~/.ssh/codeberg_personal.pub
    '';
  };
}

