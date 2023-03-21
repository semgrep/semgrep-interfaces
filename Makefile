# If you want to modify the .atd, you will need to install via OPAM
# 'atd', 'atdpy', and 'atdts' to regenerate the code. See the setup
# target below.

VER=v1

# Those files are in lowercase because atdpy/atdts seems to
# generate lowercase files, even though the input is capitalized
FILES= \
  semgrep_output_$(VER)_j.ml \
  semgrep_output_$(VER)_j.mli \
  semgrep_output_$(VER).py \
  semgrep_output_$(VER).ts \
  semgrep_output_$(VER).jsonschema \
  ast_generic_$(VER)_j.ml \
  ast_generic_$(VER)_j.mli \

.PHONY: build
build: $(FILES)

# need atdpy >= 2.11.0 to support parametrized types
%.py: %.atd
	atdpy $<

%_j.ml %_j.mli: %.atd
	atdgen -j -j-std $<

# need atdts >= 2.11.0
%.ts: %.atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_output_$(VER).jsonschema: semgrep_output_$(VER).atd
	atdcat -jsonschema cli_output $< > $@

.PHONY: clean
clean:
	rm -f $(FILES)

.PHONY: setup
setup:
	opam install --deps-only .

# The tests require semgrep-core, among other things.
#
.PHONY: test
test:
	$(MAKE) -C tests
