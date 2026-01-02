#!/usr/bin/env python3
"""
Script final pour compléter les images manquantes
Utilise des URLs alternatives vérifiées
"""

import os
import urllib.request
import time

# Images manquantes avec URLs alternatives vérifiées
FINAL_MISSING = {
    "vary_anaty_rano": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=800",  # rice paddy
    "katsaka": "https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=800",  # corn maize
    "sakamalao": "https://images.unsplash.com/photo-1590245896825-273e18c4b5a1?w=800",  # ginger root
    "bredes_mafana": "https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?w=800",  # leafy greens
    "persil": "https://images.unsplash.com/photo-1595759608364-2bb25e7cd652?w=800",  # parsley herbs
    "anambongo": "https://images.unsplash.com/photo-1599493758267-c6c884c7071f?w=800",  # string beans
    "sakay_pilokely": "https://images.unsplash.com/photo-1612478049904-582ca986ac0e?w=800",  # bird chili hot
    "pasteque": "https://images.unsplash.com/photo-1582281298055-e25b95c0eebb?w=800",  # watermelon
    "navet": "https://images.unsplash.com/photo-1590931122009-4bcc0c2a2d5c?w=800",  # turnip white
}

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image depuis une URL"""
    try:
        os.makedirs(output_dir, exist_ok=True)
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
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
    print("=" * 70)
    print("Téléchargement final des images manquantes")
    print("=" * 70)
    print()
    
    success = 0
    failed = 0
    
    for crop_name, url in FINAL_MISSING.items():
        if download_image(url, crop_name):
            success += 1
        else:
            failed += 1
        time.sleep(0.5)
    
    print()
    print("=" * 70)
    print(f"Terminé! ✓ {success} réussies, ✗ {failed} échouées")
    print("=" * 70)
    
    # Compter le total d'images
    voly_dir = "assets/voly"
    if os.path.exists(voly_dir):
        total_images = len([f for f in os.listdir(voly_dir) if f.endswith('.jpg')])
        print(f"\n📊 Total d'images disponibles: {total_images}")

if __name__ == "__main__":
    main()
