(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type engine_kind = Semgrep_output_v1_t.engine_kind [@@deriving show]

type fpath = Semgrep_output_v1_t.fpath [@@deriving show]

type match_severity = Semgrep_output_v1_t.match_severity
  [@@deriving show, eq]

type matching_operation = Semgrep_output_v1_t.matching_operation = 
    And
  | Or
  | Inside
  | Anywhere
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
  path: fpath;
  start: position;
  end_ (*atd end *): position
}
  [@@deriving show]

type match_intermediate_var = Semgrep_output_v1_t.match_intermediate_var = {
  location: location;
  content: string
}

type raw_json = Yojson.Basic.t

type rule_id = Semgrep_output_v1_t.rule_id [@@deriving show]

type svalue_value = Semgrep_output_v1_t.svalue_value = {
  svalue_start: position option;
  svalue_end: position option;
  svalue_abstract_content: string
}

type metavar_value = Semgrep_output_v1_t.metavar_value = {
  start: position;
  end_ (*atd end *): position;
  abstract_content: string;
  propagated_value: svalue_value option
}

type metavars = Semgrep_output_v1_t.metavars

type validation_state = Semgrep_output_v1_t.validation_state
  [@@deriving show, eq]

type match_call_trace = Semgrep_output_v1_t.match_call_trace = 
    CliLoc of (location * string)
  | CliCall
      of (
          (location * string)
        * match_intermediate_var list
        * match_call_trace
      )


type match_dataflow_trace = Semgrep_output_v1_t.match_dataflow_trace = {
  taint_source: match_call_trace option;
  intermediate_vars: match_intermediate_var list option;
  taint_sink: match_call_trace option
}

type core_match_extra = Semgrep_output_v1_t.core_match_extra = {
  message: string option;
  metadata: raw_json option;
  severity: match_severity option;
  metavars: metavars;
  dataflow_trace: match_dataflow_trace option;
  rendered_fix: string option;
  engine_kind: engine_kind;
  validation_state: validation_state option;
  extra_extra: raw_json option
}

type core_match = Semgrep_output_v1_t.core_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: core_match_extra
}

type matching_explanation = Semgrep_output_v1_t.matching_explanation = {
  op: matching_operation;
  children: matching_explanation list;
  matches: core_match list;
  loc: location
}

type version = Semgrep_output_v1_t.version [@@deriving show]

type uuid = Semgrep_output_v1_t.uuid

type uri = Semgrep_output_v1_t.uri

type transitivity = Semgrep_output_v1_t.transitivity

type target_times = Semgrep_output_v1_t.target_times = {
  path: fpath;
  num_bytes: int;
  match_times: float list;
  parse_times: float list;
  run_time: float
}

type tag = Semgrep_output_v1_t.tag

type skip_reason = Semgrep_output_v1_t.skip_reason = 
    Always_skipped | Semgrepignore_patterns_match
  | Cli_include_flags_do_not_match | Cli_exclude_flags_match
  | Exceeded_size_limit | Analysis_failed_parser_or_internal_error
  | Excluded_by_config | Wrong_language | Too_big | Minified | Binary
  | Irrelevant_rule | Too_many_matches | Gitignore_patterns_match | Dotfile
  | Nonexistent_file

  [@@deriving show]

type skipped_target = Semgrep_output_v1_t.skipped_target = {
  path: fpath;
  reason: skip_reason;
  details: string option;
  rule_id: rule_id option
}
  [@@deriving show]

type skipped_rule = Semgrep_output_v1_t.skipped_rule = {
  rule_id: rule_id;
  details: string;
  position: position
}

type sha1 = Semgrep_output_v1_t.sha1

type scanned_and_skipped = Semgrep_output_v1_t.scanned_and_skipped = {
  scanned: fpath list;
  skipped: skipped_target list option
}

type product = Semgrep_output_v1_t.product [@@deriving show, eq]

type scan_info = Semgrep_output_v1_t.scan_info = {
  id: int option;
  enabled_products: product list;
  deployment_id: int;
  deployment_name: string
}

type scan_configuration = Semgrep_output_v1_t.scan_configuration = {
  rules: raw_json;
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list
}

type engine_configuration = Semgrep_output_v1_t.engine_configuration = {
  autofix: bool;
  ignored_files: string list;
  deepsemgrep: bool;
  dependency_query: bool;
  generic_slow_rollout: bool
}

type scan_response = Semgrep_output_v1_t.scan_response = {
  info: scan_info;
  config: scan_configuration;
  engine_params: engine_configuration
}

type scan_metadata = Semgrep_output_v1_t.scan_metadata = {
  cli_version: version;
  unique_id: uuid;
  requested_products: product list;
  dry_run: bool
}

