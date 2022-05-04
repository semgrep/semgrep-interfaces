# If you want to modify the .atd, you will need to install via OPAM
# 'atd' (>= 2.6.0), 'atdpy', and 'atdts' to regenerate the code 

.PHONY: build
build: semgrep_output_v1.py semgrep_output_v1.ts semgrep_output_v1.jsonschema

semgrep_output_v1.py: Semgrep_output_v1.atd
	atdpy $<

semgrep_output_v1.ts: Semgrep_output_v1.atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_output_v1.jsonschema: Semgrep_output_v1.atd
	atdcat -jsonschema cli_output $< > $@

