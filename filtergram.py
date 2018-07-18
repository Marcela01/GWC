import filters

def main():
    # Ask what image the user wants to edit
    filename = input("Enter filename: ")

    #Load the image from the specified file
    img = filters.load_img(filename)

    #Apply Filters
    newimg = filters.obamicon(img)

    #Save the final image
    filters.save_img(img, "recolored.jpg")

main()
