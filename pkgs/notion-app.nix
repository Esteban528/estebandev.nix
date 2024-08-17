{
  appimageTools,
  lib,
  fetchurl,
}: let
  pname = "notion-app";
  version = "3.0.0-1";

  src = fetchurl {
    url = "https://github.com/aokellermann/notion-repackaged/releases/download/v${version}/Notion-${version}.AppImage";
    sha256 = "4ca2dbc3e90e8166037f420d54a7cfe8373e27707fdee999e6458044b66786d0";
  };

  appimageContents = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

    meta = with lib; {
      description = "Notion Desktop builds for Windows, MacOS and Linux.";
      homepage = "https://github.com/aokellermann/notion-repackaged";
      license = licenses.unfree;
      maintainers = with maintainers; [skane];
      platforms = ["x86_64-linux"];
      mainProgram = "notion-app";
    };
  }
