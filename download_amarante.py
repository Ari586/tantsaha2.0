#!/usr/bin/env python3
"""
Télécharge l'image de l'amarante queue-de-renard
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

def search_wikimedia_commons(search_query):
    """Recherche sur Wikimedia Commons"""
    try:
        query_encoded = urllib.parse.quote(search_query)
        api_url = f"https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch={query_encoded}&srnamespace=6&format=json&srlimit=5"
        
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
        print(f"Erreur Commons: {e}")
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
    print("🌾 Téléchargement de l'image Amarante Queue-de-Renard")
    print("=" * 70)
    print()
    
    # Termes de recherche
    search_terms = [
        ("Amaranthus caudatus", "en"),
        ("Love-lies-bleeding", "en"),
        ("Amarante queue de renard", "fr"),
        ("Kiwicha", "en"),
    ]
    
    commons_searches = [
        "Amaranthus caudatus",
        "Love lies bleeding amaranth",
        "Amaranth grain",
    ]
    
    filename = "amarante_queue_de_renard"
    
    # Essayer Wikipedia
    for term, lang in search_terms:
        print(f"🔍 Wikipedia {lang.upper()}: {term}")
        url = get_wikipedia_image(term, lang)
        if url:
            print(f"  📖 Trouvé!")
            if download_image(url, filename):
                print()
                print("✅ Image Amarante Queue-de-Renard téléchargée!")
                return
    
    print()
    print("🔍 Recherche sur Wikimedia Commons...")
    
    # Essayer Commons
    for query in commons_searches:
        print(f"  🔎 {query}")
        url = search_wikimedia_commons(query)
        if url:
            print(f"  📖 Trouvé!")
            if download_image(url, filename):
                print()
                print("✅ Image Amarante Queue-de-Renard téléchargée!")
                return
    
    print()
    print("❌ Aucune image trouvée")

if __name__ == "__main__":
    main()
