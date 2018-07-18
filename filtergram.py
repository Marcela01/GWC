import filters

def main():
    filename = input("Enter filename: ")

    img = filters.load_img(filename)

    newimg = filters.obamicon(img)


    #Save the final image
    filters.save_img(newimg, "recolored.jpg")

main()
