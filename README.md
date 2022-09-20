cjs1 - Full-on cjs [dot-home] Configuration
===========================================

This is a [dot-home] module that has the full (non-desktop) dot-file
configuration for [Curt J. Sampson].

But you probably want the [cjs0] module, not this one.

To quickly set up the full `cjs1` dot-home configuration on a fresh
host (even if it already has some parts of it installed) there is
a [`quick-setup`] script which can be piped into Bash:

    sudo apt-get install -y curl file git vim-nox   # or vim-gtk
    curl https://raw.githubusercontent.com/dot-home/cjs1/master/quick-setup | bash
    . $HOME/.bashrc



<!-------------------------------------------------------------------->
[Curt J. Sampson]: https://github.com/0cjs/
[`quick-setup`]: https://raw.githubusercontent.com/dot-home/cjs1/master/quick-setup
[cjs0]: https://github.com/dot-home/cjs0/
[dot-home]: https://github.com/dot-home/_dot-home/
