{ pkgs, dockerTools }:
{
  bash = dockerTools.buildImage {
    name = "bash";
    tag = "latest";

    copyToRoot = pkgs.buildEnv {
      name = "image-root";
      paths = [ pkgs.git ];
      pathsToLink = [ "/bin" ];
    };
  };
}
