{ stdenv, libSM, libX11, libICE, libXrender, libXext,
  zlib }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "Slicer";
  version = "4.6.2";
  src = ./Slicer-4.6.2-linux-amd64.tar;

  libPath = stdenv.lib.makeLibraryPath [
    stdenv.cc.cc
    libSM
    libICE
    libXrender
    libXext
    zlib
    libX11
  ];

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p "$out/opt/$pname"
    cp -r . "$out/opt/$pname"
    # chmod +x "$out/opt/thomaswasalone/thomasWasAlone"

    patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$libPath" \
      "$out/opt/$pname/Slicer"

    mkdir "$out/bin"
    ln -s "$out/opt/$pname/Slicer" "$out/bin/Slicer"
  '';

  meta = with stdenv.lib; {
    description = "Medical Imaging";
    license = licenses.lgpl21;
    homepage = http://teem.sourceforge.net/index.html;
  };
}
