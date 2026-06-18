# Macos PKScriptsUtilities

![Project icon](icon.png)

[🇫🇷 FR](README.md) · [🇬🇧 EN](README_en.md)

✨ Scripts macOS pour Raycast + Application menu bar.

## ✅ Fonctionnalités

- **Archive du bureau** : Classe les fichiers par mois, respecte les tags "Bureau"
- **Changement de wallpaper** : Boucle toutes les 60s sur des images aléatoires
- **Téléchargement de wallpapers** : Récupère des wallpapers depuis wallpaperflare.com
- **Déplacement des téléchargements** : Déplace les fichiers de Downloads vers Desktop

## 🧠 Utilisation

### Via Raycast
1. Raycast → Extensions → Script Commands
2. Add Script Directory → `/Users/clm/Documents/GitHub/PROJECTS/Macos_PKScriptsUtilities`
3. Tape le mot‑clé : `archive`, `wallpaper`, `dl-wp`, `dl2desk`

### Via Application
1. Lance `release/Macos_PKScriptsUtilities.app`
2. Menu bar → Choisis l'action voulue
3. Options : Single menu ou Multi‑icons

### Via Terminal
```bash
./archive.sh                          # Archive desktop
./change-wallpaper.sh                 # Loop wallpaper (Ctrl+C pour stop)
./change-wallpaper.sh --once          # Change wallpaper une fois
./download_wallpapers.sh              # Télécharge wallpapers
./dl2desk.sh                          # Loop downloads→desktop (Ctrl+C pour stop)
./dl2desk.sh --once                   # Déplace downloads→desktop une fois
```

## ⚙️ Réglages

**Archive desktop**
- `ARCHIVE_PATH` : Chemin custom de l'archive (défaut: `~/Desktop/DesktopArchive`)
- `ARCHIVE_LINK_NAME` : Nom du raccourci (défaut: `DesktopArchive`)

**Wallpapers**
- Crée un dossier `wallpapers/` avec des `.jpg`

**Downloads**
- Ignore `.tmp` et `.crdownload`

## 🧾 Commandes

| Commande | Description |
|----------|-------------|
| `archive` | Archive desktop par mois |
| `wallpaper` | Change wallpaper en boucle |
| `dl-wp` | Télécharge wallpapers |
| `dl2desk` | Déplace downloads→desktop |

## 📦 Build & Package

```bash
cd /Users/clm/Documents/GitHub/PROJECTS/Macos_PKScriptsUtilities
bash src/app/build.sh
```

Génère `release/Macos_PKScriptsUtilities.app` et copie les scripts à la racine.

## 🧾 Changelog

- **1.0.0** (2026‑06‑18) : Migration depuis Macos_Archive_desktop_content, ajout des 4 scripts, réorganisation src/app + src/snippets

## 🔗 Liens

- EN README : [README_en.md](README_en.md)