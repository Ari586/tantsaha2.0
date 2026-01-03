#!/bin/bash
# Script pour optimiser les images sans perte de qualité visible
# Réduit la taille tout en gardant une bonne qualité pour mobile

IMAGES_DIR="/Users/arielhavana/akoho_tech/assets/images"
BACKUP_DIR="/Users/arielhavana/akoho_tech/assets/images_backup_$(date +%Y%m%d_%H%M%S)"

# Vérifier si les outils sont installés
check_tools() {
    echo "🔧 Vérification des outils..."
    
    if ! command -v convert &> /dev/null; then
        echo "❌ ImageMagick n'est pas installé. Installation..."
        brew install imagemagick
    fi
    
    if ! command -v pngquant &> /dev/null; then
        echo "❌ pngquant n'est pas installé. Installation..."
        brew install pngquant
    fi
    
    if ! command -v jpegoptim &> /dev/null; then
        echo "❌ jpegoptim n'est pas installé. Installation..."
        brew install jpegoptim
    fi
    
    echo "✅ Tous les outils sont prêts!"
}

# Créer un backup
create_backup() {
    echo ""
    echo "📦 Création du backup dans: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp "$IMAGES_DIR"/*.{png,jpg,jpeg,PNG,JPG,JPEG} "$BACKUP_DIR/" 2>/dev/null
    echo "✅ Backup créé!"
}

# Optimiser les PNG
optimize_png() {
    echo ""
    echo "🖼️  Optimisation des PNG..."
    
    for file in "$IMAGES_DIR"/*.png "$IMAGES_DIR"/*.PNG; do
        [ -f "$file" ] || continue
        filename=$(basename "$file")
        
        # 1. Redimensionner si trop grand (max 1024px de large pour mobile)
        width=$(identify -format "%w" "$file" 2>/dev/null)
        if [ "$width" -gt 1024 ] 2>/dev/null; then
            echo "   📐 Redimensionnement: $filename ($width px → 1024 px)"
            convert "$file" -resize 1024x -quality 95 "$file"
        fi
        
        # 2. Optimiser avec pngquant (compression avec perte minimale)
        original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        pngquant --quality=80-95 --speed 1 --force --output "$file" "$file" 2>/dev/null
        new_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        
        # Calculer le pourcentage de réduction
        if [ "$original_size" -gt 0 ]; then
            reduction=$(echo "scale=0; (($original_size - $new_size) * 100) / $original_size" | bc)
            echo "   ✅ $filename: $(numfmt --to=iec $original_size 2>/dev/null || echo "$original_size bytes") → $(numfmt --to=iec $new_size 2>/dev/null || echo "$new_size bytes") (-${reduction}%)"
        fi
    done
}

# Optimiser les JPG/JPEG
optimize_jpg() {
    echo ""
    echo "📷 Optimisation des JPG/JPEG..."
    
    for file in "$IMAGES_DIR"/*.jpg "$IMAGES_DIR"/*.jpeg "$IMAGES_DIR"/*.JPG "$IMAGES_DIR"/*.JPEG; do
        [ -f "$file" ] || continue
        filename=$(basename "$file")
        
        # 1. Redimensionner si trop grand
        width=$(identify -format "%w" "$file" 2>/dev/null)
        if [ "$width" -gt 1024 ] 2>/dev/null; then
            echo "   📐 Redimensionnement: $filename ($width px → 1024 px)"
            convert "$file" -resize 1024x -quality 85 "$file"
        fi
        
        # 2. Optimiser avec jpegoptim
        original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        jpegoptim --max=85 --strip-all --quiet "$file" 2>/dev/null
        new_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        
        if [ "$original_size" -gt 0 ]; then
            reduction=$(echo "scale=0; (($original_size - $new_size) * 100) / $original_size" | bc)
            echo "   ✅ $filename: $(numfmt --to=iec $original_size 2>/dev/null || echo "$original_size bytes") → $(numfmt --to=iec $new_size 2>/dev/null || echo "$new_size bytes") (-${reduction}%)"
        fi
    done
}

# Afficher le résumé
show_summary() {
    echo ""
    echo "═══════════════════════════════════════════════════"
    echo "📊 RÉSUMÉ DE L'OPTIMISATION"
    echo "═══════════════════════════════════════════════════"
    
    original_total=$(du -sh "$BACKUP_DIR" 2>/dev/null | cut -f1)
    new_total=$(du -sh "$IMAGES_DIR" 2>/dev/null | cut -f1)
    
    echo "📦 Taille originale: $original_total"
    echo "✨ Nouvelle taille:  $new_total"
    echo ""
    echo "💡 Backup sauvegardé dans: $BACKUP_DIR"
    echo "   (Supprimez-le après avoir vérifié que tout fonctionne)"
    echo ""
    echo "🚀 N'oubliez pas de rebuild l'app: flutter clean && flutter build"
}

# Exécution principale
main() {
    echo "═══════════════════════════════════════════════════"
    echo "🖼️  OPTIMISATION DES IMAGES TANTSAHA"
    echo "═══════════════════════════════════════════════════"
    
    check_tools
    create_backup
    optimize_png
    optimize_jpg
    show_summary
}

main
