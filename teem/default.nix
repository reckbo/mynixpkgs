{ stdenv, fetchFromGitHub, cmake, zlib, bzip2, libpng }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "teem";
  version = "1.12.0";
  src = fetchFromGitHub {
      owner = "Slicer";
      repo = "teem";
      rev =   "e4746083c0e1dc0c137124c41eca5d23adf73bfa";
      sha256 = "06sls9gnvgpmb19r0isl7h9ml4xx9x44bywd37pp6jbvk3lfdli2";
  };

  buildInputs = [
    cmake zlib bzip2 libpng
  ];

  meta = with stdenv.lib; {
    description = "Library for representing and processing scientific raster data";
    license = licenses.lgpl21;
    homepage = http://teem.sourceforge.net/index.html;
  };
}
