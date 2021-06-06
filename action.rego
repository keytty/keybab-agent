package keybab

action[key] = result {
	key := c
	result := {"type": "center"}
}

test_action {
	action[c] == {"type": "center"}
}

type_move(x, y) = {
	"type": "move",
	"x": x,
	"y": y,
}

action_move(n, d) = result {
	d == j
	y := n * -1
	x := 0

	result := type_move(x, y)
}

action_move(n, d) = result {
	d == k
	y := n * 1
	x := 0

	result := type_move(x, y)
}

action_move(n, d) = result {
	d == h
	x := n * -1
	y := 0

	result := type_move(x, y)
}

action_move(n, d) = result {
	d == l
	x := n * 1
	y := 0

	result := type_move(x, y)
}

test_action_move {
	action_move(1, j) == {"type": "move", "x": 0, "y": -1}
	action_move(20, k) == {"type": "move", "x": 0, "y": 20}
	action_move(300, h) == {"type": "move", "x": -300, "y": 0}
	action_move(4000, l) == {"type": "move", "x": 4000, "y": 0}
}

group_action(ng, d) = result {
	n := group_to_number(ng)
	result := action_move(n, d)
}

test_group_action {
	group_action([n1], k) == action_move(1, k)
	group_action([n5, n9, n2], h) == action_move(592, h)
}

merge_action(a1, a2) = result {
	a1.type == "move"
	a2.type == "move"

	x := a1.x + a2.x
	y := a1.y + a2.y
	result := type_move(x, y)
}

test_merge_action {
	action_move(19, k) == merge_action(action_move(1, j), action_move(20, k))

	action_move(3700, l) == merge_action(action_move(300, h), action_move(4000, l))

	{"type": "move", "x": 3700, "y": 19} == merge_action(action_move(19, k), action_move(3700, l))
}
