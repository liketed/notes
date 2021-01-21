sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
. /etc/static/bashrc
mv ~/.nixpkgs/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix.backup
ln -s ~/dev/notes/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix
darwin-rebuild switch
