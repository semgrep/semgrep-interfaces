# Run all the tests present in this folder
.PHONY: test
test:
	./test-ast
	$(MAKE) -C jsonschema test

.PHONY: clean
clean:
	rm -f data/*.ast.json