type project_metadata = Semgrep_output_v1_t.project_metadata = {
  semgrep_version: version;
  scan_environment: string;
  repository: string;
  repo_url: uri option;
  repo_id: string option;
  org_id: string option;
  branch: string option;
  commit: sha1 option;
  commit_title: string option;
  commit_timestamp: string option;
  commit_author_email: string option;
  commit_author_name: string option;
  commit_author_username: string option;
  commit_author_image_url: uri option;
  ci_job_url: uri option;
  on: string;
  pull_request_author_username: string option;
  pull_request_author_image_url: uri option;
  pull_request_id: string option;
  pull_request_title: string option;
  base_sha: sha1 option;
  start_sha: sha1 option;
  is_full_scan: bool;
  is_sca_scan: bool option;
  is_code_scan: bool option;
  is_secrets_scan: bool option
}

type ci_config_from_repo = Semgrep_output_v1_t.ci_config_from_repo = {
  version: version;
  tags: tag list option
}

type scan_request = Semgrep_output_v1_t.scan_request = {
  meta: raw_json;
  project_metadata: project_metadata option;
  project_config: ci_config_from_repo option;
  scan_metadata: scan_metadata option
}

type ci_env = Semgrep_output_v1_t.ci_env

type ci_config = Semgrep_output_v1_t.ci_config = {
  env: ci_env;
  enabled_products: product list;
  ignored_files: string list;
  autofix: bool
}

type ci_config_from_cloud = Semgrep_output_v1_t.ci_config_from_cloud = {
  repo_config: ci_config;
  org_config: ci_config option;
  dirs_config: (fpath * ci_config) list option
}

type scan_config = Semgrep_output_v1_t.scan_config = {
  deployment_id: int;
  deployment_name: string;
  policy_names: string list;
  rule_config: string;
  ci_config_from_cloud: ci_config_from_cloud option;
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list;
  ignored_files: string list;
  enabled_products: product list option
}

type sca_parser_name = Semgrep_output_v1_t.sca_parser_name

type ecosystem = Semgrep_output_v1_t.ecosystem

type dependency_child = Semgrep_output_v1_t.dependency_child = {
  package: string;
  version: string
}

type found_dependency = Semgrep_output_v1_t.found_dependency = {
  package: string;
  version: string;
  ecosystem: ecosystem;
  allowed_hashes: (string * string list) list;
  resolved_url: string option;
  transitivity: transitivity;
  line_number: int option;
  children: dependency_child list option
}

type dependency_pattern = Semgrep_output_v1_t.dependency_pattern = {
  ecosystem: ecosystem;
  package: string;
  semver_range: string
}

type dependency_match = Semgrep_output_v1_t.dependency_match = {
  dependency_pattern: dependency_pattern;
  found_dependency: found_dependency;
  lockfile: string
}

type sca_info = Semgrep_output_v1_t.sca_info = {
  reachable: bool;
  reachability_rule: bool;
  sca_finding_schema: int;
  dependency_match: dependency_match
}

type rule_id_and_engine_kind = Semgrep_output_v1_t.rule_id_and_engine_kind

type profile = Semgrep_output_v1_t.profile = {
  rules: rule_id list;
  rules_parse_time: float;
  profiling_times: (string * float) list;
  targets: target_times list;
  total_bytes: int;
  max_memory_bytes: int option
}

type parsing_stats = Semgrep_output_v1_t.parsing_stats = {
  targets_parsed: int;
  num_targets: int;
  bytes_parsed: int;
  num_bytes: int
}

type incompatible_rule = Semgrep_output_v1_t.incompatible_rule = {
  rule_id: rule_id;
  this_version: version;
  min_version: version option;
  max_version: version option
}
  [@@deriving show]

type fix_regex = Semgrep_output_v1_t.fix_regex = {
  regex: string;
  replacement: string;
  count: int option
}

type finding_hashes = Semgrep_output_v1_t.finding_hashes = {
  start_line_hash: string;
  end_line_hash: string;
  code_hash: string;
  pattern_hash: string
}

type finding = Semgrep_output_v1_t.finding = {
  check_id: rule_id;
  path: fpath;
  line: int;
  column: int;
  end_line: int;
  end_column: int;
  message: string;
  severity: Yojson.Safe.t;
  index: int;
  commit_date: string;
  syntactic_id: string;
  match_based_id: string option;
  hashes: finding_hashes option;
  metadata: raw_json;
  is_blocking: bool;
  fixed_lines: string list option;
  sca_info: sca_info option;
  dataflow_trace: match_dataflow_trace option;
  validation_state: validation_state option
}

type error_type = Semgrep_output_v1_t.error_type = 
    LexicalError
  | ParseError
  | OtherParseError
  | AstBuilderError
  | RuleParseError
  | SemgrepError
  | InvalidRuleSchemaError
  | UnknownLanguageError
  | InvalidYaml
  | MatchingError
  | SemgrepMatchFound
  | TooManyMatches
  | FatalError
  | Timeout
  | OutOfMemory
  | TimeoutDuringInterfile
  | OutOfMemoryDuringInterfile
  | MissingPlugin
  | PatternParseError of string list
  | PartialParsing of location list
  | IncompatibleRule of incompatible_rule
  | PatternParseError0
  | IncompatibleRule0

  [@@deriving show]

