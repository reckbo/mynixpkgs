{ stdenv, fetchurl, cmake, git, cacert }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "ITK";
  version = "4.10.0";
  src = fetchurl {
      url = "http://ufpr.dl.sourceforge.net/project/itk/itk/4.10/InsightToolkit-4.10.0.tar.xz";
      sha256 = "0pxijhqsnwcp9jv1d8p11hsj90k8ajpwxhrnn8kk8c56k7y1207a";
  };

  buildInputs = [
    cmake
    git
  ];

  GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";

  cmakeFlags = [
      "-DModule_ITKDCMTK=ON"
      "-DModule_ITKIODCMTK=ON"
  ];

  meta = with stdenv.lib; {
    description = "Medical imaging processing library";
    license = licenses.asl20;
    homepage = http://itk.org;
  };
}
