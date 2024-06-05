{
  iio-sensor-proxy,
  fetchFromGitLab,
  lib,
  sscSupport ? true,
  libssc,
  libqmi,
  protobufc,
}:

iio-sensor-proxy.overrideAttrs (old: rec {
  versoin = "unstable-2024-06-05-ssc";
  name = "${old.pname}-${versoin}";
  # https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/tree/ssc
  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "hadess";
    repo = old.pname;
    rev = "74fa32e134cc139c565dc515c8ea9a8fd11b7e6b";
    hash = "sha256-uwYntDu7DN84Lqu7U3yXEn65fteeo5bzCQAsNfkMeM4=";
  };
  mesonFlags = old.mesonFlags ++ [ (lib.mesonEnable "ssc-support" sscSupport) ];
  # nativeBuildInputs = old.nativeBuildInputs ++ lib.optional sscSupport protobufc;
  buildInputs =
    old.buildInputs
    ++ lib.optionals sscSupport [
      libssc
      libqmi
      protobufc
    ];
  patches = [ ]; # disable all patches
})
