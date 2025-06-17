# Guide d'installation de Sway et d'un environnement complet sur Arch Linux

Ce guide explique comment installer un environnement de bureau complet basé sur le
gestionnaire de fenêtres **Sway**. Les paquets `waybar`, `wofi`, `lightdm`, `mako`
et `foot` sont déjà validés, mais ils sont listés pour référence.

## 1. Installation des paquets essentiels

Installez les paquets de base via `pacman` :

```bash
sudo pacman -S sway swaybg swayidle \
  waybar wofi lightdm lightdm-gtk-greeter \
  mako foot \
  networkmanager network-manager-applet \
  pipewire pipewire-pulse wireplumber \
  xdg-desktop-portal-wlr xdg-desktop-portal \
  polkit polkit-gnome \
  bluez bluez-utils \
  noto-fonts ttf-dejavu ttf-font-awesome
```

* `swaybg` gère le fond d'écran, `swayidle` la gestion de l'inactivité.
* `networkmanager` permet la gestion réseau (Wi-Fi, Ethernet).
* `pipewire` et `wireplumber` fournissent la pile audio moderne.
* `polkit` permet l'élévation de privilèges graphique.
* `bluez` offre la prise en charge Bluetooth.
* Les polices sont optionnelles mais utiles pour l'affichage.

## 2. Activation des services système

Activez les services nécessaires :

```bash
sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service       # si Bluetooth est utilisé
```

Pour PipeWire, aucun service n'est à activer ; `wireplumber` démarrera
automatiquement avec votre session utilisateur.

## 3. Configuration minimale

1. **LightDM** : choisissez un greeter, par exemple `lightdm-gtk-greeter`. Un
   exemple de fichier est disponible dans [`config/lightdm/lightdm.conf`](config/lightdm/lightdm.conf).
2. **Sway** : copiez la configuration proposée dans
   [`config/sway/config`](config/sway/config) vers `~/.config/sway/config` puis
   adaptez-la à vos besoins.
3. **Waybar** : le panneau est configuré via [`config/waybar/config`](config/waybar/config)
   et son style via [`config/waybar/style.css`](config/waybar/style.css).
4. **Mako** : personnalisez les notifications avec
   [`config/mako/config`](config/mako/config).
5. **Wofi** : ajustez le lanceur grâce à [`config/wofi/config`](config/wofi/config).
6. **Foot** : réglez le terminal via [`config/foot/foot.ini`](config/foot/foot.ini).

## 4. Options supplémentaires

* **Gestion de l'alimentation** : installez `upower` et `power-profiles-daemon`
  pour la batterie. Ajoutez `brightnessctl` pour régler la luminosité.
* **Gestion du verrouillage d'écran** : `swaylock` ou `swaylock-effects` pour
  verrouiller la session.
* **Partage d'écran** : `pipewire` et `xdg-desktop-portal-wlr` sont nécessaires
  pour la capture d'écran dans Wayland.
* **Audio** : pour des contrôles de volume, `pavucontrol` ou `pulsemixer` sont
  pratiques.

## 5. Démarrage de la session

Après redémarrage, LightDM devrait afficher votre session Sway. Sélectionnez-la
et connectez-vous. Une fois dans Sway, Waybar, Mako et les autres composants se
lancent d'après votre configuration.

Ce guide couvre l'installation de base d'un environnement de bureau complet
autour de Sway sur Arch Linux. Ajustez les paquets selon vos besoins et
consultez la documentation officielle Arch pour plus de détails.
