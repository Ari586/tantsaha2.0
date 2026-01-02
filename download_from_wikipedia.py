#!/usr/bin/env python3
"""
Script pour télécharger des images de plantes depuis Wikipedia/Wikimedia Commons
Les images Wikipedia sont précises et libres de droits
"""

import os
import urllib.request
import urllib.parse
import json
import time

def get_wikipedia_image(search_term, lang='en'):
    """Récupère l'URL d'une image depuis Wikipedia"""
    try:
        # API Wikipedia pour obtenir l'image principale d'un article
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
        print(f"  ⚠️  Erreur API Wikipedia: {e}")
        return None

def get_wikimedia_image(search_term):
    """Récupère une image depuis Wikimedia Commons directement"""
    try:
        # Recherche sur Wikimedia Commons
        search_encoded = urllib.parse.quote(search_term)
        api_url = f"https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch={search_encoded}&srnamespace=6&format=json&srlimit=1"
        
        req = urllib.request.Request(api_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode())
        
        results = data.get('query', {}).get('search', [])
        if results:
            # Obtenir l'URL de l'image
            filename = results[0]['title'].replace('File:', '')
            filename_encoded = urllib.parse.quote(filename)
            
            # API pour obtenir l'URL de l'image
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
        print(f"  ⚠️  Erreur Wikimedia Commons: {e}")
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
        print(f"  ✅ {filename}.jpg téléchargé ({size_kb:.1f} KB)")
        return True
    except Exception as e:
        print(f"  ❌ Erreur téléchargement: {e}")
        return False

# Configuration: nom du fichier → termes de recherche (priorité)
CROPS_SEARCH_TERMS = {
    # CÉRÉALES
    "vary_fohy": ["Upland rice", "Oryza sativa", "Rice plant"],
    "vary_anaty_rano": ["Paddy field", "Irrigated rice", "Rice paddy"],
    "katsaka": ["Maize", "Zea mays", "Corn plant"],
    "ble": ["Wheat", "Triticum aestivum"],
    "orge": ["Barley", "Hordeum vulgare"],
    "avoine": ["Oat", "Avena sativa"],
    "ray_grass": ["Ryegrass", "Lolium perenne"],
    
    # TUBERCULES
    "vomanga": ["Sweet potato", "Ipomoea batatas"],
    "ovy": ["Potato", "Solanum tuberosum"],
    "mangahazo": ["Cassava", "Manihot esculenta", "Manioc"],
    "sakamalao": ["Ginger", "Zingiber officinale"],
    "saonjo": ["Taro", "Colocasia esculenta"],
    
    # LÉGUMES FEUILLES
    "anamalaho": ["Spilanthes oleracea", "Acmella oleracea", "Paracress"],
    "anana": ["Mustard greens", "Brassica juncea"],
    "anatsonga": ["Watercress", "Nasturtium officinale"],
    "bredes_mafana": ["Spilanthes acmella", "Toothache plant"],
    "epinard": ["Spinach", "Spinacia oleracea"],
    "salady": ["Lettuce", "Lactuca sativa"],
    "petsay": ["Napa cabbage", "Chinese cabbage"],
    "persil": ["Parsley", "Petroselinum crispum"],
    
    # CHOUX
    "brocoli": ["Broccoli", "Brassica oleracea italica"],
    "choux_fleur": ["Cauliflower", "Brassica oleracea botrytis"],
    "chou_chinois": ["Chinese cabbage", "Brassica rapa pekinensis"],
    
    # LÉGUMINEUSES
    "lentille": ["Lentil", "Lens culinaris"],
    "pois_chiche": ["Chickpea", "Cicer arietinum"],
    "petit_pois": ["Pea", "Pisum sativum"],
    "voanjobory": ["Bambara groundnut", "Vigna subterranea"],
    "anambongo": ["Green bean", "Phaseolus vulgaris"],
    
    # FRUITS
    "papaye": ["Papaya", "Carica papaya"],
    "voatabia_lava": ["Tomato", "Solanum lycopersicum"],
    "voatabia_boribory": ["Tomato plant", "Solanum lycopersicum"],
    "sakay": ["Chili pepper", "Capsicum annuum"],
    "sakay_pilokely": ["Bird's eye chili", "Capsicum frutescens"],
    "poivron_doux": ["Bell pepper", "Capsicum annuum"],
    "concombre": ["Cucumber", "Cucumis sativus"],
    "melon": ["Melon", "Cucumis melo"],
    "pasteque": ["Watermelon", "Citrullus lanatus"],
    
    # RACINES
    "radis": ["Radish", "Raphanus sativus"],
    "navet": ["Turnip", "Brassica rapa"],
    "karaoty": ["Carrot", "Daucus carota"],
    "betterave_rouge": ["Beetroot", "Beta vulgaris"],
    
    # FOURRAGÈRES
    "luzerne": ["Alfalfa", "Medicago sativa"],
    "consoude": ["Comfrey", "Symphytum officinale"],
}

def main():
    print("=" * 80)
    print("📚 Téléchargement des images depuis Wikipedia/Wikimedia Commons")
    print("=" * 80)
    print()
    print("Les images Wikipedia sont:")
    print("  ✓ Précises (photos scientifiques)")
    print("  ✓ Libres de droits (domaine public ou CC)")
    print("  ✓ Haute qualité")
    print()
    
    success = 0
    failed = 0
    total = len(CROPS_SEARCH_TERMS)
    
    for idx, (filename, search_terms) in enumerate(CROPS_SEARCH_TERMS.items(), 1):
        print(f"[{idx}/{total}] {filename}")
        print(f"  🔍 Recherche: {', '.join(search_terms)}")
        
        image_url = None
        
        # Essayer chaque terme de recherche
        for term in search_terms:
            # Essayer Wikipedia EN
            image_url = get_wikipedia_image(term, 'en')
            if image_url:
                print(f"  📖 Trouvé sur Wikipedia EN: {term}")
                break
            
            # Essayer Wikipedia FR
            if term in search_terms[:2]:  # Seulement pour les 2 premiers termes
                image_url = get_wikipedia_image(term, 'fr')
                if image_url:
                    print(f"  📖 Trouvé sur Wikipedia FR: {term}")
                    break
            
            # Essayer Wikimedia Commons
            image_url = get_wikimedia_image(term)
            if image_url:
                print(f"  📖 Trouvé sur Wikimedia Commons: {term}")
                break
        
        if image_url:
            if download_image(image_url, filename):
                success += 1
            else:
                failed += 1
        else:
            print(f"  ❌ Aucune image trouvée")
            failed += 1
        
        print()
        time.sleep(1)  # Pause pour ne pas surcharger l'API
    
    print("=" * 80)
    print(f"✅ Terminé! {success} réussies, ❌ {failed} échouées")
    print("=" * 80)
    print()
    
    # Compter le total
    voly_dir = "assets/voly"
    if os.path.exists(voly_dir):
        total_images = len([f for f in os.listdir(voly_dir) if f.endswith('.jpg')])
        print(f"📊 Total d'images dans assets/voly/: {total_images}")
    
    print()
    print("💡 Prochaine étape:")
    print("   1. Exécutez: flutter pub get")
    print("   2. Hot reload l'application")
    print("   3. Vérifiez que les images correspondent bien aux plantes")

if __name__ == "__main__":
    main()
