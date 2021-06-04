.PHONY: test
test: fmt
	opa test . -v

run: fmt
	opa run .

fmt:
	opa fmt . -w
