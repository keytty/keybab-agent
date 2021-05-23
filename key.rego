package key

# default allowed_after = [] # this doesn't work, but you can get all by `allowed_after[_]`
default b_after_a = false

hjkl = ["h", "j", "k", "l"]

numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

direction_keys = array.concat(hjkl, numbers)

# this might need renaming when it becomes untrue
any_keys = array.concat(["c"], direction_keys)

allowed_after[before] = any_keys {
	before := null
}

allowed_after[before] = direction_keys {
	before := "c"
}

allowed_after[before] = direction_keys {
	before := direction_keys[_]
}

test_allowed_after {
	r0 := allowed_after[_]
	count(r0) > 0

	r1 := allowed_after[null]
	r1[_] == "c"

	r2 := allowed_after.c
	r2[_] != "c"
	r2[_] == "h"

	r3 := allowed_after.j
	r3[_] != "c"
	r3[_] == "k"
	r3[_] == "1"
}

b_after_a {
	input.a
	input.b
	input.b == allowed_after[input.a][_]
}

test_b_after_a {
	r0 := b_after_a with input as {}
	r0 == false

	r1 := b_after_a with input as {"a": null, "b": "c"}
	r1 == true

	r2 := b_after_a with input as {"a": "j", "b": "c"}
	r2 == false

	r3 := b_after_a with input as {"a": "j", "b": "k"}
	r3 == true
}
