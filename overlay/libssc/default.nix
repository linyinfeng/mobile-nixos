{
  stdenv,
  fetchgit,
  lib,
  meson,
  ninja,
  pkg-config,
  libqmi,
  glib,
  protobuf,
  protobufc,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libssc";
  version = "v0.2.2";
  src = fetchgit {
    url = "https://codeberg.org/DylanVanAssche/libssc.git";
    rev = finalAttrs.version;
    hash = "sha256-ULENnq2MDbA5s0LPB2/Xlx6OatWYlxXF60s1GPGkhlE=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    protobuf
  ];

  buildInputs = [
    libqmi
    glib
    protobufc
  ];

  meta = with lib; {
    description = "Library for exposing Qualcomm Sensor Core sensors to Linux";
    homepage = "https://libssc.dylanvanassche.be";
    license = licenses.gpl3Plus;
    platforms = platforms.aarch64;
  };
})
