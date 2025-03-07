# sshd and sftp configuration
{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    allowSFTP = true;
    banner = ''
        ,-.       _,---._ __  / \
       /  )    .-'       `./ /   \
      (  (   ,'            `/    /|
       \  `-"             \'\   / |
        `.              ,  \ \ /  |
         /`.          ,'-`----Y   |
        (            ;        |   '
        |  ,-.    ,-'         |  /
        |  | (   |    SSH     | /
        )  |  \  `.___________|/
        `--'   `--'
    '';
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
