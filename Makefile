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
	test `atdpy --version` = 2.12.0
	atdpy $<

# not sure about the minimum version of atdgen. Using safe settings.
%_j.ml %_j.mli: %.atd
	test `atdgen -version` = 2.12.0 || test `atdgen -version` = 2.11.0
	atdgen -j -j-std $<

# need atdts >= 2.11.0
%.ts: %.atd
	test `atdts --version` = 2.12.0 || test `atdts --version` = 2.11.0
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

.PHONY: setup
setup:
	opam install --deps-only .

# The tests require semgrep-core, among other things.
#
.PHONY: test
test:
	$(MAKE) -C tests
