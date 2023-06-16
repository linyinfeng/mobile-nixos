{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.3.4";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-${version}";
    hash = "sha256-mNAxKtBsMPePddlHt4vm+0YNo22WSwIlgHGlY96ceIY=";
  };

  isModular = false;
  isCompressed = "gz";
}
