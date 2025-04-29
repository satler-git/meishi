{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (wrangler.overrideAttrs {
            dontCheckForBrokenSymlinks = true;
          })

          pnpm
          pnpm-shell-completion

          nodejs_22
        ];
      };
    };
}
