#!/usr/bin/env python3
"""
Script pour télécharger les images manquantes avec URLs alternatives
"""

import os
import urllib.request
import time

# Images manquantes avec URLs alternatives
MISSING_IMAGES = {
    "avoine": "https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=800",  # oats alternative
    "choux_fleur": "https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?w=800",  # cauliflower
    "pois_chiche": "https://images.unsplash.com/photo-1605639514960-98cbffcece91?w=800",  # chickpeas
    "anambongo": "https://images.unsplash.com/photo-1599493758267-c6c884c7071f?w=800",  # green beans
    "sakay_pilokely": "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=800",  # hot peppers
    "pasteque": "https://images.unsplash.com/photo-1587049352851-8d4e89133924?w=800",  # watermelon
    "navet": "https://images.unsplash.com/photo-1597612270574-8a2d6f6e1c2e?w=800",  # turnip
    "betterave_rouge": "https://images.unsplash.com/photo-1604093882750-3ed498f3178b?w=800",  # red beet
    "persil": "https://images.unsplash.com/photo-1617375407474-80d51b3e98fb?w=800",  # parsley
    
    # Images supplémentaires pour d'autres cultures
    "saonjo": "https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=800",  # taro
    "anatsonga": "https://images.unsplash.com/photo-1622205313162-be1d5712a43f?w=800",  # watercress
    "bredes_mafana": "https://images.unsplash.com/photo-1622205313162-be1d5712a43f?w=800",  # greens
    "voanjobory": "https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?w=800",  # bambara peas
}

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image depuis une URL"""
    try:
        os.makedirs(output_dir, exist_ok=True)
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
        if os.path.exists(filepath):
            print(f"✓ {filename}.jpg existe déjà")
            return True
        
        print(f"Téléchargement de {filename}...")
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        
        with urllib.request.urlopen(req, timeout=15) as response:
            data = response.read()
        
        with open(filepath, 'wb') as f:
            f.write(data)
        
        print(f"✓ {filename}.jpg téléchargé")
        return True
        
    except Exception as e:
        print(f"✗ Erreur pour {filename}: {e}")
        return False

def main():
    print("=" * 60)
    print("Téléchargement des images manquantes")
    print("=" * 60)
    print()
    
    success = 0
    failed = 0
    
    for crop_name, url in MISSING_IMAGES.items():
        if download_image(url, crop_name):
            success += 1
        else:
            failed += 1
        time.sleep(0.5)
    
    print()
    print("=" * 60)
    print(f"Terminé! ✓ {success} réussies, ✗ {failed} échouées")
    print("=" * 60)

if __name__ == "__main__":
    main()
