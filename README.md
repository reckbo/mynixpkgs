http://sandervanderburg.blogspot.com.au/2014/07/managing-private-nix-packages-outside.html

https://www.reddit.com/r/NixOS/comments/4btjnf/fully_setting_up_a_custom_private_nix_repository/

# build deps, setup dev environment
nix-shell nixpkgs-custom.nix -A pkg

# build pkg
nix-build nixpkgs-custom.nix -A pkg

# test build from tar.gz
nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'

# install package
nix-env -f nixpkgs-custom.nix -iA ConvertBetweenFileFormats
