from PIL import Image
import os

images = [
    'assets/images/royale.png',
    'assets/images/commune.png',
    'assets/images/chinoise.png'
]

for img_path in images:
    if os.path.exists(img_path):
        try:
            with Image.open(img_path) as img:
                # Resize to max 800px width/height, maintaining aspect ratio
                img.thumbnail((800, 800))
                img.save(img_path, optimize=True, quality=85)
                print(f"Resized {img_path}")
        except Exception as e:
            print(f"Error resizing {img_path}: {e}")
    else:
        print(f"File not found: {img_path}")
