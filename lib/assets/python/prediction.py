import sys
import random
a = sys.argv[1]
b=1
a = int(a)
if a==3:
	b = 3.0
else:
	b = 5.0
b = b+random.random()+random.randint(1,2)

print b