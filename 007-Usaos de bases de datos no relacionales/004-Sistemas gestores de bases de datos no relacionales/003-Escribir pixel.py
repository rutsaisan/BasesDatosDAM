from PIL import Image

# Abrir imagen original
img = Image.open("dalmata_pequeño.jpg")
pixels = img.load()

# Leer el color del píxel (0,0)
pixel_color = pixels[0, 0]
print(pixel_color)

# Modificar el píxel (0,0) en la imagen original
pixels[0, 0] = (255, 0, 0)

# Guardar la imagen original modificada
img.save("dalmata_modificada.png")
