package power

import data.collection

array_length_11 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

identity[n] = result {
	result := array_length_11[n] + n
}

test_identity {
	identity[3] == 3
	identity[10] == 10
	not identity[11] == 11
	not identity[99] == 99
}

slice(x) = array.slice(array_length_11, 0, x)

fill_as_obj(x, n) = r {
	r := collection.map_add with input as {
		"col": slice(n),
		"delta": x,
	}
}

test_fill_as_obj {
	slice(2) == [0, 0]
	fill_as_obj(5, 3)[_] == 5
}

fill(x, n) = collection.object_to_array(fill_as_obj(x, n))

test_fill {
	some i
	fill(10, 3)[i] == 10
	product(fill(10, 3)) == 1000
}

pow(x, n) = 1 {
	n == 0
}

pow(x, n) = product(fill(x, n))

test_power {
	pow(10, 2) == 100
	pow(10, 3) == 1000
	pow(5, 2) == 25

	# n being 11 is the limit because of array_length_11
	pow(2, 11) == 2048
	not pow(2, 12) == 2048 * 2
}

power_table[[x, n]] = p {
	# this line is crucial to make x and n safe
	array_length_11[x] == array_length_11[n]

	p := pow(x, n)
}

test_power_table {
	some i
	power_table[[2, i]] == [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024][i]
}

power_list(x) = [r | r := power_table[[x, _]]]

test_power_list {
	power_list(2) == [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
}

power_range(x, n) = array.slice(power_list(x), 0, n)

test_power_range {
	power_range(2, 5) == [1, 2, 4, 8, 16]
}
