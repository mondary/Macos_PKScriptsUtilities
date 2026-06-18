#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Download Wallpapers
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName download_wallpapers.sh

# Documentation:
# @raycast.description Download wallpapers from wallpaperflare.com
# @raycast.author Cmondary
# @raycast.authorURL https://github.com/mondary

base_url="https://www.wallpaperflare.com/search?wallpaper=futuristic+city&page="

mkdir -p Wallpapers

extract_image_urls() {
    local page_number=$1
    local page_url="${base_url}${page_number}"
    local image_urls=($(curl -s "$page_url" | grep -o 'itemprop="url" href="[^"]*"' | sed -e 's/itemprop="url" href="//g' -e 's/"//g'))

    for image_url in "${image_urls[@]}"; do
        echo "${image_url}/download" >> Wallpapers/images_futuristic+city.csv
    done

    echo "Extraction des URLs d'images de la page $page_number terminée."
}

extract_image_urls 1
total_pages=10

for ((page=2; page<=total_pages; page++)); do
    extract_image_urls $page
done

echo "Extraction des URLs d'images de toutes les pages terminée. Les URLs sont enregistrées dans Wallpapers/images_futuristic+city.csv."

list_images_from_url() {
    local link=$1
    local image_urls=($(curl -s "$link" | grep -o '<img[^>]*src="[^"]*"[^>]*>' | sed -e 's/<img[^>]*src="//g' -e 's/"[^>]*>//g'))

    for image_url in "${image_urls[@]}"; do
        if [[ $image_url != *"-thumb"* && $image_url != *"-preview"* && $image_url != *"logo.svg" ]]; then
            filename=$(basename "$image_url")
            curl -s "$image_url" -o "Wallpapers/$filename"
        fi
    done
}

while IFS= read -r image_url; do
    list_images_from_url "$image_url"
done < Wallpapers/images_futuristic+city.csv

echo "Liste des fichiers images obtenue. Les fichiers sont enregistrés dans Wallpapers."

mv Wallpapers/images_futuristic+city.csv Wallpapers/images_futuristic+city.csv

echo "Le fichier CSV a été renommé en images_futuristic+city.csv."