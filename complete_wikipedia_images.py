#!/usr/bin/env python3
"""
Script pour compléter les images manquantes depuis Wikipedia
Avec pause plus longue entre les requêtes
"""

import os
import urllib.request
import urllib.parse
import json
import time

def get_wikipedia_image(search_term, lang='en'):
    """Récupère l'URL d'une image depuis Wikipedia"""
    try:
        search_encoded = urllib.parse.quote(search_term)
        api_url = f"https://{lang}.wikipedia.org/w/api.php?action=query&titles={search_encoded}&prop=pageimages&format=json&pithumbsize=800"
        
        req = urllib.request.Request(api_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode())
        
        pages = data.get('query', {}).get('pages', {})
        for page_id, page_data in pages.items():
            if 'thumbnail' in page_data:
                return page_data['thumbnail']['source']
        return None
    except:
        return None

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image"""
    try:
        os.makedirs(output_dir, exist_ok=True)
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=15) as response:
            data = response.read()
        
        with open(filepath, 'wb') as f:
            f.write(data)
        
        size_kb = len(data) / 1024
        print(f"✅ {filename}.jpg téléchargé ({size_kb:.1f} KB)")
        return True
    except Exception as e:
        print(f"❌ Erreur: {e}")
        return False

# Images manquantes seulement
MISSING_CROPS = {
    "voanjobory": ["Bambara groundnut", "Vigna subterranea"],
    "sakay": ["Chili pepper", "Capsicum"],
    "sakay_pilokely": ["Thai chili", "Piri piri"],
    "poivron_doux": ["Bell pepper", "Sweet pepper"],
    "consoude": ["Comfrey", "Symphytum"],
}

def main():
    print("🔄 Téléchargement des images manquantes depuis Wikipedia")
    print()
    
    for filename, search_terms in MISSING_CROPS.items():
        print(f"📥 {filename}: {', '.join(search_terms)}")
        
        for term in search_terms:
            url = get_wikipedia_image(term)
            if url:
                print(f"  📖 Trouvé: {term}")
                if download_image(url, filename):
                    break
            time.sleep(3)  # Pause plus longue
        
        print()
    
    print("✅ Terminé!")

if __name__ == "__main__":
    main()
