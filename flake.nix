{
  description = "Flake for ReLU kernel";

  inputs = {
    kernel-builder.url = "github:huggingface/kernel-builder";
  };

  outputs =
    {
      self,
      kernel-builder,
    }:
    kernel-builder.lib.genFlakeOutputs {
      inherit self;
      path = ./.;
      # Limit to single torch version to reduce build size
      torchVersions = _: [
        {
          torchVersion = "2.9";
          cudaVersion = "12.6";
          cxx11Abi = true;
          systems = [ "x86_64-linux" ];
          bundleBuild = true;
        }
      ];
    };
}
