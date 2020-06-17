{ project_dir ? (toString ./.)
, pkgs ? import <nixpkgs> {
    overlays = [(self: super:{
    })];
  }
}:

pkgs.mkShell {
  shellHook = ''
    # A known-good invocation, `nix-shell --run server` will
    # always start the server.
    server() {
      (
      cd ${project_dir}
      bin/rails server "$@"
      )
    }
  '';
  buildInputs = with pkgs; [
    ruby_2_6

    # nokogiri
    zlib

    mailcatcher
    # postgresql, only used for the client
    postgresql_9_6

    # Node JS dependencies, used to compile the JS parts.
    nodejs-10_x
    yarn

    #to boot the db and services vm
    nixops
  ];
}
