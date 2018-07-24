def Survey():
    dictAnswers={}
    fobj = open("Answers.txt","w")
    name = input("What's your name?")
    dictAnswers['name']=name
    fobj.write("name=%s\n",%name)
    dob = input("Whats your birthday?")
    dictAnswers['dob']=dob
    fobj.write("dob=%s\n",%dob)
    age = input("How old are you?")
    dictAnswers['age']=age
    fobj.write("age=%s\n",%age)
    city = input("What city do you live in?")
    dictAnswers['city']=city
    fobj.write("city=%s\n",%city)
    transport = input("What form of transportation do you use most often?")
    dictAnswers['transport']=transport
    fobj.write("transport=%s\n",%transport)
    music = input("What's your favorite type of music?")
    dictAnswers['music']=music
    fobj.write("music=%s\n",%music)
    print("Answers:",dictAnswers)
    fobj.close()
Survey()
