from PIL import Image, ImageDraw, ImageFont
import os
import math

# Créer une icône 1024x1024 pour l'application Tantsaha
size = 1024
img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
draw = ImageDraw.Draw(img)

# === FOND AVEC DÉGRADÉ CIRCULAIRE ===
# Cercle principal vert foncé
draw.ellipse([0, 0, size, size], fill=(27, 94, 32, 255))

# Cercle intérieur avec effet de lumière
for i in range(15, 0, -1):
    alpha = 255
    green_val = 94 + (i * 4)
    margin = i * 8
    draw.ellipse([margin, margin, size - margin, size - margin], 
                 fill=(27 + i*2, min(green_val, 160), 32 + i*2, alpha))

# === GRANDE LETTRE "T" STYLISÉE ===
# La lettre T représente Tantsaha
t_color = (255, 255, 255, 255)
t_shadow = (0, 50, 0, 100)

# Ombre du T
shadow_offset = 8
# Barre horizontale du T (ombre)
draw.rounded_rectangle([200 + shadow_offset, 180 + shadow_offset, 824 + shadow_offset, 280 + shadow_offset], 
                       radius=25, fill=t_shadow)
# Barre verticale du T (ombre)
draw.rounded_rectangle([432 + shadow_offset, 250 + shadow_offset, 592 + shadow_offset, 700 + shadow_offset], 
                       radius=25, fill=t_shadow)

# Barre horizontale du T
draw.rounded_rectangle([200, 180, 824, 280], radius=25, fill=t_color)
# Barre verticale du T
draw.rounded_rectangle([432, 250, 592, 700], radius=25, fill=t_color)

# === FEUILLE/PLANTE sur le T ===
# Feuille gauche (courbée)
leaf_green = (76, 175, 80, 255)
leaf_dark = (56, 142, 60, 255)

# Feuille 1 - à gauche du T
leaf1_points = [
    (380, 380),
    (280, 320),
    (240, 280),
    (260, 340),
    (320, 400),
    (380, 420),
]
draw.polygon(leaf1_points, fill=leaf_green)

# Feuille 2 - à droite du T  
leaf2_points = [
    (644, 380),
    (744, 320),
    (784, 280),
    (764, 340),
    (704, 400),
    (644, 420),
]
draw.polygon(leaf2_points, fill=leaf_green)

# Tige qui monte du T
draw.ellipse([490, 160, 534, 200], fill=leaf_dark)

# Petite feuille en haut
top_leaf = [
    (512, 130),
    (470, 170),
    (512, 160),
    (554, 170),
]
draw.polygon(top_leaf, fill=leaf_green)

# === POULET STYLISÉ (en bas à gauche) ===
cx, cy = 280, 800

# Corps du poulet (ovale orange)
draw.ellipse([cx-70, cy-50, cx+70, cy+50], fill=(255, 152, 0, 255))

# Tête
draw.ellipse([cx+40, cy-60, cx+100, cy], fill=(255, 167, 38, 255))

# Crête rouge
crest = [(cx+60, cy-60), (cx+70, cy-90), (cx+80, cy-55), (cx+90, cy-85), (cx+95, cy-50)]
draw.polygon(crest, fill=(229, 57, 53, 255))

# Bec
beak = [(cx+95, cy-35), (cx+125, cy-25), (cx+95, cy-20)]
draw.polygon(beak, fill=(255, 193, 7, 255))

# Oeil
draw.ellipse([cx+65, cy-45, cx+80, cy-30], fill=(33, 33, 33, 255))
draw.ellipse([cx+70, cy-42, cx+76, cy-36], fill=(255, 255, 255, 255))

# Pattes
draw.line([(cx-20, cy+50), (cx-30, cy+80)], fill=(255, 152, 0, 255), width=8)
draw.line([(cx+20, cy+50), (cx+30, cy+80)], fill=(255, 152, 0, 255), width=8)

# === COCHON STYLISÉ (en bas à droite) ===
px, py = 744, 800

# Corps du cochon (ovale rose)
draw.ellipse([px-70, py-45, px+70, py+45], fill=(236, 64, 122, 255))

# Tête
draw.ellipse([px-100, py-50, px-20, py+20], fill=(240, 98, 146, 255))

# Oreilles
ear1 = [(px-90, py-50), (px-110, py-85), (px-70, py-60)]
ear2 = [(px-50, py-50), (px-40, py-85), (px-30, py-55)]
draw.polygon(ear1, fill=(236, 64, 122, 255))
draw.polygon(ear2, fill=(236, 64, 122, 255))

# Museau (ovale rose clair)
draw.ellipse([px-120, py-25, px-70, py+15], fill=(252, 228, 236, 255))

# Narines
draw.ellipse([px-110, py-12, px-100, py+2], fill=(233, 30, 99, 255))
draw.ellipse([px-90, py-12, px-80, py+2], fill=(233, 30, 99, 255))

# Oeil
draw.ellipse([px-70, py-40, px-55, py-25], fill=(33, 33, 33, 255))
draw.ellipse([px-66, py-36, px-60, py-30], fill=(255, 255, 255, 255))

# Queue en tire-bouchon
draw.arc([px+50, py-20, px+90, py+20], start=0, end=270, fill=(236, 64, 122, 255), width=8)

# === BORDURE ÉLÉGANTE ===
draw.ellipse([10, 10, size-10, size-10], outline=(255, 255, 255, 200), width=12)
draw.ellipse([30, 30, size-30, size-30], outline=(200, 230, 201, 100), width=4)

# Sauvegarder l'icône principale
img.save('assets/icon.png')
print("Icône principale créée: assets/icon.png (1024x1024)")

# Créer les versions pour Android (différentes tailles)
sizes_android = {
    'mdpi': 48,
    'hdpi': 72,
    'xhdpi': 96,
    'xxhdpi': 144,
    'xxxhdpi': 192
}

for density, s in sizes_android.items():
    resized = img.resize((s, s), Image.LANCZOS)
    folder = f'android/app/src/main/res/mipmap-{density}'
    os.makedirs(folder, exist_ok=True)
    resized.save(f'{folder}/ic_launcher.png')
    print(f"Android: {folder}/ic_launcher.png ({s}x{s})")

# Créer les versions pour iOS
ios_sizes = [20, 29, 40, 58, 60, 76, 80, 87, 120, 152, 167, 180, 1024]
ios_folder = 'ios/Runner/Assets.xcassets/AppIcon.appiconset'
os.makedirs(ios_folder, exist_ok=True)

for s in ios_sizes:
    resized = img.resize((s, s), Image.LANCZOS)
    resized.save(f'{ios_folder}/Icon-App-{s}x{s}.png')
    print(f"iOS: Icon-App-{s}x{s}.png")

print("\n✅ Toutes les icônes ont été générées avec succès!")
