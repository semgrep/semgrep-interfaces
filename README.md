# semgrep-interfaces

This repository contains IDL (Interface Definition Language) files specifying
the interface between different Semgrep components (e.g., between
the semgrep CLI and the playground). It also includes the schema for Semgrep rules,
as both Semgrep and Semgrep App rely on this.

This repository is meant to be used as a submodule.

You may need to `install opam` as a pre-requisite for contributing to this repository.
To initialize your environment, run `make setup`, which should initialize the modules
specified in `dev.opam`

To update an interface:
1. Make changes to the appropriate .atd file or edit `generate`
2. Run `make`. This will propagate that change to the respective .py, .ts, .ml, etc.
