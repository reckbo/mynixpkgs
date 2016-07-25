{ system ? builtins.currentSystem }:

let
    pkgs = import <nixpkgs> { inherit system; };
    callPackage = pkgs.lib.callPackageWith (pkgs // self);
    self = {
      ITK = callPackage ./ITK { };
      SlicerExecutionModel = callPackage ./SlicerExecutionModel { };
      DWIConvert = callPackage ./DWIConvert { };
      teem = callPackage ./teem { };
  };
in
  pkgs // self
