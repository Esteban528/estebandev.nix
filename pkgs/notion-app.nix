{
  appimageTools,
  lib,
  fetchurl,
}: let
  pname = "notion-app";
  version = "3.12.2-1";

  src = fetchurl {
    # url = "https://github.com/aokellermann/notion-repackaged/releases/download/v${version}/Notion-${version}.AppImage";
    url = "https://github.com/sdkane/notion-repackaged/releases/download/v3.12.2-1/Notion-3.12.2-1.AppImage";
    sha256 = "1bqv23djlqjd07jg62fqfqw165n3g74r3a4af92nqcm4qdq6mkj0";
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