type error_span = Semgrep_output_v1_t.error_span = {
  file: fpath;
  start: position;
  end_ (*atd end *): position;
  source_hash: string option;
  config_start: position option option;
  config_end: position option option;
  config_path: string list option option;
  context_start: position option option;
  context_end: position option option
}

type error_severity = Semgrep_output_v1_t.error_severity
  [@@deriving show, eq]

type deployment_config = Semgrep_output_v1_t.deployment_config = {
  id: int;
  name: string;
  organization_id: int;
  display_name: string;
  scm_name: string;
  slug: string;
  source_type: string;
  has_autofix: bool;
  has_deepsemgrep: bool;
  has_triage_via_comment: bool;
  has_dependency_query: bool;
  default_user_role: string
}
  [@@deriving show]

type deployment_response = Semgrep_output_v1_t.deployment_response = {
  deployment: deployment_config
}

type dependency_parser_error = Semgrep_output_v1_t.dependency_parser_error = {
  path: string;
  parser: sca_parser_name;
  reason: string;
  line: int option;
  col: int option;
  text: string option
}

type datetime = Semgrep_output_v1_t.datetime

type core_error = Semgrep_output_v1_t.core_error = {
  rule_id: rule_id option;
  error_type: error_type;
  severity: error_severity;
  location: location;
  message: string;
  details: string option
}

type core_output = Semgrep_output_v1_t.core_output = {
  version: version option;
  results: core_match list;
  errors: core_error list;
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  effective_interfile_languages: string list option;
  skipped_rules: skipped_rule list
}

type contributor = Semgrep_output_v1_t.contributor = {
  commit_author_name: string;
  commit_author_email: string
}

type contribution = Semgrep_output_v1_t.contribution = {
  commit_hash: string;
  commit_timestamp: string;
  contributor: contributor
}

type contributions = Semgrep_output_v1_t.contributions

type cli_output_extra = Semgrep_output_v1_t.cli_output_extra = {
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  effective_interfile_languages: string list option;
  skipped_rules: skipped_rule list
}

type cli_match_extra = Semgrep_output_v1_t.cli_match_extra = {
  metavars: metavars option;
  fingerprint: string;
  lines: string;
  message: string;
  metadata: raw_json;
  severity: match_severity;
  fix: string option;
  fix_regex: fix_regex option;
  is_ignored: bool option;
  sca_info: sca_info option;
  fixed_lines: string list option;
  dataflow_trace: match_dataflow_trace option;
  engine_kind: engine_kind option;
  validation_state: validation_state option;
  extra_extra: raw_json option
}

type cli_match = Semgrep_output_v1_t.cli_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: cli_match_extra
}

type cli_error = Semgrep_output_v1_t.cli_error = {
  code: int;
  level: error_severity;
  type_: error_type;
  rule_id: rule_id option;
  message: string option;
  path: fpath option;
  long_msg: string option;
  short_msg: string option;
  spans: error_span list option;
  help: string option
}

type cli_output = Semgrep_output_v1_t.cli_output = {
  version: version option;
  errors: cli_error list;
  results: cli_match list;
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  effective_interfile_languages: string list option;
  skipped_rules: skipped_rule list
}

type ci_scan_results_response_error =
  Semgrep_output_v1_t.ci_scan_results_response_error = {
  message: string
}
  [@@deriving show]

type ci_scan_results_response =
  Semgrep_output_v1_t.ci_scan_results_response = {
  errors: ci_scan_results_response_error list;
  task_id: string option
}
  [@@deriving show]

type ci_scan_dependencies = Semgrep_output_v1_t.ci_scan_dependencies

type ci_scan_results = Semgrep_output_v1_t.ci_scan_results = {
  findings: finding list;
  ignores: finding list;
  token: string option;
  searched_paths: fpath list;
  renamed_paths: fpath list;
  rule_ids: rule_id list;
  contributions: contributions option;
  dependencies: ci_scan_dependencies option
}

type ci_scan_failure = Semgrep_output_v1_t.ci_scan_failure = {
  exit_code: int;
  stderr: string
}

type ci_scan_complete_stats = Semgrep_output_v1_t.ci_scan_complete_stats = {
  findings: int;
  errors: cli_error list;
  total_time: float;
  unsupported_exts: (string * int) list;
  lockfile_scan_info: (string * int) list;
  parse_rate: (string * parsing_stats) list;
  engine_requested: string option
}

type ci_scan_complete_response =
  Semgrep_output_v1_t.ci_scan_complete_response = {
  success: bool;
  app_block_override: bool;
  app_block_reason: string
}
  [@@deriving show]

