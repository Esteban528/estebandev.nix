{ lib, fetchFromGitHub, rustPlatform, pkg-config, pkgs}:

rustPlatform.buildRustPackage rec {
  pname = "tdf";
  version = "4296c92d7d91b210149ecfb8dd72e487fb747eff";

  src = fetchFromGitHub {
    owner = "itsjunetime";
    repo = "tdf";
    rev = "${version}";
    hash = "sha256-mExvglPK31uNm6eqXPUBrTRk6VbGW0k0sE7ncDESX1k=";
  };

 cargoLock =  {
    lockFile = ./Cargo.lock;
    outputHashes =  {
      "ratatui-0.28.0" = "sha256-3QN/cnjxRt8PuN09RUG+ubk4LdK/PmzE13DDlU1RmXY="; # Usa un hash falso para evitar errores de construcción.
      "ratatui-image-1.0.5" = "sha256-77ulImNHw8+TfM/aha4lLVZ5h/VA9xx0pzegMxWsp7E=";
      "vb64-0.1.2" = "sha256-VvObgaJhHNah3exVQInFa5mhHjzEg0MaFqQdnCE5Pp8=";
    };
  }; 
  nativeBuildInputs = [ pkg-config ];

  buildInputs = with pkgs; [ fontconfig freetype xorg.libxcb glib poppler_gi libsForQt5.poppler libsForQt5.qt5.wrapQtAppsHook ];
  
  #DisableWrapper
  dontWrapQtApps = true;

 # requires unstable rust features
  RUSTC_BOOTSTRAP = 1;

  meta = with lib; {
    description = "A terminal-based PDF viewer. Designed to be performant, very responsive, and work well with even very large PDFs. Built with";
    homepage = "https://github.com/itsjunetime/tdf";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
  }
