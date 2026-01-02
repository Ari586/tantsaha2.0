#!/usr/bin/env python3
"""
Script interactif pour améliorer les images spécifiques
Permet de tester différentes URLs Unsplash
"""

import os
import urllib.request

def download_image(url, filename, output_dir="assets/voly"):
    """Télécharge une image depuis une URL"""
    try:
        os.makedirs(output_dir, exist_ok=True)
        filepath = os.path.join(output_dir, f"{filename}.jpg")
        
        print(f"\n⏳ Téléchargement de {filename}...")
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
    print("🔧 Outil d'amélioration manuelle des images")
    print("=" * 70)
    print()
    print("Instructions:")
    print("1. Allez sur https://unsplash.com")
    print("2. Recherchez votre image (ex: 'ginger root', 'pili-pili pepper')")
    print("3. Clic droit sur l'image → 'Copier l'adresse de l'image'")
    print("4. Collez l'URL ci-dessous")
    print()
    
    # Images à améliorer prioritaires
    to_improve = {
        "1": ("sakamalao", "gingembre / ginger root"),
        "2": ("navet", "navet blanc / white turnip"),
        "3": ("persil", "persil / parsley"),
        "4": ("sakay_pilokely", "pili-pili / bird's eye chili"),
        "5": ("pasteque", "pastèque rouge / watermelon"),
    }
    
    print("Images à améliorer:")
    for key, (filename, description) in to_improve.items():
        print(f"  {key}. {filename}.jpg - Chercher: '{description}'")
    print("  0. Autre image (personnalisé)")
    print("  q. Quitter")
    print()
    
    while True:
        choice = input("Choisissez une image (1-5, 0 pour autre, q pour quitter): ").strip()
        
        if choice.lower() == 'q':
            print("\n👋 Au revoir!")
            break
        
        if choice == '0':
            filename = input("Nom du fichier (sans .jpg): ").strip()
            description = input("Description (optionnel): ").strip()
        elif choice in to_improve:
            filename, description = to_improve[choice]
            print(f"\n📸 Image sélectionnée: {filename}")
            print(f"🔍 Rechercher sur Unsplash: '{description}'")
        else:
            print("❌ Choix invalide")
            continue
        
        print()
        url = input("Collez l'URL de l'image Unsplash (ou 'b' pour retour): ").strip()
        
        if url.lower() == 'b':
            continue
        
        if not url.startswith('http'):
            print("❌ URL invalide (doit commencer par http)")
            continue
        
        # Ajouter ?w=800 si pas déjà présent
        if '?' not in url:
            url += '?w=800'
        elif 'w=' not in url:
            url += '&w=800'
        
        success = download_image(url, filename)
        
        if success:
            print(f"✅ Image {filename}.jpg mise à jour avec succès!")
            print("💡 Vous pouvez faire 'flutter pub get' et hot reload l'app")
        
        print()
        cont = input("Continuer? (o/n): ").strip().lower()
        if cont != 'o':
            print("\n👋 Terminé!")
            break
    
    # Compter le total
    voly_dir = "assets/voly"
    if os.path.exists(voly_dir):
        total_images = len([f for f in os.listdir(voly_dir) if f.endswith('.jpg')])
        print(f"\n📊 Total d'images: {total_images}")

if __name__ == "__main__":
    main()
