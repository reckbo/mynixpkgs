{ system ? builtins.currentSystem }:

let
    pkgs = import <nixpkgs> { inherit system; };
    callPackage = pkgs.lib.callPackageWith (pkgs // self);
    self = {
      Slicer = callPackage ./Slicer { };
      ITK = callPackage ./ITK { };
      SlicerExecutionModel = callPackage ./SlicerExecutionModel { };
      DWIConvert = callPackage ./DWIConvert { };
      teem = callPackage ./teem { };
      ConvertBetweenFileFormats = callPackage ./ConvertBetweenFileFormats { };
  };
in
  pkgs // self
