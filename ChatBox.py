def Greeting(name):
    print("Hello", name)

def Introduction():
    print("I am a ChatterBox. How can I help you?")

def main():
    while(True):
        name = input("Type Your Name:")
        Greeting(name)

        Introduction()

        choice = input("Press 1 for a Joke, Press 2 for a poem, Press 3 to add three numbers together or Press 4 to exit\n")
        if choice == '1':
            joke()
        elif choice == '2':
            poem()
        elif choice == '3':
            num1 = input("Enter num1:")
            num2 = input("Enter num2:")
            num3 = input("Enter num3:")
            result =sum(int(num1),int(num2),int(num3))
            print ("Sum =", result)
        else:
            print("Bye! See You Next Time!!!")
            exit()

def sum(num1,num2,num3):
    return num1+num2+num3

def joke():
    print("----------Joke--------")
    print("What joke do you want to hear?")
    choice = input("Choose Joke1 or Joke2:")
    if choice == 'joke 1':
        joke1()
    elif choice == 'joke 2':
        joke2()

def joke2():
    print("\n-~-~-~-~-~-~Joke-~-~-~-~-~-~\n")
    print("Knock Knock")
    answer = input()
    print("Adore")
    answer = input()
    print("Adore is between us. Open up!")
    print("\n-~-~-~-~-~-~-~Joke-~-~-~-~-~-~\n")

def joke1():
    print("\n-~-~-~-~-~-~Joke-~-~-~-~-~-~\n")
    print("What do you call a sheep covered in chocolate")
    answer = input()
    print("Candy Baa")
    print("\n-~-~-~-~-~-~-~Joke-~-~-~-~-~-~\n")

def poem():
    print("\n~~~~~~Poem~~~~~~\n")
    print("What kind of poem do you want to hear?")
    choice = input("Press 1 for a inpirational poem or Press 2 for a random one")
    if choice == '1':
        inspirational()
    elif choice == '2':
        random()

def inspirational():
    print("\n----------Poem------------\n")
    print("And even though it's hard")
    print("and I may struggle through it all,")
    print("You may see me struggle...")
    print("But you will NEVER see me fall.")
    print('-Joyce Alcantara')
    print("\n----------Poem------------\n")

def random():
    print("\n----------Poem------------\n")
    print("Dance with the waves,")
    print("move with the sea")
    print("Let the rythm of the water")
    print("set your soul free.")
    print('-Christy Ann Martine')
    print("\n----------Poem------------\n")

main()
