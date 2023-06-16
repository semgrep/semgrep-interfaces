# Run 'make setup' to install the correct versions of the dependencies.
# Run 'make' to regenerate all files.
#
# You must run 'make' after editing an atd file. This will update
# other files that we keep under version control. Naturally, don't edit
# generated files by hand.

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
  Language.ml \
  Language.mli \
  lang.json \
  semgrep_metrics.py

# Regenerate all files.
#
# If someone accidentally touches a generated file, the lazy file regeneration
# based on timestamps won't happen. This is really only a problem because
# we keep the generated files, with their timestamp, in git.
# To avoid such issues, force-build is now the default target.
#
.PHONY: force-build
force-build:
	$(MAKE) clean
	$(MAKE) build

.PHONY: build
build: $(FILES)

# need atdpy >= 2.11.0 to support parametrized types
# need atdpy >= 2.12.0 for semgrep_metric.py
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

# The call to ocamlc is just to typecheck the generated OCaml files
Language.ml Language.mli lang.json: generate.py
	mypy generate
	./generate
	ocamlc -o Language Language.mli Language.ml

.PHONY: clean
clean:
	rm -f $(FILES) Language

# This takes a while but ensures we use the correct versions of the atd tools.
.PHONY: setup
setup:
	opam update
	opam install --deps-only .

# The tests require semgrep-core, among other things.
#
.PHONY: test
test:
	$(MAKE) -C tests
