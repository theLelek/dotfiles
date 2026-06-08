Distro: Kubuntu
Desktop env: Kde
Terminal: Kitty
Bar: Waybar
Ide: Neovim

## install

Clone into `~/files/` — cloning elsewhere may break configs. (not sure haven't tested yet)

```bash
git clone <url> ~/files
```

when using ~/files stow target must be set to `~`:

```bash
stow -t ~ <directory>
```

## fonts

after setting up font dont forget to update cache:

```bash
fc-cache -fv
fc-list | grep -i "font-name"  # verify
```

### syncthing
seting up syncthing deamon requires root privileges because it creates a unit file for systemd




sadly even the user kdeglobal file can sometimes change after updating thus keep in mind that the kde config in 
kde/.config/kdeglobals may need to be fixed manually

