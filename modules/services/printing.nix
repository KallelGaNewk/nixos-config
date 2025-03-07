# Configuration of CUPS and Avahi
{
  services.printing = {
    enable = true;
    tempDir = "/tmp/cups";
    startWhenNeeded = true;
  };

  # Enable autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
