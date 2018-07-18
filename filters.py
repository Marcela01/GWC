from PIL import Image

def load_img(filename):
    #allows program to open file, returns image
    im = Image.open(filename)
    return im

def show_img(im):
    im.show()

def save_img(im, filename):
    im.save(filename, "jpeg")
    show_img(im)

def obamicon(im):
    #load the pixel data from im.
    pixels = im.getdata()
    #create a list to hold the new image pixel data
    new_pixels = []

    #define color constants to use for recoloring
    DarkBlue = (0, 51, 76)
    Red = (217, 26, 33)
    LightBlue = (112, 150, 158)
    Yellow = (252, 227, 166)

    for p in pixels:
        #pixel intensity = R value + G value + B value
        intensity = p[0] + p[1] + p[2]

        if intensity < 182:
            new_pixels.append(DarkBlue)

        elif intensity >= 182 and intensity < 364:
            new_pixels.append(Red)

        elif intensity >= 364 and intensity < 546:
            new_pixels.append(LightBlue)

        elif intensity >= 546:
            new_pixels.append(Yellow)

    newim = Image.new("RGB", im.size)
    newim.putdata(new_pixels)
    return newim
