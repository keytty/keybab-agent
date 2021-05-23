.PHONY: test
test:
	opa test . -v

run:
	opa run .

fmt:
	opa fmt . -w
