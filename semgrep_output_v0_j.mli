(* Auto-generated from "semgrep_output_v0.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type unique_id_type = Semgrep_output_v0_t.unique_id_type

type unique_id = Semgrep_output_v0_t.unique_id = {
  type_: unique_id_type;
  md5sum: string option;
  sid: int option
}

type rule_id = Semgrep_output_v0_t.rule_id

type rule_times = Semgrep_output_v0_t.rule_times = {
  rule_id: rule_id;
  parse_time: float;
  match_time: float
}

type target_time = Semgrep_output_v0_t.target_time = {
  path: string;
  rule_times: rule_times list;
  run_time: float
}

type position = Semgrep_output_v0_t.position = {
  line: int;
  col: int;
  offset: int
}

type svalue_value = Semgrep_output_v0_t.svalue_value = {
  svalue_start: position option;
  svalue_end: position option;
  svalue_abstract_content: string
}

type skip_reason = Semgrep_output_v0_t.skip_reason = 
    Excluded_by_config | Wrong_language | Too_big | Minified | Binary
  | Irrelevant_rule | Too_many_matches


type skipped_target = Semgrep_output_v0_t.skipped_target = {
  path: string;
  reason: skip_reason;
  details: string;
  rule_id: rule_id option
}

type skipped_rule = Semgrep_output_v0_t.skipped_rule = {
  rule_id: rule_id;
  details: string;
  position: position
}

type semver = Semgrep_output_v0_t.semver

type raw_json = Yojson.Safe.t

type sca_info = Semgrep_output_v0_t.sca_info = {
  dependency_match_only: bool;
  dependency_matches: raw_json
}

type rule_id_dict = Semgrep_output_v0_t.rule_id_dict = { id: rule_id }

type position_bis = Semgrep_output_v0_t.position_bis = {
  line: int;
  col: int
}

type metavar_value = Semgrep_output_v0_t.metavar_value = {
  start: position;
  end_ (*atd end *): position;
  abstract_content: string;
  propagated_value: svalue_value option;
  unique_id: unique_id
}

type metavars = Semgrep_output_v0_t.metavars

type location = Semgrep_output_v0_t.location = {
  path: string;
  start: position;
  end_ (*atd end *): position
}

type fix_regex = Semgrep_output_v0_t.fix_regex = {
  regex: string;
  replacement: string;
  count: int option
}

type finding = Semgrep_output_v0_t.finding = {
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
  metadata: raw_json;
  is_blocking: bool;
  fixed_lines: string list option;
  sca_info: sca_info option
}

type error_span = Semgrep_output_v0_t.error_span = {
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

type cve_result = Semgrep_output_v0_t.cve_result = {
  url: string;
  filename: string;
  funcnames: string list
}

type cve_results = Semgrep_output_v0_t.cve_results

type core_timing = Semgrep_output_v0_t.core_timing = {
  targets: target_time list;
  rules: rule_id list;
  rules_parse_time: float option
}

type core_stats = Semgrep_output_v0_t.core_stats = {
  okfiles: int;
  errorfiles: int
}

type core_severity = Semgrep_output_v0_t.core_severity =  Error | Warning 

type core_match_extra = Semgrep_output_v0_t.core_match_extra = {
  message: string option;
  metavars: metavars
}

type core_match = Semgrep_output_v0_t.core_match = {
  rule_id: rule_id;
  location: location;
  extra: core_match_extra
}

type core_error_kind = Semgrep_output_v0_t.core_error_kind = 
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
  | PartialParsing of location list


type core_error = Semgrep_output_v0_t.core_error = {
  rule_id: rule_id option;
  error_type: core_error_kind;
  severity: core_severity;
  location: location;
  message: string;
  details: string option
}

type core_match_results = Semgrep_output_v0_t.core_match_results = {
  matches: core_match list;
  errors: core_error list;
  skipped_targets: skipped_target list;
  skipped_rules: skipped_rule list option;
  stats: core_stats;
  time: core_timing option
}

type cli_target_times = Semgrep_output_v0_t.cli_target_times = {
  path: string;
  num_bytes: int;
  match_times: float list;
  parse_times: float list;
  run_time: float
}

type cli_timing = Semgrep_output_v0_t.cli_timing = {
  rules: rule_id_dict list;
  rules_parse_time: float;
  profiling_times: (string * float) list;
  targets: cli_target_times list;
  total_bytes: int
}

type cli_skipped_target = Semgrep_output_v0_t.cli_skipped_target = {
  path: string;
  reason: string
}

type cli_paths = Semgrep_output_v0_t.cli_paths = {
  scanned: string list;
  _comment: string option;
  skipped: cli_skipped_target list option
}

type cli_output_extra = Semgrep_output_v0_t.cli_output_extra = {
  paths: cli_paths;
  time: cli_timing option
}

type cli_match_extra = Semgrep_output_v0_t.cli_match_extra = {
  metavars: metavars option;
  fingerprint: string;
  lines: string;
  message: string;
  metadata: raw_json;
  severity: string;
  fix: string option;
  fix_regex: fix_regex option;
  is_ignored: bool option;
  dependency_match_only: bool option;
  dependency_matches: raw_json option;
  fixed_lines: string list option
}

type cli_match = Semgrep_output_v0_t.cli_match = {
  check_id: rule_id;
  path: string;
  start: position;
  end_ (*atd end *): position;
  extra: cli_match_extra
}

type cli_error = Semgrep_output_v0_t.cli_error = {
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

type cli_output = Semgrep_output_v0_t.cli_output = {
  version: semver option;
  errors: cli_error list;
  results: cli_match list;
  paths: cli_paths;
  time: cli_timing option
}

type api_scans_findings = Semgrep_output_v0_t.api_scans_findings = {
  findings: finding list;
  token: string option;
  gitlab_token: string option;
  searched_paths: string list;
  rule_ids: string list;
  cai_ids: string list
}

val write_unique_id_type :
  Bi_outbuf.t -> unique_id_type -> unit
  (** Output a JSON value of type {!unique_id_type}. *)

val string_of_unique_id_type :
  ?len:int -> unique_id_type -> string
  (** Serialize a value of type {!unique_id_type}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unique_id_type :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unique_id_type
  (** Input JSON data of type {!unique_id_type}. *)

val unique_id_type_of_string :
  string -> unique_id_type
  (** Deserialize JSON data of type {!unique_id_type}. *)

val write_unique_id :
  Bi_outbuf.t -> unique_id -> unit
  (** Output a JSON value of type {!unique_id}. *)

val string_of_unique_id :
  ?len:int -> unique_id -> string
  (** Serialize a value of type {!unique_id}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unique_id :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unique_id
  (** Input JSON data of type {!unique_id}. *)

val unique_id_of_string :
  string -> unique_id
  (** Deserialize JSON data of type {!unique_id}. *)

val write_rule_id :
  Bi_outbuf.t -> rule_id -> unit
  (** Output a JSON value of type {!rule_id}. *)

val string_of_rule_id :
  ?len:int -> rule_id -> string
  (** Serialize a value of type {!rule_id}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_id :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_id
  (** Input JSON data of type {!rule_id}. *)

val rule_id_of_string :
  string -> rule_id
  (** Deserialize JSON data of type {!rule_id}. *)

val write_rule_times :
  Bi_outbuf.t -> rule_times -> unit
  (** Output a JSON value of type {!rule_times}. *)

val string_of_rule_times :
  ?len:int -> rule_times -> string
  (** Serialize a value of type {!rule_times}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_times :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_times
  (** Input JSON data of type {!rule_times}. *)

val rule_times_of_string :
  string -> rule_times
  (** Deserialize JSON data of type {!rule_times}. *)

val write_target_time :
  Bi_outbuf.t -> target_time -> unit
  (** Output a JSON value of type {!target_time}. *)

val string_of_target_time :
  ?len:int -> target_time -> string
  (** Serialize a value of type {!target_time}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_target_time :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> target_time
  (** Input JSON data of type {!target_time}. *)

val target_time_of_string :
  string -> target_time
  (** Deserialize JSON data of type {!target_time}. *)

val write_position :
  Bi_outbuf.t -> position -> unit
  (** Output a JSON value of type {!position}. *)

val string_of_position :
  ?len:int -> position -> string
  (** Serialize a value of type {!position}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_position :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> position
  (** Input JSON data of type {!position}. *)

val position_of_string :
  string -> position
  (** Deserialize JSON data of type {!position}. *)

val write_svalue_value :
  Bi_outbuf.t -> svalue_value -> unit
  (** Output a JSON value of type {!svalue_value}. *)

val string_of_svalue_value :
  ?len:int -> svalue_value -> string
  (** Serialize a value of type {!svalue_value}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_svalue_value :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> svalue_value
  (** Input JSON data of type {!svalue_value}. *)

val svalue_value_of_string :
  string -> svalue_value
  (** Deserialize JSON data of type {!svalue_value}. *)

val write_skip_reason :
  Bi_outbuf.t -> skip_reason -> unit
  (** Output a JSON value of type {!skip_reason}. *)

val string_of_skip_reason :
  ?len:int -> skip_reason -> string
  (** Serialize a value of type {!skip_reason}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skip_reason :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skip_reason
  (** Input JSON data of type {!skip_reason}. *)

val skip_reason_of_string :
  string -> skip_reason
  (** Deserialize JSON data of type {!skip_reason}. *)

val write_skipped_target :
  Bi_outbuf.t -> skipped_target -> unit
  (** Output a JSON value of type {!skipped_target}. *)

val string_of_skipped_target :
  ?len:int -> skipped_target -> string
  (** Serialize a value of type {!skipped_target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skipped_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skipped_target
  (** Input JSON data of type {!skipped_target}. *)

val skipped_target_of_string :
  string -> skipped_target
  (** Deserialize JSON data of type {!skipped_target}. *)

val write_skipped_rule :
  Bi_outbuf.t -> skipped_rule -> unit
  (** Output a JSON value of type {!skipped_rule}. *)

val string_of_skipped_rule :
  ?len:int -> skipped_rule -> string
  (** Serialize a value of type {!skipped_rule}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_skipped_rule :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> skipped_rule
  (** Input JSON data of type {!skipped_rule}. *)

val skipped_rule_of_string :
  string -> skipped_rule
  (** Deserialize JSON data of type {!skipped_rule}. *)

val write_semver :
  Bi_outbuf.t -> semver -> unit
  (** Output a JSON value of type {!semver}. *)

val string_of_semver :
  ?len:int -> semver -> string
  (** Serialize a value of type {!semver}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_semver :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> semver
  (** Input JSON data of type {!semver}. *)

val semver_of_string :
  string -> semver
  (** Deserialize JSON data of type {!semver}. *)

val write_raw_json :
  Bi_outbuf.t -> raw_json -> unit
  (** Output a JSON value of type {!raw_json}. *)

val string_of_raw_json :
  ?len:int -> raw_json -> string
  (** Serialize a value of type {!raw_json}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_raw_json :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> raw_json
  (** Input JSON data of type {!raw_json}. *)

val raw_json_of_string :
  string -> raw_json
  (** Deserialize JSON data of type {!raw_json}. *)

val write_sca_info :
  Bi_outbuf.t -> sca_info -> unit
  (** Output a JSON value of type {!sca_info}. *)

val string_of_sca_info :
  ?len:int -> sca_info -> string
  (** Serialize a value of type {!sca_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_info
  (** Input JSON data of type {!sca_info}. *)

val sca_info_of_string :
  string -> sca_info
  (** Deserialize JSON data of type {!sca_info}. *)

val write_rule_id_dict :
  Bi_outbuf.t -> rule_id_dict -> unit
  (** Output a JSON value of type {!rule_id_dict}. *)

val string_of_rule_id_dict :
  ?len:int -> rule_id_dict -> string
  (** Serialize a value of type {!rule_id_dict}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_id_dict :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_id_dict
  (** Input JSON data of type {!rule_id_dict}. *)

val rule_id_dict_of_string :
  string -> rule_id_dict
  (** Deserialize JSON data of type {!rule_id_dict}. *)

val write_position_bis :
  Bi_outbuf.t -> position_bis -> unit
  (** Output a JSON value of type {!position_bis}. *)

val string_of_position_bis :
  ?len:int -> position_bis -> string
  (** Serialize a value of type {!position_bis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_position_bis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> position_bis
  (** Input JSON data of type {!position_bis}. *)

val position_bis_of_string :
  string -> position_bis
  (** Deserialize JSON data of type {!position_bis}. *)

val write_metavar_value :
  Bi_outbuf.t -> metavar_value -> unit
  (** Output a JSON value of type {!metavar_value}. *)

val string_of_metavar_value :
  ?len:int -> metavar_value -> string
  (** Serialize a value of type {!metavar_value}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_metavar_value :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> metavar_value
  (** Input JSON data of type {!metavar_value}. *)

val metavar_value_of_string :
  string -> metavar_value
  (** Deserialize JSON data of type {!metavar_value}. *)

val write_metavars :
  Bi_outbuf.t -> metavars -> unit
  (** Output a JSON value of type {!metavars}. *)

val string_of_metavars :
  ?len:int -> metavars -> string
  (** Serialize a value of type {!metavars}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_metavars :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> metavars
  (** Input JSON data of type {!metavars}. *)

val metavars_of_string :
  string -> metavars
  (** Deserialize JSON data of type {!metavars}. *)

val write_location :
  Bi_outbuf.t -> location -> unit
  (** Output a JSON value of type {!location}. *)

val string_of_location :
  ?len:int -> location -> string
  (** Serialize a value of type {!location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> location
  (** Input JSON data of type {!location}. *)

val location_of_string :
  string -> location
  (** Deserialize JSON data of type {!location}. *)

val write_fix_regex :
  Bi_outbuf.t -> fix_regex -> unit
  (** Output a JSON value of type {!fix_regex}. *)

val string_of_fix_regex :
  ?len:int -> fix_regex -> string
  (** Serialize a value of type {!fix_regex}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_fix_regex :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> fix_regex
  (** Input JSON data of type {!fix_regex}. *)

val fix_regex_of_string :
  string -> fix_regex
  (** Deserialize JSON data of type {!fix_regex}. *)

val write_finding :
  Bi_outbuf.t -> finding -> unit
  (** Output a JSON value of type {!finding}. *)

val string_of_finding :
  ?len:int -> finding -> string
  (** Serialize a value of type {!finding}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_finding :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> finding
  (** Input JSON data of type {!finding}. *)

val finding_of_string :
  string -> finding
  (** Deserialize JSON data of type {!finding}. *)

val write_error_span :
  Bi_outbuf.t -> error_span -> unit
  (** Output a JSON value of type {!error_span}. *)

val string_of_error_span :
  ?len:int -> error_span -> string
  (** Serialize a value of type {!error_span}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error_span :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error_span
  (** Input JSON data of type {!error_span}. *)

val error_span_of_string :
  string -> error_span
  (** Deserialize JSON data of type {!error_span}. *)

val write_cve_result :
  Bi_outbuf.t -> cve_result -> unit
  (** Output a JSON value of type {!cve_result}. *)

val string_of_cve_result :
  ?len:int -> cve_result -> string
  (** Serialize a value of type {!cve_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cve_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cve_result
  (** Input JSON data of type {!cve_result}. *)

val cve_result_of_string :
  string -> cve_result
  (** Deserialize JSON data of type {!cve_result}. *)

val write_cve_results :
  Bi_outbuf.t -> cve_results -> unit
  (** Output a JSON value of type {!cve_results}. *)

val string_of_cve_results :
  ?len:int -> cve_results -> string
  (** Serialize a value of type {!cve_results}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cve_results :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cve_results
  (** Input JSON data of type {!cve_results}. *)

val cve_results_of_string :
  string -> cve_results
  (** Deserialize JSON data of type {!cve_results}. *)

val write_core_timing :
  Bi_outbuf.t -> core_timing -> unit
  (** Output a JSON value of type {!core_timing}. *)

val string_of_core_timing :
  ?len:int -> core_timing -> string
  (** Serialize a value of type {!core_timing}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_timing :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_timing
  (** Input JSON data of type {!core_timing}. *)

val core_timing_of_string :
  string -> core_timing
  (** Deserialize JSON data of type {!core_timing}. *)

val write_core_stats :
  Bi_outbuf.t -> core_stats -> unit
  (** Output a JSON value of type {!core_stats}. *)

val string_of_core_stats :
  ?len:int -> core_stats -> string
  (** Serialize a value of type {!core_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_stats
  (** Input JSON data of type {!core_stats}. *)

val core_stats_of_string :
  string -> core_stats
  (** Deserialize JSON data of type {!core_stats}. *)

val write_core_severity :
  Bi_outbuf.t -> core_severity -> unit
  (** Output a JSON value of type {!core_severity}. *)

val string_of_core_severity :
  ?len:int -> core_severity -> string
  (** Serialize a value of type {!core_severity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_severity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_severity
  (** Input JSON data of type {!core_severity}. *)

val core_severity_of_string :
  string -> core_severity
  (** Deserialize JSON data of type {!core_severity}. *)

val write_core_match_extra :
  Bi_outbuf.t -> core_match_extra -> unit
  (** Output a JSON value of type {!core_match_extra}. *)

val string_of_core_match_extra :
  ?len:int -> core_match_extra -> string
  (** Serialize a value of type {!core_match_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_extra
  (** Input JSON data of type {!core_match_extra}. *)

val core_match_extra_of_string :
  string -> core_match_extra
  (** Deserialize JSON data of type {!core_match_extra}. *)

val write_core_match :
  Bi_outbuf.t -> core_match -> unit
  (** Output a JSON value of type {!core_match}. *)

val string_of_core_match :
  ?len:int -> core_match -> string
  (** Serialize a value of type {!core_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match
  (** Input JSON data of type {!core_match}. *)

val core_match_of_string :
  string -> core_match
  (** Deserialize JSON data of type {!core_match}. *)

val write_core_error_kind :
  Bi_outbuf.t -> core_error_kind -> unit
  (** Output a JSON value of type {!core_error_kind}. *)

val string_of_core_error_kind :
  ?len:int -> core_error_kind -> string
  (** Serialize a value of type {!core_error_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_error_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_error_kind
  (** Input JSON data of type {!core_error_kind}. *)

val core_error_kind_of_string :
  string -> core_error_kind
  (** Deserialize JSON data of type {!core_error_kind}. *)

val write_core_error :
  Bi_outbuf.t -> core_error -> unit
  (** Output a JSON value of type {!core_error}. *)

val string_of_core_error :
  ?len:int -> core_error -> string
  (** Serialize a value of type {!core_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_error
  (** Input JSON data of type {!core_error}. *)

val core_error_of_string :
  string -> core_error
  (** Deserialize JSON data of type {!core_error}. *)

val write_core_match_results :
  Bi_outbuf.t -> core_match_results -> unit
  (** Output a JSON value of type {!core_match_results}. *)

val string_of_core_match_results :
  ?len:int -> core_match_results -> string
  (** Serialize a value of type {!core_match_results}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_match_results :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_match_results
  (** Input JSON data of type {!core_match_results}. *)

val core_match_results_of_string :
  string -> core_match_results
  (** Deserialize JSON data of type {!core_match_results}. *)

val write_cli_target_times :
  Bi_outbuf.t -> cli_target_times -> unit
  (** Output a JSON value of type {!cli_target_times}. *)

val string_of_cli_target_times :
  ?len:int -> cli_target_times -> string
  (** Serialize a value of type {!cli_target_times}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_target_times :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_target_times
  (** Input JSON data of type {!cli_target_times}. *)

val cli_target_times_of_string :
  string -> cli_target_times
  (** Deserialize JSON data of type {!cli_target_times}. *)

val write_cli_timing :
  Bi_outbuf.t -> cli_timing -> unit
  (** Output a JSON value of type {!cli_timing}. *)

val string_of_cli_timing :
  ?len:int -> cli_timing -> string
  (** Serialize a value of type {!cli_timing}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_timing :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_timing
  (** Input JSON data of type {!cli_timing}. *)

val cli_timing_of_string :
  string -> cli_timing
  (** Deserialize JSON data of type {!cli_timing}. *)

val write_cli_skipped_target :
  Bi_outbuf.t -> cli_skipped_target -> unit
  (** Output a JSON value of type {!cli_skipped_target}. *)

val string_of_cli_skipped_target :
  ?len:int -> cli_skipped_target -> string
  (** Serialize a value of type {!cli_skipped_target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_skipped_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_skipped_target
  (** Input JSON data of type {!cli_skipped_target}. *)

val cli_skipped_target_of_string :
  string -> cli_skipped_target
  (** Deserialize JSON data of type {!cli_skipped_target}. *)

val write_cli_paths :
  Bi_outbuf.t -> cli_paths -> unit
  (** Output a JSON value of type {!cli_paths}. *)

val string_of_cli_paths :
  ?len:int -> cli_paths -> string
  (** Serialize a value of type {!cli_paths}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_paths :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_paths
  (** Input JSON data of type {!cli_paths}. *)

val cli_paths_of_string :
  string -> cli_paths
  (** Deserialize JSON data of type {!cli_paths}. *)

val write_cli_output_extra :
  Bi_outbuf.t -> cli_output_extra -> unit
  (** Output a JSON value of type {!cli_output_extra}. *)

val string_of_cli_output_extra :
  ?len:int -> cli_output_extra -> string
  (** Serialize a value of type {!cli_output_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_output_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_output_extra
  (** Input JSON data of type {!cli_output_extra}. *)

val cli_output_extra_of_string :
  string -> cli_output_extra
  (** Deserialize JSON data of type {!cli_output_extra}. *)

val write_cli_match_extra :
  Bi_outbuf.t -> cli_match_extra -> unit
  (** Output a JSON value of type {!cli_match_extra}. *)

val string_of_cli_match_extra :
  ?len:int -> cli_match_extra -> string
  (** Serialize a value of type {!cli_match_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match_extra
  (** Input JSON data of type {!cli_match_extra}. *)

val cli_match_extra_of_string :
  string -> cli_match_extra
  (** Deserialize JSON data of type {!cli_match_extra}. *)

val write_cli_match :
  Bi_outbuf.t -> cli_match -> unit
  (** Output a JSON value of type {!cli_match}. *)

val string_of_cli_match :
  ?len:int -> cli_match -> string
  (** Serialize a value of type {!cli_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_match
  (** Input JSON data of type {!cli_match}. *)

val cli_match_of_string :
  string -> cli_match
  (** Deserialize JSON data of type {!cli_match}. *)

val write_cli_error :
  Bi_outbuf.t -> cli_error -> unit
  (** Output a JSON value of type {!cli_error}. *)

val string_of_cli_error :
  ?len:int -> cli_error -> string
  (** Serialize a value of type {!cli_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_error
  (** Input JSON data of type {!cli_error}. *)

val cli_error_of_string :
  string -> cli_error
  (** Deserialize JSON data of type {!cli_error}. *)

val write_cli_output :
  Bi_outbuf.t -> cli_output -> unit
  (** Output a JSON value of type {!cli_output}. *)

val string_of_cli_output :
  ?len:int -> cli_output -> string
  (** Serialize a value of type {!cli_output}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cli_output :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cli_output
  (** Input JSON data of type {!cli_output}. *)

val cli_output_of_string :
  string -> cli_output
  (** Deserialize JSON data of type {!cli_output}. *)

val write_api_scans_findings :
  Bi_outbuf.t -> api_scans_findings -> unit
  (** Output a JSON value of type {!api_scans_findings}. *)

val string_of_api_scans_findings :
  ?len:int -> api_scans_findings -> string
  (** Serialize a value of type {!api_scans_findings}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_api_scans_findings :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> api_scans_findings
  (** Input JSON data of type {!api_scans_findings}. *)

val api_scans_findings_of_string :
  string -> api_scans_findings
  (** Deserialize JSON data of type {!api_scans_findings}. *)

