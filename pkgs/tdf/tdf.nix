{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "tdf";
  version = "4296c92d7d91b210149ecfb8dd72e487fb747eff";

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ratatui-0.28.0" = lib.fakeSha256;
    };
  };
  src = fetchFromGitHub {
    owner = "itsjunetime";
    repo = pname;
    rev = version;
    hash = "sha256-mExvglPK31uNm6eqXPUBrTRk6VbGW0k0sE7ncDESX1k=";
  };

  cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";

  meta = {
    description = "A terminal-based PDF viewer. Designed to be performant, very responsive, and work well with even very large PDFs. Built with";
    homepage = "https://github.com/itsjunetime/tdf";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
