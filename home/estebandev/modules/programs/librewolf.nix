{ config, inputs, lib, pkgs, ... }: let
    main_profile_name = "default";

    # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/generated-firefox-addons.nix
    # https://github.com/Kreyren/nixos-config/blob/bd4765eb802a0371de7291980ce999ccff59d619/nixos/users/kreyren/home/modules/web-browsers/firefox/firefox.nix
    extensionNames = [
        "ublock-origin"
        #"font-fingerprint-defender" # No existe
        "chameleon-ext"
        # "clearurls"
        "libredirect"
        #"vimium-ff" # Todavia no me acostumbro a esta webada
        "material-icons-for-github"
        "offline-qr-code-generator"
    ];

policies_json = {
  DisplayBookmarksToolbar = "never";

  ExtensionSettings = let
    ext = title: {
      name = "${inputs.firefox-addons.packages.x86_64-linux.${title}.addonId}";
      value = {
        install_url = "file://${inputs.firefox-addons.packages.x86_64-linux.${title}}/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/${inputs.firefox-addons.packages.x86_64-linux.${title}.addonId}.xpi";
        installation_mode = "force_installed";
        default_area = "menupanel";
        private_browsing = true;
      };
    };
    ext_list =
      builtins.listToAttrs (map (extName: ext extName) extensionNames)
      // builtins.listToAttrs [ (ext "firefox-color") ];
    custom = { "*".installation_mode = "blocked"; };
  in
    ext_list // custom;

  ExtensionUpdate = false;
};
in {
        programs.librewolf = {
            enable = true;
            #configPath = ".local/.mozilla/firefox";
            package = pkgs.librewolf.override { extraPolicies = policies_json; };
            profiles."${main_profile_name}" = {
                extensions.force = true;
                extraConfig = ''
                    /* Eliminar la feature screenshots */
                    user_pref("screenshots.browser.component.enabled", false);
                '';
            };
        };
        stylix.targets.librewolf.colorTheme.enable = true;
        stylix.targets.librewolf.profileNames = [ "${main_profile_name}" ];
}
