#!/bin/bash
# List of Nerd Font URLs to download and install
fonts=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IntelOneMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DroidSansMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Terminus.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Monoid.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Noto.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.zip"
)

# Directory to store the downloaded fonts
font_dir="$HOME/.fonts"

# Create the fonts directory if it doesn't exist
mkdir -p "$font_dir"

echo "[-] Downloading and installing fonts [-]"

for font_url in "${fonts[@]}"; do
    echo "Downloading: $font_url"
    wget "$font_url" -P /tmp/

    # Extract the filename from the URL
    font_zip=$(basename "$font_url")

    echo "Unzipping: $font_zip"
    unzip "/tmp/$font_zip" -d "$font_dir"

    # Clean up the zip file after extraction
    rm "/tmp/$font_zip"
done

# Update the font cache
echo "Updating font cache..."
fc-cache -fv

echo "All fonts installed and cache updated!"

