{...} : {
  services.openssh = {
    enable = true;
    permitRootLogin = "no";  # Permite el acceso SSH solo a usuarios no root
    passwordAuthentication = true;  # Permite autenticación por contraseña
  };
}
