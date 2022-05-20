# If you want to modify the .atd, you will need to install via OPAM
# 'atd', 'atdpy', and 'atdts' to regenerate the code. See the setup
# target below.

VER=v0

FILES= \
  Semgrep_output_$(VER)_j.ml \
  Semgrep_output_$(VER)_j.mli \
  semgrep_output_$(VER).py \
  semgrep_output_$(VER).ts \
  semgrep_output_$(VER).jsonschema

.PHONY: build
build: $(FILES)

Semgrep_output_$(VER)_j.ml Semgrep_output_$(VER)_j.mli: Semgrep_output_$(VER).atd
	atdgen -j -j-std $<

semgrep_output_$(VER).py: Semgrep_output_$(VER).atd
	atdpy $<

semgrep_output_$(VER).ts: Semgrep_output_$(VER).atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_output_$(VER).jsonschema: Semgrep_output_$(VER).atd
	atdcat -jsonschema cli_output $< > $@

clean:
	rm -f $(FILES)

setup:
	opam install --deps-only .
