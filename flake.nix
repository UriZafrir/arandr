{
  description = "ARandR development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        python3
        python3Packages.pygobject3
        gtk3
        gobject-introspection
      ];
      shellHook = ''
        # Customize prompt to show devShell context
        export PS1="(ARandR-dev) $PS1"
      '';
    };
  };
}