{ stdenv, fetchFromGitHub, cmake, ITK }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "ConvertBetweenFileFormats";
  version = "4.7.1";
  src = fetchFromGitHub {
      owner = "reckbo";
      repo = pname;
      rev = "b1456518b1432b18beb719fc6a5d7f87fa7be1ba";
      sha256 = "10pk39zaaxrv1ybrzwgw07rv6pj56yvkdk7df3q0962ad54ck867";
  };

  buildInputs = [
    cmake
    ITK
  ];

  meta = {
    description = "Convert between medical image formats";
    license = stdenv.lib.licenses.asl20;
    homepage = https://github.com/BRAINSia/BRAINSTools;
  };
}
