# sshd and sftp configuration

{ config, ... }: {
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    allowSFTP = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
