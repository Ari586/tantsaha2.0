#!/usr/bin/env python3
"""
Script pour télécharger des images de cultures depuis Unsplash
Utilise urllib (module standard Python - pas besoin d'installation)
"""

import os
import urllib.request
import time

# URLs directes d'images libres depuis Unsplash
CROP_IMAGES = {
    # Céréales
    "vary_fohy": "https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?w=800",  # rice field
    "vary_anaty_rano": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=800",  # rice paddy
    "katsaka": "https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=800",  # corn
    "ble": "https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=800",  # wheat
    "orge": "https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=800",  # barley
    "avoine": "https://images.unsplash.com/photo-1607672632458-9b3c8b6f0b36?w=800",  # oats
    
    # Tubercules
    "vomanga": "https://images.unsplash.com/photo-1589927986089-35812388d1f4?w=800",  # sweet potato
    "ovy": "https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800",  # potato
    "mangahazo": "https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=800",  # cassava
    "sakamalao": "https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=800",  # ginger
    
    # Légumes feuilles
    "anamalaho": "https://images.unsplash.com/photo-1622205313162-be1d5712a43f?w=800",  # leafy greens
    "anana": "https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?w=800",  # greens
    "epinard": "https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=800",  # spinach
    "salady": "https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=800",  # lettuce
    "petsay": "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=800",  # cabbage
    
    # Choux
    "brocoli": "https://images.unsplash.com/photo-1584270354949-c26b0d5b4a0c?w=800",  # broccoli
    "choux_fleur": "https://images.unsplash.com/photo-1568584711271-563a0c6c76cd?w=800",  # cauliflower
    "chou_chinois": "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=800",  # chinese cabbage
    
    # Légumineuses
    "lentille": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",  # lentils
    "pois_chiche": "https://images.unsplash.com/photo-1611057434091-7e0e4ffd5058?w=800",  # chickpeas
    "petit_pois": "https://images.unsplash.com/photo-1587735243615-c03f25aaff15?w=800",  # peas
    "anambongo": "https://images.unsplash.com/photo-1628773896167-ef9cd9d5ff8d?w=800",  # green beans
    
    # Fruits et légumes
    "papaye": "https://images.unsplash.com/photo-1617112848923-cc2234396a8d?w=800",  # papaya
    "voatabia_lava": "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=800",  # tomato
    "voatabia_boribory": "https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=800",  # round tomato
    "sakay": "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=800",  # chili pepper
    "sakay_pilokely": "https://images.unsplash.com/photo-1564239401697-5fabd4093fb3?w=800",  # hot pepper
    "poivron_doux": "https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=800",  # bell pepper
    "concombre": "https://images.unsplash.com/photo-1604977042946-1eecc30f269e?w=800",  # cucumber
    "melon": "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=800",  # melon
    "pasteque": "https://images.unsplash.com/photo-1587049352846-4a222e784fbb?w=800",  # watermelon
    
    # Légumes racines
    "radis": "https://images.unsplash.com/photo-1610348725531-843dff563e2c?w=800",  # radish
    "navet": "https://images.unsplash.com/photo-1597611111295-d1155c8fb696?w=800",  # turnip
    "karaoty": "https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=800",  # carrot
    "betterave_rouge": "https://images.unsplash.com/photo-1604093299216-f4c27c2aa7d1?w=800",  # beet
    
    # Herbes
    "persil": "https://images.unsplash.com/photo-1627043692337-6592994440e7?w=800",  # parsley
    
    # Fourragères
    "luzerne": "https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=800",  # alfalfa
    "consoude": "https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=800",  # comfrey
    "ray_grass": "https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800",  # grass
}

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image depuis une URL"""
    try:
        # Créer le dossier si nécessaire
        os.makedirs(output_dir, exist_ok=True)
        
        # Chemin complet
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
        # Vérifier si le fichier existe déjà
        if os.path.exists(filepath):
            print(f"✓ {filename}.jpg existe déjà")
            return True
        
        # Télécharger
        print(f"Téléchargement de {filename}...")
        
        # User agent pour éviter les blocages
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        
        with urllib.request.urlopen(req, timeout=15) as response:
            data = response.read()
        
        # Sauvegarder
        with open(filepath, 'wb') as f:
            f.write(data)
        
        print(f"✓ {filename}.jpg téléchargé")
        return True
        
    except Exception as e:
        print(f"✗ Erreur pour {filename}: {e}")
        return False

def main():
    print("=" * 60)
    print("Téléchargement des images de cultures")
    print("=" * 60)
    print()
    
    success = 0
    failed = 0
    
    for crop_name, url in CROP_IMAGES.items():
        if download_image(url, crop_name):
            success += 1
        else:
            failed += 1
        
        # Pause pour ne pas surcharger le serveur
        time.sleep(0.5)
    
    print()
    print("=" * 60)
    print(f"Terminé! ✓ {success} réussies, ✗ {failed} échouées")
    print("=" * 60)
    print()
    print("Les images sont dans le dossier: assets/voly/")
    print("Vous pouvez maintenant exécuter 'flutter pub get' et relancer l'app")

if __name__ == "__main__":
    main()
