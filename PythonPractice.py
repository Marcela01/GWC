def main():
    while(True):
        choice = input("Press 1 to Linear Search, 2 to Binary Search, 3 to Bubble Sort, 4 to exit")
        if choice == '1':
            LinearSearch()
        elif choice == '2':
            BinarySearch()
        elif choice == '3':
            BubbleSort()
        else:
            print("Bye!")
            exit()

def LinearSearch():
    1st = []
    num = int(input("Enter size of list: \t"))
    for n in range(num):
        numners = int (input("Enter any number: \t"))
        1st.append(numbers)

    x = int(input("\nEnter number to search: /t"))

    found = False

    for i in range(len(1st)):
        if 1st [i] == x:
            found = True
            print(“\n%d found at position %d” % (x, i))
            break
        if not found:
            print (“\n%d is not in list” % x)


def BinarySearch():
    choice = input("How many elements?")

def BubbleSort():
    choice = input("How many elements?")

main()
