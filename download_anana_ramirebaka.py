#!/usr/bin/env python3
"""
Télécharge l'image de l'Anana/Ramirebaka (plante malgache) depuis Wikipedia
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

def get_wikimedia_image(search_term):
    """Récupère une image depuis Wikimedia Commons"""
    try:
        search_encoded = urllib.parse.quote(search_term)
        api_url = f"https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch={search_encoded}&srnamespace=6&format=json&srlimit=1"
        
        req = urllib.request.Request(api_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode())
        
        results = data.get('query', {}).get('search', [])
        if results:
            filename = results[0]['title'].replace('File:', '')
            filename_encoded = urllib.parse.quote(filename)
            
            image_api_url = f"https://commons.wikimedia.org/w/api.php?action=query&titles=File:{filename_encoded}&prop=imageinfo&iiprop=url&iiurlwidth=800&format=json"
            
            req2 = urllib.request.Request(image_api_url, headers={'User-Agent': 'Mozilla/5.0'})
            with urllib.request.urlopen(req2, timeout=10) as response2:
                image_data = json.loads(response2.read().decode())
            
            pages = image_data.get('query', {}).get('pages', {})
            for page_id, page_info in pages.items():
                imageinfo = page_info.get('imageinfo', [])
                if imageinfo:
                    return imageinfo[0].get('thumburl') or imageinfo[0].get('url')
        return None
    except Exception as e:
        print(f"Erreur Wikimedia: {e}")
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
    print("🥬 Téléchargement de l'image Anana/Ramirebaka")
    print("=" * 70)
    print()
    
    # Termes de recherche pour le ramirebaka/anana malgache
    search_terms = [
        "Amaranthus dubius",      # Ramirebaka scientifique
        "Amaranthus viridis",     # Amarante verte
        "Amaranthus tricolor",    # Amarante tricolore
        "Amaranth greens",        # Feuilles d'amarante
        "Ramirebaka Madagascar",  # Nom malgache
        "Amaranth leaves",        # Feuilles comestibles
    ]
    
    filename = "anana"
    
    for term in search_terms:
        print(f"🔍 Recherche: {term}")
        
        # Essayer Wikipedia EN
        url = get_wikipedia_image(term, 'en')
        if url:
            print(f"  📖 Trouvé sur Wikipedia EN")
            if download_image(url, filename):
                print()
                print("✅ Image Anana/Ramirebaka téléchargée avec succès!")
                return
        
        # Essayer Wikimedia Commons
        url = get_wikimedia_image(term)
        if url:
            print(f"  📖 Trouvé sur Wikimedia Commons")
            if download_image(url, filename):
                print()
                print("✅ Image Anana/Ramirebaka téléchargée avec succès!")
                return
    
    print()
    print("❌ Aucune image trouvée")
    print("💡 Essayez manuellement sur:")
    print("   - https://commons.wikimedia.org/wiki/Amaranthus_dubius")
    print("   - https://commons.wikimedia.org/wiki/Amaranthus_viridis")

if __name__ == "__main__":
    main()
