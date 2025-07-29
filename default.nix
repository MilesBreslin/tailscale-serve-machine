{ buildGoModule
, src ? ./.
, vendorHash ? "sha256-ti122PvZi5vzFIfTIFXSqKP270Oz5qXCr/IvdwHR91g="
}:

buildGoModule {
  pname = "ts-serve-machine";
  version = "git";

  inherit src vendorHash;
}
