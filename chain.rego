package keybab

# default allowed_after = [] # this doesn't work, but you can get all by `allowed_after[_]`
default b_after_a = false

allowed_after[before] = any_keys {
	before := null
}

allowed_after[before] = direction_keys {
	before := c
}

allowed_after[before] = direction_keys {
	before := direction_keys[_]
}

b_after_a {
	input.a
	input.b
	input.b == allowed_after[input.a][_]
}

# tests

test_allowed_after_all {
	r := allowed_after[_]
	count(r) > 0
}

test_allowed_after_null {
	r := allowed_after[null]
	r[_] == c
}

test_allowed_after_c {
	r := allowed_after[c]
	r[_] == direction_keys[_]
	r[_] != c
}

test_allowed_after_j {
	r := allowed_after[j]
	r[_] == direction_keys[_]
	r[_] != c
}

test_b_after_a {
	r0 := b_after_a with input as {}
	r0 == false

	r1 := b_after_a with input as {"a": null, "b": c}
	r1 == true

	r2 := b_after_a with input as {"a": j, "b": c}
	r2 == false

	r3 := b_after_a with input as {"a": j, "b": k}
	r3 == true
}
