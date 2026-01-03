#!/bin/bash
# Script d'optimisation des images pour Tantsaha
# Réduit la taille de l'AAB de 206 MB à ~30 MB

echo "🔧 Optimisation des images pour Google Play..."
echo ""

# Vérifier si ImageMagick est installé
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick n'est pas installé."
    echo "Installez-le avec : brew install imagemagick"
    exit 1
fi

# Créer un backup
echo "📦 Création d'un backup des images originales..."
cp -r assets/images assets/images_backup_$(date +%Y%m%d_%H%M%S)

# Compteurs
total=0
optimized=0

# Optimiser toutes les PNG
echo "🖼️  Optimisation des images PNG..."
for img in assets/images/*.png; do
    if [ -f "$img" ]; then
        total=$((total + 1))
        original_size=$(du -k "$img" | cut -f1)
        
        # Redimensionner à max 1920x1080 et compresser
        convert "$img" \
            -resize '1920x1080>' \
            -quality 85 \
            -strip \
            "$img"
        
        new_size=$(du -k "$img" | cut -f1)
        reduction=$((original_size - new_size))
        
        if [ $reduction -gt 0 ]; then
            optimized=$((optimized + 1))
            echo "  ✓ $(basename "$img"): $(echo "scale=1; $original_size/1024" | bc)MB → $(echo "scale=1; $new_size/1024" | bc)MB"
        fi
    fi
done

# Optimiser les JPG si présents
for img in assets/images/*.jpg assets/images/*.jpeg; do
    if [ -f "$img" ]; then
        total=$((total + 1))
        convert "$img" \
            -resize '1920x1080>' \
            -quality 85 \
            -strip \
            "$img"
        optimized=$((optimized + 1))
    fi
done

echo ""
echo "✅ Optimisation terminée !"
echo "📊 $optimized images sur $total optimisées"
echo ""
echo "🔍 Nouvelle taille du dossier images :"
du -sh assets/images/

echo ""
echo "📱 Pour reconstruire l'AAB :"
echo "   flutter build appbundle --release"
