(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type engine_kind = Semgrep_output_v1_t.engine_kind [@@deriving show]

type matching_operation = Semgrep_output_v1_t.matching_operation = 
    And
  | Or
  | Inside
  | XPat of string
  | Negation
  | Filter of string
  | Taint
  | TaintSource
  | TaintSink
  | TaintSanitizer
  | EllipsisAndStmts
  | ClassHeaderAndElems

  [@@deriving show { with_path = false}]

type position = Semgrep_output_v1_t.position = {
  line: int;
  col: int;
  offset: int
}
  [@@deriving show]

type location = Semgrep_output_v1_t.location = {
  path: string;
  start: position;
  end_ (*atd end *): position
}
  [@@deriving show]

type cli_match_intermediate_var =
  Semgrep_output_v1_t.cli_match_intermediate_var = {
  location: location;
  content: string
}
  [@@deriving show]

type core_match_intermediate_var =
  Semgrep_output_v1_t.core_match_intermediate_var = {
  location: location
}
  [@@deriving show]

type raw_json = Yojson.Basic.t [@@deriving show]

type rule_id = Semgrep_output_v1_t.rule_id [@@deriving show]

type svalue_value = Semgrep_output_v1_t.svalue_value = {
  svalue_start: position option;
  svalue_end: position option;
  svalue_abstract_content: string
}
  [@@deriving show]

type metavar_value = Semgrep_output_v1_t.metavar_value = {
  start: position;
  end_ (*atd end *): position;
  abstract_content: string;
  propagated_value: svalue_value option
}
  [@@deriving show]

type metavars = Semgrep_output_v1_t.metavars [@@deriving show]

type core_match_call_trace = Semgrep_output_v1_t.core_match_call_trace = 
    CoreLoc of location
  | CoreCall
      of (
          location
        * core_match_intermediate_var list
        * core_match_call_trace
      )

  [@@deriving show]

type core_match_dataflow_trace =
  Semgrep_output_v1_t.core_match_dataflow_trace = {
  taint_source: core_match_call_trace option;
  intermediate_vars: core_match_intermediate_var list option;
  taint_sink: core_match_call_trace option
}
  [@@deriving show]

type core_match_extra = Semgrep_output_v1_t.core_match_extra = {
  message: string option;
  metavars: metavars;
  dataflow_trace: core_match_dataflow_trace option;
  rendered_fix: string option;
  engine_kind: engine_kind;
  extra_extra: raw_json option
}
  [@@deriving show]

type core_match = Semgrep_output_v1_t.core_match = {
  rule_id: rule_id;
  location: location;
  extra: core_match_extra
}
  [@@deriving show]

type matching_explanation = Semgrep_output_v1_t.matching_explanation = {
  op: matching_operation;
  children: matching_explanation list;
  matches: core_match list;
  loc: location
}
  [@@deriving show]

type cli_match_call_trace = Semgrep_output_v1_t.cli_match_call_trace = 
    CliLoc of (location * string)
  | CliCall
      of (
          (location * string)
        * cli_match_intermediate_var list
        * cli_match_call_trace
      )

  [@@deriving show]

type version = Semgrep_output_v1_t.version [@@deriving show]

type transitivity = Semgrep_output_v1_t.transitivity [@@deriving show]

type rule_times = Semgrep_output_v1_t.rule_times = {
  rule_id: rule_id;
  parse_time: float;
  match_time: float
}
  [@@deriving show]

type target_time = Semgrep_output_v1_t.target_time = {
  path: string;
  rule_times: rule_times list;
  run_time: float
}
  [@@deriving show]

type skip_reason = Semgrep_output_v1_t.skip_reason = 
    Gitignore_patterns_match | Always_skipped | Semgrepignore_patterns_match
  | Cli_include_flags_do_not_match | Cli_exclude_flags_match
  | Exceeded_size_limit | Analysis_failed_parser_or_internal_error
  | Excluded_by_config | Wrong_language | Too_big | Minified | Binary
  | Irrelevant_rule | Too_many_matches

  [@@deriving show]

type skipped_target = Semgrep_output_v1_t.skipped_target = {
  path: string;
  reason: skip_reason;
  details: string;
  rule_id: rule_id option
}
  [@@deriving show]

type skipped_rule = Semgrep_output_v1_t.skipped_rule = {
  rule_id: rule_id;
  details: string;
  position: position
}
  [@@deriving show]

type ecosystem = Semgrep_output_v1_t.ecosystem [@@deriving show]

type found_dependency = Semgrep_output_v1_t.found_dependency = {
  package: string;
  version: string;
  ecosystem: ecosystem;
  allowed_hashes: (string * string list) list;
  resolved_url: string option;
  transitivity: transitivity;
  line_number: int option
}
  [@@deriving show]

type dependency_pattern = Semgrep_output_v1_t.dependency_pattern = {
  ecosystem: ecosystem;
  package: string;
  semver_range: string
}
  [@@deriving show]

type dependency_match = Semgrep_output_v1_t.dependency_match = {
  dependency_pattern: dependency_pattern;
  found_dependency: found_dependency;
  lockfile: string
}
  [@@deriving show]

type sca_info = Semgrep_output_v1_t.sca_info = {
  reachable: bool;
  reachability_rule: bool;
  sca_finding_schema: int;
  dependency_match: dependency_match
}
  [@@deriving show]

type rule_id_dict = Semgrep_output_v1_t.rule_id_dict = { id: rule_id }
  [@@deriving show]

type rule_id_and_engine_kind = Semgrep_output_v1_t.rule_id_and_engine_kind
  [@@deriving show]

type position_bis = Semgrep_output_v1_t.position_bis = {
  line: int;
  col: int
}
  [@@deriving show]

type fix_regex = Semgrep_output_v1_t.fix_regex = {
  regex: string;
  replacement: string;
  count: int option
}
  [@@deriving show]

type finding_hashes = Semgrep_output_v1_t.finding_hashes = {
  start_line_hash: string;
  end_line_hash: string;
  code_hash: string;
  pattern_hash: string
}
  [@@deriving show]

type cli_match_dataflow_trace =
  Semgrep_output_v1_t.cli_match_dataflow_trace = {
  taint_source: cli_match_call_trace option;
  intermediate_vars: cli_match_intermediate_var list option;
  taint_sink: cli_match_call_trace option
}
  [@@deriving show]

type finding = Semgrep_output_v1_t.finding = {
  check_id: rule_id;
  path: string;
  line: int;
  column: int;
  end_line: int;
  end_column: int;
  message: string;
  severity: int;
  index: int;
  commit_date: string;
  syntactic_id: string;
  match_based_id: string option;
  hashes: finding_hashes option;
  metadata: raw_json;
  is_blocking: bool;
  fixed_lines: string list option;
  sca_info: sca_info option;
  dataflow_trace: cli_match_dataflow_trace option
}
  [@@deriving show]

type error_span = Semgrep_output_v1_t.error_span = {
  file: string;
  start: position_bis;
  end_ (*atd end *): position_bis;
  source_hash: string option;
  config_start: position_bis option option;
  config_end: position_bis option option;
  config_path: string list option option;
  context_start: position_bis option option;
  context_end: position_bis option option
}
  [@@deriving show]

type cve_result = Semgrep_output_v1_t.cve_result = {
  url: string;
  filename: string;
  funcnames: string list
}
  [@@deriving show]

type cve_results = Semgrep_output_v1_t.cve_results [@@deriving show]

type core_timing = Semgrep_output_v1_t.core_timing = {
  targets: target_time list;
  rules: rule_id list;
  rules_parse_time: float option;
  max_memory_bytes: int
}
  [@@deriving show]

type core_stats = Semgrep_output_v1_t.core_stats = {
  okfiles: int;
  errorfiles: int
}
  [@@deriving show]

type core_severity = Semgrep_output_v1_t.core_severity =  Error | Warning 
  [@@deriving show]

type core_error_kind = Semgrep_output_v1_t.core_error_kind = 
    LexicalError
  | ParseError
  | SpecifiedParseError
  | AstBuilderError
  | RuleParseError
  | PatternParseError of string list
  | InvalidYaml
  | MatchingError
  | SemgrepMatchFound
  | TooManyMatches
  | FatalError
  | Timeout
  | OutOfMemory
  | TimeoutDuringInterfile
  | OutOfMemoryDuringInterfile
  | PartialParsing of location list

  [@@deriving show]

type core_error = Semgrep_output_v1_t.core_error = {
  rule_id: rule_id option;
  error_type: core_error_kind;
  severity: core_severity;
  location: location;
  message: string;
  details: string option
}
  [@@deriving show]

type core_match_results = Semgrep_output_v1_t.core_match_results = {
  matches: core_match list;
  errors: core_error list;
  skipped_targets: skipped_target list option;
  skipped_rules: skipped_rule list option;
  explanations: matching_explanation list option;
  stats: core_stats;
  time: core_timing option;
  rules_by_engine: rule_id_and_engine_kind list;
  engine_requested: engine_kind
}
  [@@deriving show]

type cli_target_times = Semgrep_output_v1_t.cli_target_times = {
  path: string;
  num_bytes: int;
  match_times: float list;
  parse_times: float list;
  run_time: float
}
  [@@deriving show]

type cli_timing = Semgrep_output_v1_t.cli_timing = {
  rules: rule_id_dict list;
  rules_parse_time: float;
  profiling_times: (string * float) list;
  targets: cli_target_times list;
  total_bytes: int;
  max_memory_bytes: int option
}
  [@@deriving show]

type cli_skipped_target = Semgrep_output_v1_t.cli_skipped_target = {
  path: string;
  reason: skip_reason
}
  [@@deriving show]

type cli_paths = Semgrep_output_v1_t.cli_paths = {
  scanned: string list;
  _comment: string option;
  skipped: cli_skipped_target list option
}
  [@@deriving show]

type cli_output_extra = Semgrep_output_v1_t.cli_output_extra = {
  paths: cli_paths;
  time: cli_timing option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option
}
  [@@deriving show]

type cli_match_extra = Semgrep_output_v1_t.cli_match_extra = {
  metavars: metavars option;
  fingerprint: string;
  lines: string;
  message: string;
  metadata: raw_json;
  severity: string;
  fix: string option;
  fix_regex: fix_regex option;
  is_ignored: bool option;
  sca_info: sca_info option;
  fixed_lines: string list option;
  dataflow_trace: cli_match_dataflow_trace option;
  engine_kind: engine_kind option;
  extra_extra: raw_json option
}
  [@@deriving show]

type cli_match = Semgrep_output_v1_t.cli_match = {
  check_id: rule_id;
  path: string;
  start: position;
  end_ (*atd end *): position;
  extra: cli_match_extra
}
  [@@deriving show]

type cli_error = Semgrep_output_v1_t.cli_error = {
  code: int;
  level: string;
  type_: string;
  rule_id: rule_id option;
  message: string option;
  path: string option;
  long_msg: string option;
  short_msg: string option;
  spans: error_span list option;
  help: string option
}
  [@@deriving show]

type cli_output = Semgrep_output_v1_t.cli_output = {
  version: version option;
  errors: cli_error list;
  results: cli_match list;
  paths: cli_paths;
  time: cli_timing option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option
}
  [@@deriving show]

type cli_match_taint_source = Semgrep_output_v1_t.cli_match_taint_source = {
  location: location;
  content: string
}
  [@@deriving show]

type api_scans_findings = Semgrep_output_v1_t.api_scans_findings = {
  findings: finding list;
  token: string option;
  gitlab_token: string option;
  searched_paths: string list;
  rule_ids: string list;
  cai_ids: string list
}
  [@@deriving show]

val write_engine_kind :
  Buffer.t -> engine_kind -> unit
  (** Output a JSON value of type {!type:engine_kind}. *)

val string_of_engine_kind :
  ?len:int -> engine_kind -> string
  (** Serialize a value of type {!type:engine_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_engine_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> engine_kind
  (** Input JSON data of type {!type:engine_kind}. *)

val engine_kind_of_string :
  string -> engine_kind
  (** Deserialize JSON data of type {!type:engine_kind}. *)

val write_matching_operation :
  Buffer.t -> matching_operation -> unit
  (** Output a JSON value of type {!type:matching_operation}. *)

val string_of_matching_operation :
  ?len:int -> matching_operation -> string
  (** Serialize a value of type {!type:matching_operation}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_matching_operation :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> matching_operation
  (** Input JSON data of type {!type:matching_operation}. *)

val matching_operation_of_string :
  string -> matching_operation
  (** Deserialize JSON data of type {!type:matching_operation}. *)

val write_position :
  Buffer.t -> position -> unit
  (** Output a JSON value of type {!type:position}. *)

val string_of_position :
  ?len:int -> position -> string
  (** Serialize a value of type {!type:position}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_position :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> position
  (** Input JSON data of type {!type:position}. *)

val position_of_string :
  string -> position
  (** Deserialize JSON data of type {!type:position}. *)

val write_location :
  Buffer.t -> location -> unit
  (** Output a JSON value of type {!type:location}. *)

val string_of_location :
  ?len:int -> location -> string
  (** Serialize a value of type {!type:location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> location
  (** Input JSON data of type {!type:location}. *)

val location_of_string :
  string -> location
  (** Deserialize JSON data of type {!type:location}. *)

val write_cli_match_intermediate_var :
  Buffer.t -> cli_match_intermediate_var -> unit
  (** Output a JSON value of type {!type:cli_match_intermediate_var}. *)

val string_of_cli_match_intermediate_var :
  ?len:int -> cli_match_intermediate_var -> string
  (** Serialize a value of type {!type:cli_match_intermediate_var}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_intermediate_var :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_intermediate_var
  (** Input JSON data of type {!type:cli_match_intermediate_var}. *)

val cli_match_intermediate_var_of_string :
  string -> cli_match_intermediate_var
  (** Deserialize JSON data of type {!type:cli_match_intermediate_var}. *)

val write_core_match_intermediate_var :
  Buffer.t -> core_match_intermediate_var -> unit
  (** Output a JSON value of type {!type:core_match_intermediate_var}. *)

val string_of_core_match_intermediate_var :
  ?len:int -> core_match_intermediate_var -> string
  (** Serialize a value of type {!type:core_match_intermediate_var}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_intermediate_var :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_intermediate_var
  (** Input JSON data of type {!type:core_match_intermediate_var}. *)

val core_match_intermediate_var_of_string :
  string -> core_match_intermediate_var
  (** Deserialize JSON data of type {!type:core_match_intermediate_var}. *)

val write_raw_json :
  Buffer.t -> raw_json -> unit
  (** Output a JSON value of type {!type:raw_json}. *)

val string_of_raw_json :
  ?len:int -> raw_json -> string
  (** Serialize a value of type {!type:raw_json}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_raw_json :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> raw_json
  (** Input JSON data of type {!type:raw_json}. *)

val raw_json_of_string :
  string -> raw_json
  (** Deserialize JSON data of type {!type:raw_json}. *)

val write_rule_id :
  Buffer.t -> rule_id -> unit
  (** Output a JSON value of type {!type:rule_id}. *)

val string_of_rule_id :
  ?len:int -> rule_id -> string
  (** Serialize a value of type {!type:rule_id}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_id :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_id
  (** Input JSON data of type {!type:rule_id}. *)

val rule_id_of_string :
  string -> rule_id
  (** Deserialize JSON data of type {!type:rule_id}. *)

val write_svalue_value :
  Buffer.t -> svalue_value -> unit
  (** Output a JSON value of type {!type:svalue_value}. *)

val string_of_svalue_value :
  ?len:int -> svalue_value -> string
  (** Serialize a value of type {!type:svalue_value}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_svalue_value :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> svalue_value
  (** Input JSON data of type {!type:svalue_value}. *)

val svalue_value_of_string :
  string -> svalue_value
  (** Deserialize JSON data of type {!type:svalue_value}. *)

val write_metavar_value :
  Buffer.t -> metavar_value -> unit
  (** Output a JSON value of type {!type:metavar_value}. *)

val string_of_metavar_value :
  ?len:int -> metavar_value -> string
  (** Serialize a value of type {!type:metavar_value}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_metavar_value :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> metavar_value
  (** Input JSON data of type {!type:metavar_value}. *)

val metavar_value_of_string :
  string -> metavar_value
  (** Deserialize JSON data of type {!type:metavar_value}. *)

val write_metavars :
  Buffer.t -> metavars -> unit
  (** Output a JSON value of type {!type:metavars}. *)

val string_of_metavars :
  ?len:int -> metavars -> string
  (** Serialize a value of type {!type:metavars}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_metavars :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> metavars
  (** Input JSON data of type {!type:metavars}. *)

val metavars_of_string :
  string -> metavars
  (** Deserialize JSON data of type {!type:metavars}. *)

val write_core_match_call_trace :
  Buffer.t -> core_match_call_trace -> unit
  (** Output a JSON value of type {!type:core_match_call_trace}. *)

val string_of_core_match_call_trace :
  ?len:int -> core_match_call_trace -> string
  (** Serialize a value of type {!type:core_match_call_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_call_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_call_trace
  (** Input JSON data of type {!type:core_match_call_trace}. *)

val core_match_call_trace_of_string :
  string -> core_match_call_trace
  (** Deserialize JSON data of type {!type:core_match_call_trace}. *)

val write_core_match_dataflow_trace :
  Buffer.t -> core_match_dataflow_trace -> unit
  (** Output a JSON value of type {!type:core_match_dataflow_trace}. *)

val string_of_core_match_dataflow_trace :
  ?len:int -> core_match_dataflow_trace -> string
  (** Serialize a value of type {!type:core_match_dataflow_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_dataflow_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_dataflow_trace
  (** Input JSON data of type {!type:core_match_dataflow_trace}. *)

val core_match_dataflow_trace_of_string :
  string -> core_match_dataflow_trace
  (** Deserialize JSON data of type {!type:core_match_dataflow_trace}. *)

val write_core_match_extra :
  Buffer.t -> core_match_extra -> unit
  (** Output a JSON value of type {!type:core_match_extra}. *)

val string_of_core_match_extra :
  ?len:int -> core_match_extra -> string
  (** Serialize a value of type {!type:core_match_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_extra
  (** Input JSON data of type {!type:core_match_extra}. *)

val core_match_extra_of_string :
  string -> core_match_extra
  (** Deserialize JSON data of type {!type:core_match_extra}. *)

val write_core_match :
  Buffer.t -> core_match -> unit
  (** Output a JSON value of type {!type:core_match}. *)

val string_of_core_match :
  ?len:int -> core_match -> string
  (** Serialize a value of type {!type:core_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match
  (** Input JSON data of type {!type:core_match}. *)

val core_match_of_string :
  string -> core_match
  (** Deserialize JSON data of type {!type:core_match}. *)

val write_matching_explanation :
  Buffer.t -> matching_explanation -> unit
  (** Output a JSON value of type {!type:matching_explanation}. *)

val string_of_matching_explanation :
  ?len:int -> matching_explanation -> string
  (** Serialize a value of type {!type:matching_explanation}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_matching_explanation :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> matching_explanation
  (** Input JSON data of type {!type:matching_explanation}. *)

val matching_explanation_of_string :
  string -> matching_explanation
  (** Deserialize JSON data of type {!type:matching_explanation}. *)

val write_cli_match_call_trace :
  Buffer.t -> cli_match_call_trace -> unit
  (** Output a JSON value of type {!type:cli_match_call_trace}. *)

val string_of_cli_match_call_trace :
  ?len:int -> cli_match_call_trace -> string
  (** Serialize a value of type {!type:cli_match_call_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_call_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_call_trace
  (** Input JSON data of type {!type:cli_match_call_trace}. *)

val cli_match_call_trace_of_string :
  string -> cli_match_call_trace
  (** Deserialize JSON data of type {!type:cli_match_call_trace}. *)

val write_version :
  Buffer.t -> version -> unit
  (** Output a JSON value of type {!type:version}. *)

val string_of_version :
  ?len:int -> version -> string
  (** Serialize a value of type {!type:version}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_version :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> version
  (** Input JSON data of type {!type:version}. *)

val version_of_string :
  string -> version
  (** Deserialize JSON data of type {!type:version}. *)

val write_transitivity :
  Buffer.t -> transitivity -> unit
  (** Output a JSON value of type {!type:transitivity}. *)

val string_of_transitivity :
  ?len:int -> transitivity -> string
  (** Serialize a value of type {!type:transitivity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transitivity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transitivity
  (** Input JSON data of type {!type:transitivity}. *)

val transitivity_of_string :
  string -> transitivity
  (** Deserialize JSON data of type {!type:transitivity}. *)

val write_rule_times :
  Buffer.t -> rule_times -> unit
  (** Output a JSON value of type {!type:rule_times}. *)

val string_of_rule_times :
  ?len:int -> rule_times -> string
  (** Serialize a value of type {!type:rule_times}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_times :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_times
  (** Input JSON data of type {!type:rule_times}. *)

val rule_times_of_string :
  string -> rule_times
  (** Deserialize JSON data of type {!type:rule_times}. *)

val write_target_time :
  Buffer.t -> target_time -> unit
  (** Output a JSON value of type {!type:target_time}. *)

val string_of_target_time :
  ?len:int -> target_time -> string
  (** Serialize a value of type {!type:target_time}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_target_time :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> target_time
  (** Input JSON data of type {!type:target_time}. *)

val target_time_of_string :
  string -> target_time
  (** Deserialize JSON data of type {!type:target_time}. *)

val write_skip_reason :
  Buffer.t -> skip_reason -> unit
  (** Output a JSON value of type {!type:skip_reason}. *)

val string_of_skip_reason :
  ?len:int -> skip_reason -> string
  (** Serialize a value of type {!type:skip_reason}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skip_reason :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skip_reason
  (** Input JSON data of type {!type:skip_reason}. *)

val skip_reason_of_string :
  string -> skip_reason
  (** Deserialize JSON data of type {!type:skip_reason}. *)

val write_skipped_target :
  Buffer.t -> skipped_target -> unit
  (** Output a JSON value of type {!type:skipped_target}. *)

val string_of_skipped_target :
  ?len:int -> skipped_target -> string
  (** Serialize a value of type {!type:skipped_target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skipped_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skipped_target
  (** Input JSON data of type {!type:skipped_target}. *)

val skipped_target_of_string :
  string -> skipped_target
  (** Deserialize JSON data of type {!type:skipped_target}. *)

val write_skipped_rule :
  Buffer.t -> skipped_rule -> unit
  (** Output a JSON value of type {!type:skipped_rule}. *)

val string_of_skipped_rule :
  ?len:int -> skipped_rule -> string
  (** Serialize a value of type {!type:skipped_rule}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skipped_rule :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skipped_rule
  (** Input JSON data of type {!type:skipped_rule}. *)

val skipped_rule_of_string :
  string -> skipped_rule
  (** Deserialize JSON data of type {!type:skipped_rule}. *)

val write_ecosystem :
  Buffer.t -> ecosystem -> unit
  (** Output a JSON value of type {!type:ecosystem}. *)

val string_of_ecosystem :
  ?len:int -> ecosystem -> string
  (** Serialize a value of type {!type:ecosystem}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ecosystem :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ecosystem
  (** Input JSON data of type {!type:ecosystem}. *)

val ecosystem_of_string :
  string -> ecosystem
  (** Deserialize JSON data of type {!type:ecosystem}. *)

val write_found_dependency :
  Buffer.t -> found_dependency -> unit
  (** Output a JSON value of type {!type:found_dependency}. *)

val string_of_found_dependency :
  ?len:int -> found_dependency -> string
  (** Serialize a value of type {!type:found_dependency}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_found_dependency :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> found_dependency
  (** Input JSON data of type {!type:found_dependency}. *)

val found_dependency_of_string :
  string -> found_dependency
  (** Deserialize JSON data of type {!type:found_dependency}. *)

val write_dependency_pattern :
  Buffer.t -> dependency_pattern -> unit
  (** Output a JSON value of type {!type:dependency_pattern}. *)

val string_of_dependency_pattern :
  ?len:int -> dependency_pattern -> string
  (** Serialize a value of type {!type:dependency_pattern}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_pattern :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_pattern
  (** Input JSON data of type {!type:dependency_pattern}. *)

val dependency_pattern_of_string :
  string -> dependency_pattern
  (** Deserialize JSON data of type {!type:dependency_pattern}. *)

val write_dependency_match :
  Buffer.t -> dependency_match -> unit
  (** Output a JSON value of type {!type:dependency_match}. *)

val string_of_dependency_match :
  ?len:int -> dependency_match -> string
  (** Serialize a value of type {!type:dependency_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_match
  (** Input JSON data of type {!type:dependency_match}. *)

val dependency_match_of_string :
  string -> dependency_match
  (** Deserialize JSON data of type {!type:dependency_match}. *)

val write_sca_info :
  Buffer.t -> sca_info -> unit
  (** Output a JSON value of type {!type:sca_info}. *)

val string_of_sca_info :
  ?len:int -> sca_info -> string
  (** Serialize a value of type {!type:sca_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_info
  (** Input JSON data of type {!type:sca_info}. *)

val sca_info_of_string :
  string -> sca_info
  (** Deserialize JSON data of type {!type:sca_info}. *)

val write_rule_id_dict :
  Buffer.t -> rule_id_dict -> unit
  (** Output a JSON value of type {!type:rule_id_dict}. *)

val string_of_rule_id_dict :
  ?len:int -> rule_id_dict -> string
  (** Serialize a value of type {!type:rule_id_dict}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_id_dict :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_id_dict
  (** Input JSON data of type {!type:rule_id_dict}. *)

val rule_id_dict_of_string :
  string -> rule_id_dict
  (** Deserialize JSON data of type {!type:rule_id_dict}. *)

val write_rule_id_and_engine_kind :
  Buffer.t -> rule_id_and_engine_kind -> unit
  (** Output a JSON value of type {!type:rule_id_and_engine_kind}. *)

val string_of_rule_id_and_engine_kind :
  ?len:int -> rule_id_and_engine_kind -> string
  (** Serialize a value of type {!type:rule_id_and_engine_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_id_and_engine_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_id_and_engine_kind
  (** Input JSON data of type {!type:rule_id_and_engine_kind}. *)

val rule_id_and_engine_kind_of_string :
  string -> rule_id_and_engine_kind
  (** Deserialize JSON data of type {!type:rule_id_and_engine_kind}. *)

val write_position_bis :
  Buffer.t -> position_bis -> unit
  (** Output a JSON value of type {!type:position_bis}. *)

val string_of_position_bis :
  ?len:int -> position_bis -> string
  (** Serialize a value of type {!type:position_bis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_position_bis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> position_bis
  (** Input JSON data of type {!type:position_bis}. *)

val position_bis_of_string :
  string -> position_bis
  (** Deserialize JSON data of type {!type:position_bis}. *)

val write_fix_regex :
  Buffer.t -> fix_regex -> unit
  (** Output a JSON value of type {!type:fix_regex}. *)

val string_of_fix_regex :
  ?len:int -> fix_regex -> string
  (** Serialize a value of type {!type:fix_regex}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_fix_regex :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> fix_regex
  (** Input JSON data of type {!type:fix_regex}. *)

val fix_regex_of_string :
  string -> fix_regex
  (** Deserialize JSON data of type {!type:fix_regex}. *)

val write_finding_hashes :
  Buffer.t -> finding_hashes -> unit
  (** Output a JSON value of type {!type:finding_hashes}. *)

val string_of_finding_hashes :
  ?len:int -> finding_hashes -> string
  (** Serialize a value of type {!type:finding_hashes}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_finding_hashes :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> finding_hashes
  (** Input JSON data of type {!type:finding_hashes}. *)

val finding_hashes_of_string :
  string -> finding_hashes
  (** Deserialize JSON data of type {!type:finding_hashes}. *)

val write_cli_match_dataflow_trace :
  Buffer.t -> cli_match_dataflow_trace -> unit
  (** Output a JSON value of type {!type:cli_match_dataflow_trace}. *)

val string_of_cli_match_dataflow_trace :
  ?len:int -> cli_match_dataflow_trace -> string
  (** Serialize a value of type {!type:cli_match_dataflow_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_dataflow_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_dataflow_trace
  (** Input JSON data of type {!type:cli_match_dataflow_trace}. *)

val cli_match_dataflow_trace_of_string :
  string -> cli_match_dataflow_trace
  (** Deserialize JSON data of type {!type:cli_match_dataflow_trace}. *)

val write_finding :
  Buffer.t -> finding -> unit
  (** Output a JSON value of type {!type:finding}. *)

val string_of_finding :
  ?len:int -> finding -> string
  (** Serialize a value of type {!type:finding}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_finding :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> finding
  (** Input JSON data of type {!type:finding}. *)

val finding_of_string :
  string -> finding
  (** Deserialize JSON data of type {!type:finding}. *)

val write_error_span :
  Buffer.t -> error_span -> unit
  (** Output a JSON value of type {!type:error_span}. *)

val string_of_error_span :
  ?len:int -> error_span -> string
  (** Serialize a value of type {!type:error_span}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error_span :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error_span
  (** Input JSON data of type {!type:error_span}. *)

val error_span_of_string :
  string -> error_span
  (** Deserialize JSON data of type {!type:error_span}. *)

val write_cve_result :
  Buffer.t -> cve_result -> unit
  (** Output a JSON value of type {!type:cve_result}. *)

val string_of_cve_result :
  ?len:int -> cve_result -> string
  (** Serialize a value of type {!type:cve_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cve_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cve_result
  (** Input JSON data of type {!type:cve_result}. *)

val cve_result_of_string :
  string -> cve_result
  (** Deserialize JSON data of type {!type:cve_result}. *)

val write_cve_results :
  Buffer.t -> cve_results -> unit
  (** Output a JSON value of type {!type:cve_results}. *)

val string_of_cve_results :
  ?len:int -> cve_results -> string
  (** Serialize a value of type {!type:cve_results}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cve_results :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cve_results
  (** Input JSON data of type {!type:cve_results}. *)

val cve_results_of_string :
  string -> cve_results
  (** Deserialize JSON data of type {!type:cve_results}. *)

val write_core_timing :
  Buffer.t -> core_timing -> unit
  (** Output a JSON value of type {!type:core_timing}. *)

val string_of_core_timing :
  ?len:int -> core_timing -> string
  (** Serialize a value of type {!type:core_timing}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_timing :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_timing
  (** Input JSON data of type {!type:core_timing}. *)

val core_timing_of_string :
  string -> core_timing
  (** Deserialize JSON data of type {!type:core_timing}. *)

val write_core_stats :
  Buffer.t -> core_stats -> unit
  (** Output a JSON value of type {!type:core_stats}. *)

val string_of_core_stats :
  ?len:int -> core_stats -> string
  (** Serialize a value of type {!type:core_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_stats
  (** Input JSON data of type {!type:core_stats}. *)

val core_stats_of_string :
  string -> core_stats
  (** Deserialize JSON data of type {!type:core_stats}. *)

val write_core_severity :
  Buffer.t -> core_severity -> unit
  (** Output a JSON value of type {!type:core_severity}. *)

val string_of_core_severity :
  ?len:int -> core_severity -> string
  (** Serialize a value of type {!type:core_severity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_severity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_severity
  (** Input JSON data of type {!type:core_severity}. *)

val core_severity_of_string :
  string -> core_severity
  (** Deserialize JSON data of type {!type:core_severity}. *)

val write_core_error_kind :
  Buffer.t -> core_error_kind -> unit
  (** Output a JSON value of type {!type:core_error_kind}. *)

val string_of_core_error_kind :
  ?len:int -> core_error_kind -> string
  (** Serialize a value of type {!type:core_error_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_error_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_error_kind
  (** Input JSON data of type {!type:core_error_kind}. *)

val core_error_kind_of_string :
  string -> core_error_kind
  (** Deserialize JSON data of type {!type:core_error_kind}. *)

val write_core_error :
  Buffer.t -> core_error -> unit
  (** Output a JSON value of type {!type:core_error}. *)

val string_of_core_error :
  ?len:int -> core_error -> string
  (** Serialize a value of type {!type:core_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_error
  (** Input JSON data of type {!type:core_error}. *)

val core_error_of_string :
  string -> core_error
  (** Deserialize JSON data of type {!type:core_error}. *)

val write_core_match_results :
  Buffer.t -> core_match_results -> unit
  (** Output a JSON value of type {!type:core_match_results}. *)

val string_of_core_match_results :
  ?len:int -> core_match_results -> string
  (** Serialize a value of type {!type:core_match_results}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_results :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_results
  (** Input JSON data of type {!type:core_match_results}. *)

val core_match_results_of_string :
  string -> core_match_results
  (** Deserialize JSON data of type {!type:core_match_results}. *)

val write_cli_target_times :
  Buffer.t -> cli_target_times -> unit
  (** Output a JSON value of type {!type:cli_target_times}. *)

val string_of_cli_target_times :
  ?len:int -> cli_target_times -> string
  (** Serialize a value of type {!type:cli_target_times}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_target_times :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_target_times
  (** Input JSON data of type {!type:cli_target_times}. *)

val cli_target_times_of_string :
  string -> cli_target_times
  (** Deserialize JSON data of type {!type:cli_target_times}. *)

val write_cli_timing :
  Buffer.t -> cli_timing -> unit
  (** Output a JSON value of type {!type:cli_timing}. *)

val string_of_cli_timing :
  ?len:int -> cli_timing -> string
  (** Serialize a value of type {!type:cli_timing}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_timing :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_timing
  (** Input JSON data of type {!type:cli_timing}. *)

val cli_timing_of_string :
  string -> cli_timing
  (** Deserialize JSON data of type {!type:cli_timing}. *)

val write_cli_skipped_target :
  Buffer.t -> cli_skipped_target -> unit
  (** Output a JSON value of type {!type:cli_skipped_target}. *)

val string_of_cli_skipped_target :
  ?len:int -> cli_skipped_target -> string
  (** Serialize a value of type {!type:cli_skipped_target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_skipped_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_skipped_target
  (** Input JSON data of type {!type:cli_skipped_target}. *)

val cli_skipped_target_of_string :
  string -> cli_skipped_target
  (** Deserialize JSON data of type {!type:cli_skipped_target}. *)

val write_cli_paths :
  Buffer.t -> cli_paths -> unit
  (** Output a JSON value of type {!type:cli_paths}. *)

val string_of_cli_paths :
  ?len:int -> cli_paths -> string
  (** Serialize a value of type {!type:cli_paths}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_paths :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_paths
  (** Input JSON data of type {!type:cli_paths}. *)

val cli_paths_of_string :
  string -> cli_paths
  (** Deserialize JSON data of type {!type:cli_paths}. *)

val write_cli_output_extra :
  Buffer.t -> cli_output_extra -> unit
  (** Output a JSON value of type {!type:cli_output_extra}. *)

val string_of_cli_output_extra :
  ?len:int -> cli_output_extra -> string
  (** Serialize a value of type {!type:cli_output_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_output_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_output_extra
  (** Input JSON data of type {!type:cli_output_extra}. *)

val cli_output_extra_of_string :
  string -> cli_output_extra
  (** Deserialize JSON data of type {!type:cli_output_extra}. *)

val write_cli_match_extra :
  Buffer.t -> cli_match_extra -> unit
  (** Output a JSON value of type {!type:cli_match_extra}. *)

val string_of_cli_match_extra :
  ?len:int -> cli_match_extra -> string
  (** Serialize a value of type {!type:cli_match_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_extra
  (** Input JSON data of type {!type:cli_match_extra}. *)

val cli_match_extra_of_string :
  string -> cli_match_extra
  (** Deserialize JSON data of type {!type:cli_match_extra}. *)

val write_cli_match :
  Buffer.t -> cli_match -> unit
  (** Output a JSON value of type {!type:cli_match}. *)

val string_of_cli_match :
  ?len:int -> cli_match -> string
  (** Serialize a value of type {!type:cli_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match
  (** Input JSON data of type {!type:cli_match}. *)

val cli_match_of_string :
  string -> cli_match
  (** Deserialize JSON data of type {!type:cli_match}. *)

val write_cli_error :
  Buffer.t -> cli_error -> unit
  (** Output a JSON value of type {!type:cli_error}. *)

val string_of_cli_error :
  ?len:int -> cli_error -> string
  (** Serialize a value of type {!type:cli_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_error
  (** Input JSON data of type {!type:cli_error}. *)

val cli_error_of_string :
  string -> cli_error
  (** Deserialize JSON data of type {!type:cli_error}. *)

val write_cli_output :
  Buffer.t -> cli_output -> unit
  (** Output a JSON value of type {!type:cli_output}. *)

val string_of_cli_output :
  ?len:int -> cli_output -> string
  (** Serialize a value of type {!type:cli_output}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_output :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_output
  (** Input JSON data of type {!type:cli_output}. *)

val cli_output_of_string :
  string -> cli_output
  (** Deserialize JSON data of type {!type:cli_output}. *)

val write_cli_match_taint_source :
  Buffer.t -> cli_match_taint_source -> unit
  (** Output a JSON value of type {!type:cli_match_taint_source}. *)

val string_of_cli_match_taint_source :
  ?len:int -> cli_match_taint_source -> string
  (** Serialize a value of type {!type:cli_match_taint_source}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_taint_source :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_taint_source
  (** Input JSON data of type {!type:cli_match_taint_source}. *)

val cli_match_taint_source_of_string :
  string -> cli_match_taint_source
  (** Deserialize JSON data of type {!type:cli_match_taint_source}. *)

val write_api_scans_findings :
  Buffer.t -> api_scans_findings -> unit
  (** Output a JSON value of type {!type:api_scans_findings}. *)

val string_of_api_scans_findings :
  ?len:int -> api_scans_findings -> string
  (** Serialize a value of type {!type:api_scans_findings}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_api_scans_findings :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> api_scans_findings
  (** Input JSON data of type {!type:api_scans_findings}. *)

val api_scans_findings_of_string :
  string -> api_scans_findings
  (** Deserialize JSON data of type {!type:api_scans_findings}. *)

