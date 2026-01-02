#!/usr/bin/env python3
"""
Télécharge les images manquantes pour les légumes malgaches
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
    except Exception as e:
        return None

def search_wikimedia_commons(search_query):
    """Recherche sur Wikimedia Commons"""
    try:
        query_encoded = urllib.parse.quote(search_query)
        api_url = f"https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch={query_encoded}&srnamespace=6&format=json&srlimit=3"
        
        req = urllib.request.Request(api_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode())
        
        results = data.get('query', {}).get('search', [])
        for result in results:
            title = result.get('title', '')
            if title.startswith('File:'):
                img_url = get_commons_image_url(title)
                if img_url:
                    return img_url
        return None
    except Exception as e:
        return None

def get_commons_image_url(file_title):
    """Récupère l'URL d'un fichier Commons"""
    try:
        title_encoded = urllib.parse.quote(file_title)
        api_url = f"https://commons.wikimedia.org/w/api.php?action=query&titles={title_encoded}&prop=imageinfo&iiprop=url&iiurlwidth=800&format=json"
        
        req = urllib.request.Request(api_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode())
        
        pages = data.get('query', {}).get('pages', {})
        for page_data in pages.values():
            imageinfo = page_data.get('imageinfo', [])
            if imageinfo:
                return imageinfo[0].get('thumburl') or imageinfo[0].get('url')
        return None
    except Exception as e:
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
        print(f"  ✅ {filename}.jpg ({size_kb:.1f} KB)")
        return True
    except Exception as e:
        print(f"  ❌ Erreur: {e}")
        return False

def find_and_download(crop_name, search_terms, filename):
    """Cherche et télécharge une image"""
    print(f"\n🔍 {crop_name}:")
    
    for term, lang in search_terms:
        url = get_wikipedia_image(term, lang)
        if url:
            print(f"  📖 Wikipedia {lang.upper()}: {term}")
            if download_image(url, filename):
                return True
            time.sleep(0.5)
    
    # Essayer Wikimedia Commons
    for term, _ in search_terms[:3]:  # Premiers termes seulement
        url = search_wikimedia_commons(term)
        if url:
            print(f"  📖 Commons: {term}")
            if download_image(url, filename):
                return True
            time.sleep(0.5)
    
    print(f"  ⚠️ Non trouvé")
    return False

def main():
    print("=" * 70)
    print("🌿 Téléchargement des images manquantes")
    print("=" * 70)
    
    crops = [
        ("Angivy malgache vert", [
            ("Solanum aethiopicum gilo", "en"),
            ("Solanum aethiopicum green", "en"),
            ("African eggplant green", "en"),
            ("Aubergine africaine verte", "fr"),
        ], "angivy"),
        
        ("Betterave", [
            ("Beetroot", "en"),
            ("Beta vulgaris", "en"),
            ("Betterave", "fr"),
            ("Red beet", "en"),
        ], "betterave"),
        
        ("Baranjely (navet)", [
            ("Turnip", "en"),
            ("Brassica rapa", "en"),
            ("Navet", "fr"),
            ("White turnip", "en"),
        ], "baranjely"),
        
        ("Chou-fleur", [
            ("Cauliflower", "en"),
            ("Brassica oleracea botrytis", "en"),
            ("Chou-fleur", "fr"),
        ], "chou_fleur"),
        
        ("Consoude", [
            ("Comfrey", "en"),
            ("Symphytum officinale", "en"),
            ("Consoude", "fr"),
        ], "consoude"),
        
        ("Karoty (carotte)", [
            ("Carrot", "en"),
            ("Daucus carota", "en"),
            ("Carotte", "fr"),
        ], "karoty"),
        
        ("Haricots grains", [
            ("Common bean", "en"),
            ("Phaseolus vulgaris", "en"),
            ("Haricot commun", "fr"),
            ("Dry beans", "en"),
        ], "haricots_grains"),
    ]
    
    success = 0
    failed = 0
    
    for crop_name, search_terms, filename in crops:
        if find_and_download(crop_name, search_terms, filename):
            success += 1
        else:
            failed += 1
        time.sleep(1)  # Pause entre images
    
    print("\n" + "=" * 70)
    print(f"✅ Réussi: {success}")
    print(f"❌ Échoué: {failed}")
    print("=" * 70)

if __name__ == "__main__":
    main()
