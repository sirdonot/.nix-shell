{ ... }:

{
  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;

    settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
    };
  };

  # others
  services.udisks2.enable = true;
  services.printing.enable = true;
  services.openssh.enable = true;
  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };
}
