from ast_generic_v1 import Program
import json
import sys

model = json.load(sys.stdin)
program = Program.from_json(model)
