# dotfiles
Distro: Kubuntu
Terminal: Kitty
Bar: Waybar
Ide: Neovim

## install

Clone into `~/files/` — cloning elsewhere may break configs. (not sure haven't tested yet)

```bash
git clone <url> ~/files
```

Symlink with Stow (target must be set to `~`):

```bash
stow -t ~ <directory>
```

## fonts

after setting up font dont forget to update cache:

```bash
fc-cache -fv
fc-list | grep -i "font-name"  # verify
```
