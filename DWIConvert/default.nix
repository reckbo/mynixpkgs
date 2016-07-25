{ stdenv, fetchFromGitHub, cmake, ITK, SlicerExecutionModel }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "DWIConvert";
  version = "4.7.1";
  src = fetchFromGitHub {
      owner = "reckbo";
      repo = pname;
      rev = "cf9aae8515e5d69b1a027dca3e68c4f70915f541";
      sha256 = "1rpq4khb2wd23slya582d2cq2bk8hw8b4y7r5iw1sqmizr07wzdc";
  };

  buildInputs = [
    cmake
    ITK
    SlicerExecutionModel
  ];

  meta = with stdenv.lib; {
    description = "Dicom converter";
    license = licenses.asl20;
    homepage = https://github.com/BRAINSia/BRAINSTools;
  };
}
