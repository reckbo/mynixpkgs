{ stdenv, zlib, qt4, mesa, libXt, fontconfig, freetype, glib,
  libSM, libX11, libICE, libXrender, libXext }:

stdenv.mkDerivation rec {
  pname = "Slicer";
  version = "4.6.2";
  name = "${pname}-${version}";
  src = ./Slicer-4.6.2-linux-amd64.tar.gz;

  libPath = stdenv.lib.makeLibraryPath [
    zlib
    stdenv.cc.cc
    libXt
    mesa
    qt4
    libSM
    libICE
    libXrender
    libXext
    libX11
    fontconfig
    freetype
    glib
  ];

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p "$out"
    cp -r . "$out"
    # chmod +x "$out/opt/thomaswasalone/thomasWasAlone"

    patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$libPath" \
      "$out/Slicer"

    patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$libPath:$out/lib/Slicer-4.6:$out/lib/Python/lib:$out/lib/Teem-1.12.0" \
      "$out/bin/SlicerApp-real"

    for f in $(find $out -name "*.so"); do
      patchelf --set-rpath "$libPath" $f
    done
  '';

  meta = with stdenv.lib; {
    description = "Software package for visualization and medical image computing";
    license = licenses.bsd;
    homepage = https://www.slicer.org;
  };
}
