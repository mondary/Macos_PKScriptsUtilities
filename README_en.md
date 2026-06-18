# Macos PKScriptsUtilities

![Project icon](icon.png)

[🇬🇧 EN](README_en.md) · [🇫🇷 FR](README.md)

✨ macOS scripts for Raycast + Menu bar application.

## ✅ Features

- **Desktop archive** : Sort files by month, respects "Bureau" tags
- **Wallpaper changer** : Loop every 60s on random images
- **Wallpaper downloader** : Fetch wallpapers from wallpaperflare.com
- **Downloads mover** : Move files from Downloads to Desktop

## 🧠 Usage

### Via Raycast
1. Raycast → Extensions → Script Commands
2. Add Script Directory → `/Users/clm/Documents/GitHub/PROJECTS/Macos_PKScriptsUtilities`
3. Type keyword: `archive`, `wallpaper`, `dl-wp`, `dl2desk`

### Via App
1. Open `release/Macos_PKScriptsUtilities.app`
2. Menu bar → Select action
3. Options: Single menu or Multi‑icons

### Via Terminal
```bash
./archive.sh                          # Archive desktop
./change-wallpaper.sh                 # Loop wallpaper (Ctrl+C to stop)
./change-wallpaper.sh --once          # Change wallpaper once
./download_wallpapers.sh              # Download wallpapers
./dl2desk.sh                          # Loop downloads→desktop (Ctrl+C to stop)
./dl2desk.sh --once                   # Move downloads→desktop once
```

## ⚙️ Settings

**Desktop archive**
- `ARCHIVE_PATH` : Custom archive path (default: `~/Desktop/DesktopArchive`)
- `ARCHIVE_LINK_NAME` : Shortcut name (default: `DesktopArchive`)

**Wallpapers**
- Create `wallpapers/` folder with `.jpg` images

**Downloads**
- Ignores `.tmp` and `.crdownload`

## 🧾 Commands

| Command | Description |
|----------|-------------|
| `archive` | Archive desktop by month |
| `wallpaper` | Loop wallpaper change |
| `dl-wp` | Download wallpapers |
| `dl2desk` | Move downloads→desktop |

## 📦 Build & Package

```bash
cd /Users/clm/Documents/GitHub/PROJECTS/Macos_PKScriptsUtilities
bash src/app/build.sh
```

Generates `release/Macos_PKScriptsUtilities.app` and copies scripts to root.

## 🧾 Changelog

- **1.0.0** (2026‑06‑18): Migrated from Macos_Archive_desktop_content, added 4 scripts, reorganized src/app + src/snippets

## 🔗 Links

- FR README: [README.md](README.md)