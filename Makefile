# If you want to modify the .atd, you will need to install via OPAM
# 'atdpy' and 'atdts' to regenerate the code.

# Derive Python code from interface definition
.PHONY: build
build: semgrep_scan_output_v1.py semgrep_scan_output_v1.ts

semgrep_scan_output_v1.py: Semgrep_scan_output_v1.atd
	atdpy $<

semgrep_scan_output_v1.ts: Semgrep_scan_output_v1.atd
	atdts $<

#TODO: generate also the jsonschema and openapi spec using atdcat
