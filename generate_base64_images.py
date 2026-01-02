import base64
from PIL import Image
import io

def get_optimized_base64(path):
    img = Image.open(path)
    img.thumbnail((400, 400))
    if img.mode in ('RGBA', 'P'):
        img = img.convert('RGB')
    buffer = io.BytesIO()
    img.save(buffer, format='JPEG', quality=70, optimize=True)
    return base64.b64encode(buffer.getvalue()).decode('utf-8')

extensif = get_optimized_base64('assets/images/extensif.png')
semiintensif = get_optimized_base64('assets/images/semiintensif.png')
intensif = get_optimized_base64('assets/images/intensif.png')

print('EXTENSIF_START')
print(extensif)
print('EXTENSIF_END')
print('SEMIINTENSIF_START')
print(semiintensif)
print('SEMIINTENSIF_END')
print('INTENSIF_START')
print(intensif)
print('INTENSIF_END')
