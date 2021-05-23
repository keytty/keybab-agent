package keybab

# numbers
n0 = "0"

n1 = "1"

n2 = "2"

n3 = "3"

n4 = "4"

n5 = "5"

n6 = "6"

n7 = "7"

n8 = "8"

n9 = "9"

c = "c" # center

h = "h" # h meaning left

j = "j" # j meaning down

k = "k" # k meaning up

l = "l" # l meaning right

hjkl = [h, j, k, l]

numbers = [n0, n1, n2, n3, n4, n5, n6, n7, n8, n9]

direction_keys = array.concat(hjkl, numbers)

# this might need renaming when it becomes untrue
any_keys = array.concat([c], direction_keys)
