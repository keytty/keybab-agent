package keybab

import data.collection
import data.power

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

key_to_num = {
	n0: 0,
	n1: 1,
	n2: 2,
	n3: 3,
	n4: 4,
	n5: 5,
	n6: 6,
	n7: 7,
	n8: 8,
	n9: 9,
}

to_number(n_k) = key_to_num[n_k]

test_to_number {
	to_number(n1) == 1
	to_number(n2) == 2
	key_to_num[n5] == 5
}

map_key_to_num[x] = val {
	col := input.col
	val := key_to_num[col[x]]
}

group_to_number(grp) = number {
	mapped := map_key_to_num with input as {"col": grp}

	mapped_to_numbers := collection.object_to_array(mapped)
	delta := collection.array_reverse(power.power_range(10, count(grp)))

	multiplied := collection.map_each_mul with input as {
		"col": mapped_to_numbers,
		"delta": delta,
	}

	listified := collection.object_to_array(multiplied)

	number := sum(listified)
}

test_group_to_number {
	group_to_number([n1, n2]) == 12
	group_to_number([n3, n4, n9, n5]) == 3495
}
