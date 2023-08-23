{ lib, stdenv }: stdenv.mkDerivation {
  pname         = "cute";
  version       = "2.8.0";
  include       = builtins.path { path = ./include; };
  lib           = builtins.path { path = ./lib;     };
  unpackPhase   = ":";
  dontPatch     = true;
  dontConfigure = true;
  dontBuild     = true;
  installPhase  = ''
    mkdir -p "$out/lib/pkgconfig";
    cp -r "$include" "$out/include";
    sed -e "s,@PREFIX@,$out,"            \
        -e "s,@VERSION@,$version,g"      \
        "$lib/pkgconfig/cute.pc.in"      \
        > "$out/lib/pkgconfig/cute.pc";
  '';
  meta.license = lib.licenses.mit;
}
