{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs;[
    open-policy-agent
    pre-commit
    conftest
  ];
}
