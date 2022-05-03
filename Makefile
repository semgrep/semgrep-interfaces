# If you want to modify the .atd, you will need to install via OPAM
# 'atd', 'atdpy', and 'atdts' to regenerate the code.

# TODO: add semgrep_scan_output_v1.jsonschema once atd 2.6.0 is release
.PHONY: build
build: semgrep_scan_output_v1.py semgrep_scan_output_v1.ts

semgrep_scan_output_v1.py: Semgrep_scan_output_v1.atd
	atdpy $<

semgrep_scan_output_v1.ts: Semgrep_scan_output_v1.atd
	atdts $<

# need atdcat >= 2.6.0
semgrep_scan_output_v1.jsonschema: Semgrep_scan_output_v1.atd
	atdcat -jsonschema cli_output $< > $@

#TODO: generate also the jsonschema and openapi spec using atdcat