type ci_scan_complete = Semgrep_output_v1_t.ci_scan_complete = {
  exit_code: int;
  stats: ci_scan_complete_stats;
  dependencies: ci_scan_dependencies option;
  dependency_parser_errors: dependency_parser_error list option;
  task_id: string option;
  final_attempt: bool option
}

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

val write_fpath :
  Buffer.t -> fpath -> unit
  (** Output a JSON value of type {!type:fpath}. *)

val string_of_fpath :
  ?len:int -> fpath -> string
  (** Serialize a value of type {!type:fpath}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_fpath :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> fpath
  (** Input JSON data of type {!type:fpath}. *)

val fpath_of_string :
  string -> fpath
  (** Deserialize JSON data of type {!type:fpath}. *)

val write_match_severity :
  Buffer.t -> match_severity -> unit
  (** Output a JSON value of type {!type:match_severity}. *)

val string_of_match_severity :
  ?len:int -> match_severity -> string
  (** Serialize a value of type {!type:match_severity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_match_severity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> match_severity
  (** Input JSON data of type {!type:match_severity}. *)

val match_severity_of_string :
  string -> match_severity
  (** Deserialize JSON data of type {!type:match_severity}. *)

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

val write_match_intermediate_var :
  Buffer.t -> match_intermediate_var -> unit
  (** Output a JSON value of type {!type:match_intermediate_var}. *)

val string_of_match_intermediate_var :
  ?len:int -> match_intermediate_var -> string
  (** Serialize a value of type {!type:match_intermediate_var}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_match_intermediate_var :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> match_intermediate_var
  (** Input JSON data of type {!type:match_intermediate_var}. *)

val match_intermediate_var_of_string :
  string -> match_intermediate_var
  (** Deserialize JSON data of type {!type:match_intermediate_var}. *)

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

val write_validation_state :
  Buffer.t -> validation_state -> unit
  (** Output a JSON value of type {!type:validation_state}. *)

val string_of_validation_state :
  ?len:int -> validation_state -> string
  (** Serialize a value of type {!type:validation_state}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_validation_state :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> validation_state
  (** Input JSON data of type {!type:validation_state}. *)

val validation_state_of_string :
  string -> validation_state
  (** Deserialize JSON data of type {!type:validation_state}. *)

val write_match_call_trace :
  Buffer.t -> match_call_trace -> unit
  (** Output a JSON value of type {!type:match_call_trace}. *)

val string_of_match_call_trace :
  ?len:int -> match_call_trace -> string
  (** Serialize a value of type {!type:match_call_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_match_call_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> match_call_trace
  (** Input JSON data of type {!type:match_call_trace}. *)

val match_call_trace_of_string :
  string -> match_call_trace
  (** Deserialize JSON data of type {!type:match_call_trace}. *)

val write_match_dataflow_trace :
  Buffer.t -> match_dataflow_trace -> unit
  (** Output a JSON value of type {!type:match_dataflow_trace}. *)

val string_of_match_dataflow_trace :
  ?len:int -> match_dataflow_trace -> string
  (** Serialize a value of type {!type:match_dataflow_trace}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_match_dataflow_trace :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> match_dataflow_trace
  (** Input JSON data of type {!type:match_dataflow_trace}. *)

val match_dataflow_trace_of_string :
  string -> match_dataflow_trace
  (** Deserialize JSON data of type {!type:match_dataflow_trace}. *)

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

val write_uuid :
  Buffer.t -> uuid -> unit
  (** Output a JSON value of type {!type:uuid}. *)

val string_of_uuid :
  ?len:int -> uuid -> string
  (** Serialize a value of type {!type:uuid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_uuid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> uuid
  (** Input JSON data of type {!type:uuid}. *)

val uuid_of_string :
  string -> uuid
  (** Deserialize JSON data of type {!type:uuid}. *)

val write_uri :
  Buffer.t -> uri -> unit
  (** Output a JSON value of type {!type:uri}. *)

val string_of_uri :
  ?len:int -> uri -> string
  (** Serialize a value of type {!type:uri}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_uri :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> uri
  (** Input JSON data of type {!type:uri}. *)

val uri_of_string :
  string -> uri
  (** Deserialize JSON data of type {!type:uri}. *)

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

val write_target_times :
  Buffer.t -> target_times -> unit
  (** Output a JSON value of type {!type:target_times}. *)

val string_of_target_times :
  ?len:int -> target_times -> string
  (** Serialize a value of type {!type:target_times}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_target_times :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> target_times
  (** Input JSON data of type {!type:target_times}. *)

val target_times_of_string :
  string -> target_times
  (** Deserialize JSON data of type {!type:target_times}. *)

val write_tag :
  Buffer.t -> tag -> unit
  (** Output a JSON value of type {!type:tag}. *)

val string_of_tag :
  ?len:int -> tag -> string
  (** Serialize a value of type {!type:tag}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tag :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tag
  (** Input JSON data of type {!type:tag}. *)

val tag_of_string :
  string -> tag
  (** Deserialize JSON data of type {!type:tag}. *)

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

val write_sha1 :
  Buffer.t -> sha1 -> unit
  (** Output a JSON value of type {!type:sha1}. *)

val string_of_sha1 :
  ?len:int -> sha1 -> string
  (** Serialize a value of type {!type:sha1}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sha1 :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sha1
  (** Input JSON data of type {!type:sha1}. *)

val sha1_of_string :
  string -> sha1
  (** Deserialize JSON data of type {!type:sha1}. *)

val write_scanned_and_skipped :
  Buffer.t -> scanned_and_skipped -> unit
  (** Output a JSON value of type {!type:scanned_and_skipped}. *)

val string_of_scanned_and_skipped :
  ?len:int -> scanned_and_skipped -> string
  (** Serialize a value of type {!type:scanned_and_skipped}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scanned_and_skipped :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scanned_and_skipped
  (** Input JSON data of type {!type:scanned_and_skipped}. *)

val scanned_and_skipped_of_string :
  string -> scanned_and_skipped
  (** Deserialize JSON data of type {!type:scanned_and_skipped}. *)

val write_product :
  Buffer.t -> product -> unit
  (** Output a JSON value of type {!type:product}. *)

val string_of_product :
  ?len:int -> product -> string
  (** Serialize a value of type {!type:product}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_product :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> product
  (** Input JSON data of type {!type:product}. *)

val product_of_string :
  string -> product
  (** Deserialize JSON data of type {!type:product}. *)

val write_scan_info :
  Buffer.t -> scan_info -> unit
  (** Output a JSON value of type {!type:scan_info}. *)

val string_of_scan_info :
  ?len:int -> scan_info -> string
  (** Serialize a value of type {!type:scan_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_info
  (** Input JSON data of type {!type:scan_info}. *)

val scan_info_of_string :
  string -> scan_info
  (** Deserialize JSON data of type {!type:scan_info}. *)

val write_scan_configuration :
  Buffer.t -> scan_configuration -> unit
  (** Output a JSON value of type {!type:scan_configuration}. *)

val string_of_scan_configuration :
  ?len:int -> scan_configuration -> string
  (** Serialize a value of type {!type:scan_configuration}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_configuration :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_configuration
  (** Input JSON data of type {!type:scan_configuration}. *)

val scan_configuration_of_string :
  string -> scan_configuration
  (** Deserialize JSON data of type {!type:scan_configuration}. *)

val write_engine_configuration :
  Buffer.t -> engine_configuration -> unit
  (** Output a JSON value of type {!type:engine_configuration}. *)

val string_of_engine_configuration :
  ?len:int -> engine_configuration -> string
  (** Serialize a value of type {!type:engine_configuration}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_engine_configuration :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> engine_configuration
  (** Input JSON data of type {!type:engine_configuration}. *)

val engine_configuration_of_string :
  string -> engine_configuration
  (** Deserialize JSON data of type {!type:engine_configuration}. *)

val write_scan_response :
  Buffer.t -> scan_response -> unit
  (** Output a JSON value of type {!type:scan_response}. *)

val string_of_scan_response :
  ?len:int -> scan_response -> string
  (** Serialize a value of type {!type:scan_response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_response
  (** Input JSON data of type {!type:scan_response}. *)

val scan_response_of_string :
  string -> scan_response
  (** Deserialize JSON data of type {!type:scan_response}. *)

val write_scan_metadata :
  Buffer.t -> scan_metadata -> unit
  (** Output a JSON value of type {!type:scan_metadata}. *)

val string_of_scan_metadata :
  ?len:int -> scan_metadata -> string
  (** Serialize a value of type {!type:scan_metadata}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_metadata :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_metadata
  (** Input JSON data of type {!type:scan_metadata}. *)

val scan_metadata_of_string :
  string -> scan_metadata
  (** Deserialize JSON data of type {!type:scan_metadata}. *)

val write_project_metadata :
  Buffer.t -> project_metadata -> unit
  (** Output a JSON value of type {!type:project_metadata}. *)

val string_of_project_metadata :
  ?len:int -> project_metadata -> string
  (** Serialize a value of type {!type:project_metadata}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_project_metadata :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> project_metadata
  (** Input JSON data of type {!type:project_metadata}. *)

val project_metadata_of_string :
  string -> project_metadata
  (** Deserialize JSON data of type {!type:project_metadata}. *)

val write_ci_config_from_repo :
  Buffer.t -> ci_config_from_repo -> unit
  (** Output a JSON value of type {!type:ci_config_from_repo}. *)

val string_of_ci_config_from_repo :
  ?len:int -> ci_config_from_repo -> string
  (** Serialize a value of type {!type:ci_config_from_repo}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_config_from_repo :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_config_from_repo
  (** Input JSON data of type {!type:ci_config_from_repo}. *)

val ci_config_from_repo_of_string :
  string -> ci_config_from_repo
  (** Deserialize JSON data of type {!type:ci_config_from_repo}. *)

val write_scan_request :
  Buffer.t -> scan_request -> unit
  (** Output a JSON value of type {!type:scan_request}. *)

val string_of_scan_request :
  ?len:int -> scan_request -> string
  (** Serialize a value of type {!type:scan_request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_request
  (** Input JSON data of type {!type:scan_request}. *)

val scan_request_of_string :
  string -> scan_request
  (** Deserialize JSON data of type {!type:scan_request}. *)

val write_ci_env :
  Buffer.t -> ci_env -> unit
  (** Output a JSON value of type {!type:ci_env}. *)

val string_of_ci_env :
  ?len:int -> ci_env -> string
  (** Serialize a value of type {!type:ci_env}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_env :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_env
  (** Input JSON data of type {!type:ci_env}. *)

val ci_env_of_string :
  string -> ci_env
  (** Deserialize JSON data of type {!type:ci_env}. *)

val write_ci_config :
  Buffer.t -> ci_config -> unit
  (** Output a JSON value of type {!type:ci_config}. *)

val string_of_ci_config :
  ?len:int -> ci_config -> string
  (** Serialize a value of type {!type:ci_config}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_config :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_config
  (** Input JSON data of type {!type:ci_config}. *)

val ci_config_of_string :
  string -> ci_config
  (** Deserialize JSON data of type {!type:ci_config}. *)

val write_ci_config_from_cloud :
  Buffer.t -> ci_config_from_cloud -> unit
  (** Output a JSON value of type {!type:ci_config_from_cloud}. *)

val string_of_ci_config_from_cloud :
  ?len:int -> ci_config_from_cloud -> string
  (** Serialize a value of type {!type:ci_config_from_cloud}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_config_from_cloud :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_config_from_cloud
  (** Input JSON data of type {!type:ci_config_from_cloud}. *)

val ci_config_from_cloud_of_string :
  string -> ci_config_from_cloud
  (** Deserialize JSON data of type {!type:ci_config_from_cloud}. *)

val write_scan_config :
  Buffer.t -> scan_config -> unit
  (** Output a JSON value of type {!type:scan_config}. *)

val string_of_scan_config :
  ?len:int -> scan_config -> string
  (** Serialize a value of type {!type:scan_config}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scan_config :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scan_config
  (** Input JSON data of type {!type:scan_config}. *)

val scan_config_of_string :
  string -> scan_config
  (** Deserialize JSON data of type {!type:scan_config}. *)

val write_sca_parser_name :
  Buffer.t -> sca_parser_name -> unit
  (** Output a JSON value of type {!type:sca_parser_name}. *)

val string_of_sca_parser_name :
  ?len:int -> sca_parser_name -> string
  (** Serialize a value of type {!type:sca_parser_name}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_parser_name :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_parser_name
  (** Input JSON data of type {!type:sca_parser_name}. *)

val sca_parser_name_of_string :
  string -> sca_parser_name
  (** Deserialize JSON data of type {!type:sca_parser_name}. *)

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

val write_dependency_child :
  Buffer.t -> dependency_child -> unit
  (** Output a JSON value of type {!type:dependency_child}. *)

val string_of_dependency_child :
  ?len:int -> dependency_child -> string
  (** Serialize a value of type {!type:dependency_child}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_child :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_child
  (** Input JSON data of type {!type:dependency_child}. *)

val dependency_child_of_string :
  string -> dependency_child
  (** Deserialize JSON data of type {!type:dependency_child}. *)

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

val write_profile :
  Buffer.t -> profile -> unit
  (** Output a JSON value of type {!type:profile}. *)

val string_of_profile :
  ?len:int -> profile -> string
  (** Serialize a value of type {!type:profile}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_profile :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> profile
  (** Input JSON data of type {!type:profile}. *)

val profile_of_string :
  string -> profile
  (** Deserialize JSON data of type {!type:profile}. *)

val write_parsing_stats :
  Buffer.t -> parsing_stats -> unit
  (** Output a JSON value of type {!type:parsing_stats}. *)

val string_of_parsing_stats :
  ?len:int -> parsing_stats -> string
  (** Serialize a value of type {!type:parsing_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_parsing_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> parsing_stats
  (** Input JSON data of type {!type:parsing_stats}. *)

val parsing_stats_of_string :
  string -> parsing_stats
  (** Deserialize JSON data of type {!type:parsing_stats}. *)

val write_incompatible_rule :
  Buffer.t -> incompatible_rule -> unit
  (** Output a JSON value of type {!type:incompatible_rule}. *)

val string_of_incompatible_rule :
  ?len:int -> incompatible_rule -> string
  (** Serialize a value of type {!type:incompatible_rule}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_incompatible_rule :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> incompatible_rule
  (** Input JSON data of type {!type:incompatible_rule}. *)

val incompatible_rule_of_string :
  string -> incompatible_rule
  (** Deserialize JSON data of type {!type:incompatible_rule}. *)

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

val write_error_type :
  Buffer.t -> error_type -> unit
  (** Output a JSON value of type {!type:error_type}. *)

val string_of_error_type :
  ?len:int -> error_type -> string
  (** Serialize a value of type {!type:error_type}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error_type :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error_type
  (** Input JSON data of type {!type:error_type}. *)

val error_type_of_string :
  string -> error_type
  (** Deserialize JSON data of type {!type:error_type}. *)

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

val write_error_severity :
  Buffer.t -> error_severity -> unit
  (** Output a JSON value of type {!type:error_severity}. *)

val string_of_error_severity :
  ?len:int -> error_severity -> string
  (** Serialize a value of type {!type:error_severity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error_severity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error_severity
  (** Input JSON data of type {!type:error_severity}. *)

val error_severity_of_string :
  string -> error_severity
  (** Deserialize JSON data of type {!type:error_severity}. *)

val write_deployment_config :
  Buffer.t -> deployment_config -> unit
  (** Output a JSON value of type {!type:deployment_config}. *)

val string_of_deployment_config :
  ?len:int -> deployment_config -> string
  (** Serialize a value of type {!type:deployment_config}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_deployment_config :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> deployment_config
  (** Input JSON data of type {!type:deployment_config}. *)

val deployment_config_of_string :
  string -> deployment_config
  (** Deserialize JSON data of type {!type:deployment_config}. *)

val write_deployment_response :
  Buffer.t -> deployment_response -> unit
  (** Output a JSON value of type {!type:deployment_response}. *)

val string_of_deployment_response :
  ?len:int -> deployment_response -> string
  (** Serialize a value of type {!type:deployment_response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_deployment_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> deployment_response
  (** Input JSON data of type {!type:deployment_response}. *)

val deployment_response_of_string :
  string -> deployment_response
  (** Deserialize JSON data of type {!type:deployment_response}. *)

val write_dependency_parser_error :
  Buffer.t -> dependency_parser_error -> unit
  (** Output a JSON value of type {!type:dependency_parser_error}. *)

val string_of_dependency_parser_error :
  ?len:int -> dependency_parser_error -> string
  (** Serialize a value of type {!type:dependency_parser_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_parser_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_parser_error
  (** Input JSON data of type {!type:dependency_parser_error}. *)

val dependency_parser_error_of_string :
  string -> dependency_parser_error
  (** Deserialize JSON data of type {!type:dependency_parser_error}. *)

val write_datetime :
  Buffer.t -> datetime -> unit
  (** Output a JSON value of type {!type:datetime}. *)

val string_of_datetime :
  ?len:int -> datetime -> string
  (** Serialize a value of type {!type:datetime}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_datetime :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> datetime
  (** Input JSON data of type {!type:datetime}. *)

val datetime_of_string :
  string -> datetime
  (** Deserialize JSON data of type {!type:datetime}. *)

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

val write_core_output :
  Buffer.t -> core_output -> unit
  (** Output a JSON value of type {!type:core_output}. *)

val string_of_core_output :
  ?len:int -> core_output -> string
  (** Serialize a value of type {!type:core_output}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_output :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_output
  (** Input JSON data of type {!type:core_output}. *)

val core_output_of_string :
  string -> core_output
  (** Deserialize JSON data of type {!type:core_output}. *)

val write_contributor :
  Buffer.t -> contributor -> unit
  (** Output a JSON value of type {!type:contributor}. *)

val string_of_contributor :
  ?len:int -> contributor -> string
  (** Serialize a value of type {!type:contributor}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_contributor :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> contributor
  (** Input JSON data of type {!type:contributor}. *)

val contributor_of_string :
  string -> contributor
  (** Deserialize JSON data of type {!type:contributor}. *)

val write_contribution :
  Buffer.t -> contribution -> unit
  (** Output a JSON value of type {!type:contribution}. *)

val string_of_contribution :
  ?len:int -> contribution -> string
  (** Serialize a value of type {!type:contribution}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_contribution :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> contribution
  (** Input JSON data of type {!type:contribution}. *)

val contribution_of_string :
  string -> contribution
  (** Deserialize JSON data of type {!type:contribution}. *)

val write_contributions :
  Buffer.t -> contributions -> unit
  (** Output a JSON value of type {!type:contributions}. *)

val string_of_contributions :
  ?len:int -> contributions -> string
  (** Serialize a value of type {!type:contributions}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_contributions :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> contributions
  (** Input JSON data of type {!type:contributions}. *)

val contributions_of_string :
  string -> contributions
  (** Deserialize JSON data of type {!type:contributions}. *)

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

val write_ci_scan_results_response_error :
  Buffer.t -> ci_scan_results_response_error -> unit
  (** Output a JSON value of type {!type:ci_scan_results_response_error}. *)

val string_of_ci_scan_results_response_error :
  ?len:int -> ci_scan_results_response_error -> string
  (** Serialize a value of type {!type:ci_scan_results_response_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_results_response_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_results_response_error
  (** Input JSON data of type {!type:ci_scan_results_response_error}. *)

val ci_scan_results_response_error_of_string :
  string -> ci_scan_results_response_error
  (** Deserialize JSON data of type {!type:ci_scan_results_response_error}. *)

val write_ci_scan_results_response :
  Buffer.t -> ci_scan_results_response -> unit
  (** Output a JSON value of type {!type:ci_scan_results_response}. *)

val string_of_ci_scan_results_response :
  ?len:int -> ci_scan_results_response -> string
  (** Serialize a value of type {!type:ci_scan_results_response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_results_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_results_response
  (** Input JSON data of type {!type:ci_scan_results_response}. *)

val ci_scan_results_response_of_string :
  string -> ci_scan_results_response
  (** Deserialize JSON data of type {!type:ci_scan_results_response}. *)

val write_ci_scan_dependencies :
  Buffer.t -> ci_scan_dependencies -> unit
  (** Output a JSON value of type {!type:ci_scan_dependencies}. *)

val string_of_ci_scan_dependencies :
  ?len:int -> ci_scan_dependencies -> string
  (** Serialize a value of type {!type:ci_scan_dependencies}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_dependencies :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_dependencies
  (** Input JSON data of type {!type:ci_scan_dependencies}. *)

val ci_scan_dependencies_of_string :
  string -> ci_scan_dependencies
  (** Deserialize JSON data of type {!type:ci_scan_dependencies}. *)

val write_ci_scan_results :
  Buffer.t -> ci_scan_results -> unit
  (** Output a JSON value of type {!type:ci_scan_results}. *)

val string_of_ci_scan_results :
  ?len:int -> ci_scan_results -> string
  (** Serialize a value of type {!type:ci_scan_results}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_results :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_results
  (** Input JSON data of type {!type:ci_scan_results}. *)

val ci_scan_results_of_string :
  string -> ci_scan_results
  (** Deserialize JSON data of type {!type:ci_scan_results}. *)

val write_ci_scan_failure :
  Buffer.t -> ci_scan_failure -> unit
  (** Output a JSON value of type {!type:ci_scan_failure}. *)

val string_of_ci_scan_failure :
  ?len:int -> ci_scan_failure -> string
  (** Serialize a value of type {!type:ci_scan_failure}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_failure :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_failure
  (** Input JSON data of type {!type:ci_scan_failure}. *)

val ci_scan_failure_of_string :
  string -> ci_scan_failure
  (** Deserialize JSON data of type {!type:ci_scan_failure}. *)

val write_ci_scan_complete_stats :
  Buffer.t -> ci_scan_complete_stats -> unit
  (** Output a JSON value of type {!type:ci_scan_complete_stats}. *)

val string_of_ci_scan_complete_stats :
  ?len:int -> ci_scan_complete_stats -> string
  (** Serialize a value of type {!type:ci_scan_complete_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_complete_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_complete_stats
  (** Input JSON data of type {!type:ci_scan_complete_stats}. *)

val ci_scan_complete_stats_of_string :
  string -> ci_scan_complete_stats
  (** Deserialize JSON data of type {!type:ci_scan_complete_stats}. *)

val write_ci_scan_complete_response :
  Buffer.t -> ci_scan_complete_response -> unit
  (** Output a JSON value of type {!type:ci_scan_complete_response}. *)

val string_of_ci_scan_complete_response :
  ?len:int -> ci_scan_complete_response -> string
  (** Serialize a value of type {!type:ci_scan_complete_response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_complete_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_complete_response
  (** Input JSON data of type {!type:ci_scan_complete_response}. *)

val ci_scan_complete_response_of_string :
  string -> ci_scan_complete_response
  (** Deserialize JSON data of type {!type:ci_scan_complete_response}. *)

val write_ci_scan_complete :
  Buffer.t -> ci_scan_complete -> unit
  (** Output a JSON value of type {!type:ci_scan_complete}. *)

val string_of_ci_scan_complete :
  ?len:int -> ci_scan_complete -> string
  (** Serialize a value of type {!type:ci_scan_complete}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ci_scan_complete :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ci_scan_complete
  (** Input JSON data of type {!type:ci_scan_complete}. *)

val ci_scan_complete_of_string :
  string -> ci_scan_complete
  (** Deserialize JSON data of type {!type:ci_scan_complete}. *)

