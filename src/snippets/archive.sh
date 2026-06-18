#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Archive
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName archive.sh

# Documentation:
# @raycast.description Create monthly archive on desktop
# @raycast.author Cmondary
# @raycast.authorURL https://github.com/mondary

# Définit le chemin du bureau
desktop_path="${HOME}/Desktop"

# Définit le chemin de l'archive (priorité à ARCHIVE_PATH)
archive_path="${ARCHIVE_PATH:-${HOME}/Desktop/DesktopArchive}"

if [[ "${archive_path}" == "~/"* ]]; then
  archive_path="${HOME}/${archive_path#~/}"
fi

# Crée le dossier d'archive s'il n'existe pas
mkdir -p "${archive_path}" || {
  echo "Erreur: impossible de créer/accéder au dossier d'archive: ${archive_path}"
  exit 1
}

# Assure présence d'un raccourci sur le bureau vers le dossier d'archive
archive_link_name="${ARCHIVE_LINK_NAME:-DesktopArchive}"
archive_link_path="${desktop_path}/${archive_link_name}"

if [[ -L "${archive_link_path}" ]]; then
  current_target="$(readlink "${archive_link_path}")"
  if [[ "${current_target}" != "${archive_path}" ]]; then
    rm -f "${archive_link_path}" && ln -s "${archive_path}" "${archive_link_path}" || {
      echo "Erreur: impossible de mettre à jour le raccourci: ${archive_link_path}"
      exit 1
    }
  fi
elif [[ -e "${archive_link_path}" ]]; then
  echo "Erreur: '${archive_link_path}' existe déjà (pas un lien). Renommer/supprimer, ou définir ARCHIVE_LINK_NAME."
  exit 1
else
  ln -s "${archive_path}" "${archive_link_path}" || {
    echo "Erreur: impossible de créer le raccourci: ${archive_link_path}"
    exit 1
  }
fi

# Obtient la date du jour au format YYYY_MM_Mois
current_month_year="$(LC_TIME=fr_FR.UTF-8 date +%Y_%m_%B)"

# Définit le chemin du dossier pour le mois et l'année en cours dans l'archive
current_month_year_folder="${archive_path}/${current_month_year}"

# Crée le dossier pour le mois et l'année en cours s'il n'existe pas
mkdir -p "${current_month_year_folder}"

# Boucle sur tous les fichiers du bureau
for file in "${desktop_path}"/*; do
  [[ -e "${file}" ]] || continue
  if [[ "$(basename "${file}")" == "DesktopArchive" ]]; then
    continue
  fi

  # Récupère les tags du fichier (si possible)
  tags=$(mdls -name kMDItemUserTags -raw "${file}")

  # Si le fichier a des tags
  if [ -n "${tags}" ]; then

    # Si le tag "Bureau" n'est pas présent
    if [[ ! "${tags}" =~ "Bureau" ]]; then

      # Détermine le chemin de destination du fichier
      destination="${current_month_year_folder}/$(basename "${file}")"

      # Si un fichier avec le même nom existe déjà à destination
      if [ -e "${destination}" ]; then

        # Déplace le fichier avec confirmation
        mv -i "${file}" "${destination}"

      else

        # Déplace le fichier sans confirmation
        mv "${file}" "${destination}"

      fi

    fi

  # Si le fichier n'a pas de tags ou le tag "Bureau"
  else

    # Détermine le chemin de destination du fichier
    destination="${current_month_year_folder}/$(basename "${file}")"

    # Si un fichier avec le même nom existe déjà à destination
    if [ -e "${destination}" ]; then

      # Déplace le fichier avec confirmation
      mv -i "${file}" "${destination}"

    else

      # Déplace le fichier sans confirmation
      mv "${file}" "${destination}"

    fi

  fi

done