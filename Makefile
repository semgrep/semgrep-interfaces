# If you want to modify the .atd, you will need to install via OPAM
# 'atd', 'atdpy', and 'atdts' to regenerate the code. See the setup
# target below.

VER=v0

# Those files are in lowercase because atdpy/atdts seems to
# generate lowercase files, even though the input is capitalized
# TODO can't yet generate ast_generic_v0.py because of the use
# of parametric types in it (need monomorphise in atdpy or remove them)
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

%.py: %.atd
	atdpy $<

%_j.ml %_j.mli: %.atd
	atdgen -j -j-std $<

%.ts: %.atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_output_$(VER).jsonschema: semgrep_output_$(VER).atd
	atdcat -jsonschema cli_output $< > $@

clean:
	rm -f $(FILES)

setup:
	opam install --deps-only .
