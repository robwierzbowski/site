#! /usr/bin/env bash

# This script generates optimized, subsetted fonts for the experience I want to
# provide on my site.

echo '🔠 CharterBT Roman'
npx glyphhanger --subset=font-src/CharterBT-Roman.otf --formats=woff2 --output=src

echo '\n🔠 Inter Variable'
# Subset to latin characters and useful symbols
npx glyphhanger --subset=font-src/Inter-Variable_slnt,wght.ttf --formats=woff2 --whitelist=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD --output=src

# Create micro version of Inter for initial load
echo '\n🔠 Inter Variable micro'
# Create temp directory for intermediate steps
TEMP_DIR=$(mktemp -d)
# Remove all OpenType features except for kerning
pyftsubset font-src/Inter-Variable_slnt,wght.ttf --unicodes=\* --layout-features=kern --output-file=${TEMP_DIR}/Inter-Variable_slnt,wght-micro.ttf
# Agressively subset, leaving only latin letters, numbers, and common punctuation
npx glyphhanger --subset=${TEMP_DIR}/Inter-Variable_slnt,wght-micro.ttf --formats=woff2 --whitelist=U+0000-00A0 --output=src
