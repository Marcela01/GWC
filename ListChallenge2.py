import random
alist = ['Salad', 'Crackers with Soup', 'Garlic Bread', 'Fries']
blist = ['Pasta', 'Pizza', 'Burger', 'Sandwich']
clist = ['Cake', 'Ice Cream', 'Brownie', 'Cookie']
Meal = random.choice(alist) + ", " + random.choice(blist) + ", " + random.choice(clist)
print(Meal)
