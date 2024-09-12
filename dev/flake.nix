{
  description = "Dependencies for development purposes";

  inputs = {
    # Flakes don't give us a good way to depend on .., so we put the
    # transitive dependencies in a separate flake.
    # Note that `path:` is used so that changing git revision would not
    # invalidate the lock file unless the content of the ../transitive
    # is actually changed.
    transitive.url = "path:../transitive";
    nixpkgs-lib.follows = "transitive/nixpkgs-lib";

    nixpkgs.url = "github:NixOS/nixpkgs";
    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";
    hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";

  };

  outputs = { ... }:
    {
      # The dev tooling is in ./flake-module.nix
      # See comment at `inputs` above.
      # It is loaded into partitions.dev by the root flake.
    };
}
