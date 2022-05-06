# If you want to modify the .atd, you will need to install via OPAM
# 'atd' (>= 2.6.0), 'atdpy', and 'atdts' to regenerate the code

VER=v0

.PHONY: build
build: semgrep_output_$(VER).py semgrep_output_$(VER).ts semgrep_output_$(VER).jsonschema

semgrep_output_$(VER).py: Semgrep_output_$(VER).atd
	atdpy $<

semgrep_output_$(VER).ts: Semgrep_output_$(VER).atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_output_$(VER).jsonschema: Semgrep_output_$(VER).atd
	atdcat -jsonschema cli_output $< > $@
