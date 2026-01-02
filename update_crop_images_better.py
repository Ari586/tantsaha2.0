#!/usr/bin/env python3
"""
Script pour télécharger des images précises de cultures malagasy
Recherche avec termes malagasy, français et anglais
"""

import os
import urllib.request
import time

# URLs améliorées avec recherches spécifiques pour cultures malagasy
IMPROVED_CROP_IMAGES = {
    # CÉRÉALES - Recherches précises
    "vary_fohy": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=800",  # upland rice / riz pluvial
    "vary_anaty_rano": "https://images.unsplash.com/photo-1536304929831-cac89f6ade1b?w=800",  # irrigated rice / riz irrigué
    "katsaka": "https://images.unsplash.com/photo-1603570388955-fa70f95cd9ec?w=800",  # maize corn / maïs
    "ble": "https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800",  # wheat / blé
    "orge": "https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=800",  # barley / orge
    "avoine": "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800",  # oats / avoine
    "ray_grass": "https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800",  # ryegrass / ray grass
    
    # TUBERCULES - Images précises
    "vomanga": "https://images.unsplash.com/photo-1589927986089-35812388d1f4?w=800",  # sweet potato / patate douce
    "ovy": "https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800",  # potato / pomme de terre
    "mangahazo": "https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=800",  # cassava / manioc
    "sakamalao": "https://images.unsplash.com/photo-1615485925763-2fe30d11e93f?w=800",  # ginger / gingembre
    "saonjo": "https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=800",  # taro / colocasia
    
    # LÉGUMES FEUILLES MALAGASY - Très spécifique
    "anamalaho": "https://images.unsplash.com/photo-1622205313162-be1d5712a43f?w=800",  # brèdes mafana / leafy greens
    "anana": "https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?w=800",  # mixed greens / feuilles vertes
    "anatsonga": "https://images.unsplash.com/photo-1622205313162-be1d5712a43f?w=800",  # watercress malagasy
    "bredes_mafana": "https://images.unsplash.com/photo-1515363578674-99bc51da3857?w=800",  # spilanthes / brèdes
    "epinard": "https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=800",  # spinach / épinard
    "salady": "https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=800",  # lettuce / salade
    "petsay": "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=800",  # napa cabbage / chou chinois
    "persil": "https://images.unsplash.com/photo-1627043692337-6592994440e7?w=800",  # parsley / persil
    
    # CHOUX - Images précises
    "brocoli": "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=800",  # broccoli
    "choux_fleur": "https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?w=800",  # cauliflower
    "chou_chinois": "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=800",  # chinese cabbage
    
    # LÉGUMINEUSES
    "lentille": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",  # lentils
    "pois_chiche": "https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?w=800",  # chickpeas
    "petit_pois": "https://images.unsplash.com/photo-1587735243615-c03f25aaff15?w=800",  # green peas
    "voanjobory": "https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?w=800",  # bambara groundnut
    "anambongo": "https://images.unsplash.com/photo-1628773896167-ef9cd9d5ff8d?w=800",  # green beans / haricots verts
    
    # FRUITS & LÉGUMES-FRUITS - Précis pour Madagascar
    "papaye": "https://images.unsplash.com/photo-1617112848923-cc2234396a8d?w=800",  # papaya
    "voatabia_lava": "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=800",  # elongated tomato
    "voatabia_boribory": "https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=800",  # round tomato
    "sakay": "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=800",  # hot chili pepper / piment
    "sakay_pilokely": "https://images.unsplash.com/photo-1564239401697-5fabd4093fb3?w=800",  # bird's eye chili / pili-pili
    "poivron_doux": "https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=800",  # sweet bell pepper
    "concombre": "https://images.unsplash.com/photo-1604977042946-1eecc30f269e?w=800",  # cucumber
    "melon": "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=800",  # melon
    "pasteque": "https://images.unsplash.com/photo-1587049352846-4a222e784fbb?w=800",  # watermelon
    
    # LÉGUMES RACINES
    "radis": "https://images.unsplash.com/photo-1610348725531-843dff563e2c?w=800",  # radish
    "navet": "https://images.unsplash.com/photo-1597611111295-d1155c8fb696?w=800",  # turnip
    "karaoty": "https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=800",  # carrot
    "betterave_rouge": "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?w=800",  # red beet
    
    # PLANTES FOURRAGÈRES
    "luzerne": "https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=800",  # alfalfa
    "consoude": "https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=800",  # comfrey
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
        
        # Sauvegarder (écraser l'ancienne image)
        with open(filepath, 'wb') as f:
            f.write(data)
        
        print(f"✓ {filename}.jpg mis à jour")
        return True
        
    except Exception as e:
        print(f"✗ Erreur pour {filename}: {e}")
        return False

def main():
    print("=" * 70)
    print("Mise à jour des images avec recherches améliorées")
    print("Termes: Malagasy + Français + Anglais")
    print("=" * 70)
    print()
    
    success = 0
    failed = 0
    
    for crop_name, url in IMPROVED_CROP_IMAGES.items():
        if download_image(url, crop_name):
            success += 1
        else:
            failed += 1
        time.sleep(0.5)  # Pause pour ne pas surcharger
    
    print()
    print("=" * 70)
    print(f"Terminé! ✓ {success} mises à jour réussies, ✗ {failed} échouées")
    print("=" * 70)
    print()
    print("Images mises à jour dans: assets/voly/")
    print("Exécutez 'flutter pub get' puis hot reload l'app")

if __name__ == "__main__":
    main()
