{
  description = "Transitive dependencies";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib/";
  };
  outputs = { ... }:
    {
      # The dev tooling is in ./flake-module.nix
      # See comment at `inputs` above.
      # It is loaded into partitions.dev by the root flake.
    };
}
