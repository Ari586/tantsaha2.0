#!/usr/bin/env python3
"""
Télécharge l'image de l'Anamamy (Solanum americanum) depuis Wikipedia
"""

import os
import urllib.request
import urllib.parse
import json

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
    except Exception as e:
        print(f"Erreur: {e}")
        return None

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image"""
    try:
        os.makedirs(output_dir, exist_ok=True)
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
        print(f"Téléchargement de {filename}...")
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

def main():
    print("=" * 70)
    print("🌿 Téléchargement de l'image Anamamy (Brède morelle)")
    print("=" * 70)
    print()
    
    # Termes de recherche pour l'anamamy
    search_terms = [
        "Solanum americanum",     # Nom scientifique exact
        "Solanum nigrum",         # Morelle noire (proche)
        "American black nightshade",
        "Glossy nightshade",
    ]
    
    filename = "anamamy"
    
    for term in search_terms:
        print(f"🔍 Recherche: {term}")
        
        # Essayer Wikipedia EN
        url = get_wikipedia_image(term, 'en')
        if url:
            print(f"  📖 Trouvé sur Wikipedia EN")
            if download_image(url, filename):
                print()
                print("✅ Image Anamamy téléchargée avec succès!")
                return
        
        # Essayer Wikipedia FR
        url = get_wikipedia_image(term, 'fr')
        if url:
            print(f"  📖 Trouvé sur Wikipedia FR")
            if download_image(url, filename):
                print()
                print("✅ Image Anamamy téléchargée avec succès!")
                return
    
    print()
    print("❌ Aucune image trouvée")
    print("💡 Essayez manuellement sur:")
    print("   - https://commons.wikimedia.org/wiki/Solanum_americanum")
    print("   - https://commons.wikimedia.org/wiki/Solanum_nigrum")

if __name__ == "__main__":
    main()
