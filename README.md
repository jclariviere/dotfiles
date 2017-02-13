# Dotfiles
Files with `.windows` extensions are for windows only, the extension needs to be removed when symlinking.

## Creating symlinks
Linux: `ln -s /full/path/to/file`

Windows (as admin): `mklink file /full/path/to/file`

## Note on xclip commands
Some commands in `.tmux.conf` and `.zshrc` use xclip commands to copy stuff into the X clipboard.
Usually, only the `CLIPBOARD` selection is needed, but there seems to be a bug in VMware's clipboard
sharing (at least `VMware Fusion 8.5.3`) where it randomly switches between `PRIMARY` and `CLIPBOARD`.
