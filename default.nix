{ buildGoModule
, src ? ./.
, vendorHash ? "sha256-9hw5oJOTC21JpUSMQP9EzYt2hdE0JUWrEDfhCbElQx0="
}:

buildGoModule {
  pname = "ts-serve-machine";
  version = "git";

  inherit src vendorHash;
}
