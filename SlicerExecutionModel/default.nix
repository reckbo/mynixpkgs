{ stdenv, cmake, fetchFromGitHub, ITK }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "SlicerExecutionModel";
  version = "1.0";
  src = fetchFromGitHub {
      owner = "Slicer";
      repo = pname;
      rev = "7525fc777a064529aff55e41aef6d91a85074553";
      sha256 = "13xqcwd1n8qdjvg6yln55h678azvj3azmyhpr9sakg3x4dh7jzzh";
  };

  buildInputs = [
    cmake
    ITK
  ];

  phases = "unpackPhase buildPhase";
  buildPhase = ''mkdir $out; cd $out; cmake $src; make'';

  meta = {
    description = "An open-source CMake-based project that provides macros and associated tools for the easy building of 3D Slicer command line interface (CLI) modules";
    license = "3D Slicer Contribution and Software License Agreement (https://www.slicer.org/pages/LicenseText)";
    homepage = https://github.com/Slicer/SlicerExecutionModel;
  };
}
