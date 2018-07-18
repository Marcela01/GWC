word = input("enter word")
print(word)
guess_word = []

length_word = len(word)


#print("The word is 6 letters long and you also only have 6 chances to complete the word.")

for letters in word:
    guess_word.append("-")


turns = 0
while turns < 6:
    guess = input("Pick a letter.")

    '''if not guess in alphabet:
        print("Sorry, Pick a letter.")
    elif guess in alphabet:
        print("Already chose that letter.")'''

    if guess in word:
        print("That letter is in the word.")
        for x in range(0, length_word):
            if word[x] == guess:
                guess_word[x] = guess

        if not '-' in guess_word:
            print("Great Job!")
    else:
        print("Try Again")

    if turns == 6:
        print("Sorry, you lost", word)
    print(guess_word)
    turns += 1
print("Game Over")
