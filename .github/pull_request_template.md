- [ ] I ran `make setup && make` to update the generated code after editing a `.atd` file (TODO: have a CI check)
- [ ] I made sure we're still backward compatible with old versions of the CLI.
      For example, the Semgrep backend need to still be able to *consume* data generated
	  by Semgrep 1.17.0.
      See https://atd.readthedocs.io/en/latest/atdgen-tutorial.html#smooth-protocol-upgrades
