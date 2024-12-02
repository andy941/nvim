{ pkgs, lib, config, ... }:

{
  options = { module.enable = lib.mkEnableOption "enables module"; };

  config = lib.mkIf config.module.enable {
    # module config
  };

}
