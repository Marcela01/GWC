answer = 17 #answer the user should guess

question = input("Guess a number")
if (int(question) < 17 ):
  print("Guess higher")
if (int(question) > 17):
    print("Guess Lower")
