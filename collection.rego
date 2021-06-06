package collection

my_add(x, y) = x + y

map_add[x] = val {
	col := input.col
	delta := input.delta

	val := my_add(col[x], delta)
}

test_map_add {
	3 == my_add(1, 2)

	some i
	mapped := map_add with input as {
		"col": [1, 2, 3, 4],
		"delta": 2,
	}

	[3, 4, 5, 6][i] == mapped[i]
	[8, 4, 7, 6][i] != mapped[i]
}

filter[x] = val {
	col := input.col
	filter_with := input.filter_with
	col[x] != filter_with

	val := col[x]
}

test_filter {
	some i
	filtered := filter with input as {
		"col": [1, null, 2, 3, null, 4],
		"filter_with": null,
	}

	[1, 2, 3, 4][i] == filtered[i]
	[5, 2, 5, 4][i] != filtered[i]
}

test_both {
	some i

	filtered := filter with input as {
		"col": [1, null, 2, 3, null, 4],
		"filter_with": null,
	}

	[1, 2, 3, 4][i] == filtered[i]
	[5, 2, 5, 4][i] != filtered[i]

	mapped := map_add with input as {
		"col": filtered,
		"delta": 2,
	}

	[3, 4, 5, 6][i] == mapped[i]
	[8, 4, 7, 6][i] != mapped[i]
}

map_each_mul[x] = val {
	col := input.col
	delta := input.delta

	val := col[x] * delta[x]
}

test_map_each_mul {
	2 == 1 * 2

	some i
	mapped := map_each_mul with input as {
		"col": [1, 2, 3, 4],
		"delta": [1, 10, 100, 1000],
	}

	[1, 20, 300, 4000][i] == mapped[i]
	[8, 4, 7, 6][i] != mapped[i]
}

object_to_array(obj) = [l[_] | l := obj]

test_object_to_array {
	[0, 1] == object_to_array({
		"0": 0,
		"1": 1,
	})

	[0, 1] == object_to_array({
		"2": 0,
		"4": 1,
	})
}

array_reverse(arr) = [reversed |
	some i

	# this line is crucial to make the whole expression safe
	arr[i]
	revered_i := (count(arr) - i) - 1
	reversed := arr[revered_i]
]

test_array_reverse {
	array_reverse([1, 2]) == [2, 1]
	array_reverse([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
}
