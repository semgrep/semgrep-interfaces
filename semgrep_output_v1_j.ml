(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type engine_kind = Semgrep_output_v1_t.engine_kind [@@deriving show]

type fpath = Semgrep_output_v1_t.fpath [@@deriving show]

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
  [@@deriving show]

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

type uri = Semgrep_output_v1_t.uri

type transitivity = Semgrep_output_v1_t.transitivity

type target_times = Semgrep_output_v1_t.target_times = {
  path: fpath;
  num_bytes: int;
  match_times: float list;
  parse_times: float list;
  run_time: float
}

type skip_reason = Semgrep_output_v1_t.skip_reason = 
    Always_skipped | Semgrepignore_patterns_match
  | Cli_include_flags_do_not_match | Cli_exclude_flags_match
  | Exceeded_size_limit | Analysis_failed_parser_or_internal_error
  | Excluded_by_config | Wrong_language | Too_big | Minified | Binary
  | Irrelevant_rule | Too_many_matches | Gitignore_patterns_match | Dotfile

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

type product = Semgrep_output_v1_t.product [@@deriving show]

type scan_metadata = Semgrep_output_v1_t.scan_metadata = {
  cli_version: version;
  unique_id: string;
  requested_products: product list
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

type project_metadata = Semgrep_output_v1_t.project_metadata = {
  semgrep_version: version;
  repository: string;
  repo_url: string option;
  branch: string option;
  ci_job_url: string option;
  commit: string option;
  commit_author_email: string option;
  commit_author_name: string option;
  commit_author_username: string option;
  commit_author_image_url: string option;
  commit_title: string option;
  commit_timestamp: string option;
  on: string;
  pull_request_author_username: string option;
  pull_request_author_image_url: string option;
  pull_request_id: string option;
  pull_request_title: string option;
  scan_environment: string;
  base_sha: string option;
  start_sha: string option;
  is_full_scan: bool;
  is_sca_scan: bool option;
  is_code_scan: bool option;
  is_secrets_scan: bool option
}

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

type dependency_parser_error = Semgrep_output_v1_t.dependency_parser_error = {
  path: string;
  parser: sca_parser_name;
  reason: string;
  line: int option;
  col: int option;
  text: string option
}

type datetime = Semgrep_output_v1_t.datetime

type create_scan_request = Semgrep_output_v1_t.create_scan_request = {
  meta: Yojson.Safe.t;
  project_metadata: project_metadata option;
  project_config: Yojson.Safe.t option;
  scan_metadata: scan_metadata option
}

type core_severity = Semgrep_output_v1_t.core_severity = 
    Error | Warning | Info

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
  | IncompatibleRule of incompatible_rule
  | MissingPlugin

  [@@deriving show]

type core_error = Semgrep_output_v1_t.core_error = {
  rule_id: rule_id option;
  error_type: core_error_kind;
  severity: core_severity;
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
  skipped_rules: skipped_rule list
}

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
  level: string;
  type_: string;
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
  skipped_rules: skipped_rule list
}

type ci_scan_dependencies = Semgrep_output_v1_t.ci_scan_dependencies

type ci_scan_results = Semgrep_output_v1_t.ci_scan_results = {
  findings: finding list;
  ignores: finding list;
  token: string option;
  searched_paths: string list;
  renamed_paths: string list;
  rule_ids: rule_id list;
  contributions: contributions option;
  dependencies: ci_scan_dependencies option
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
  exit_code: int;
  stats: ci_scan_complete_stats;
  dependencies: ci_scan_dependencies option;
  dependency_parser_errors: dependency_parser_error list option;
  task_id: string option;
  final_attempt: bool option
}

let write__string_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_string
  )
)
let string_of__string_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_option ob x;
  Buffer.contents ob
let read__string_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _string_option_of_string s =
  read__string_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_engine_kind = (
  fun ob x ->
    match x with
      | `OSS -> Buffer.add_string ob "\"OSS\""
      | `PRO -> Buffer.add_string ob "\"PRO\""
)
let string_of_engine_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_engine_kind ob x;
  Buffer.contents ob
let read_engine_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "OSS" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OSS
            | "PRO" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PRO
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "OSS" ->
              `OSS
            | "PRO" ->
              `PRO
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let engine_kind_of_string s =
  read_engine_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_fpath = (
  Yojson.Safe.write_string
)
let string_of_fpath ?(len = 1024) x =
  let ob = Buffer.create len in
  write_fpath ob x;
  Buffer.contents ob
let read_fpath = (
  Atdgen_runtime.Oj_run.read_string
)
let fpath_of_string s =
  read_fpath (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_matching_operation : _ -> matching_operation -> _ = (
  fun ob x ->
    match x with
      | And -> Buffer.add_string ob "\"And\""
      | Or -> Buffer.add_string ob "\"Or\""
      | Inside -> Buffer.add_string ob "\"Inside\""
      | XPat x ->
        Buffer.add_string ob "[\"XPat\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
      | Negation -> Buffer.add_string ob "\"Negation\""
      | Filter x ->
        Buffer.add_string ob "[\"Filter\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
      | Taint -> Buffer.add_string ob "\"Taint\""
      | TaintSource -> Buffer.add_string ob "\"TaintSource\""
      | TaintSink -> Buffer.add_string ob "\"TaintSink\""
      | TaintSanitizer -> Buffer.add_string ob "\"TaintSanitizer\""
      | EllipsisAndStmts -> Buffer.add_string ob "\"EllipsisAndStmts\""
      | ClassHeaderAndElems -> Buffer.add_string ob "\"ClassHeaderAndElems\""
)
let string_of_matching_operation ?(len = 1024) x =
  let ob = Buffer.create len in
  write_matching_operation ob x;
  Buffer.contents ob
let read_matching_operation = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "And" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (And : matching_operation)
            | "Or" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Or : matching_operation)
            | "Inside" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Inside : matching_operation)
            | "XPat" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (XPat x : matching_operation)
            | "Negation" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Negation : matching_operation)
            | "Filter" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Filter x : matching_operation)
            | "Taint" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Taint : matching_operation)
            | "TaintSource" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (TaintSource : matching_operation)
            | "TaintSink" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (TaintSink : matching_operation)
            | "TaintSanitizer" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (TaintSanitizer : matching_operation)
            | "EllipsisAndStmts" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (EllipsisAndStmts : matching_operation)
            | "ClassHeaderAndElems" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (ClassHeaderAndElems : matching_operation)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "And" ->
              (And : matching_operation)
            | "Or" ->
              (Or : matching_operation)
            | "Inside" ->
              (Inside : matching_operation)
            | "Negation" ->
              (Negation : matching_operation)
            | "Taint" ->
              (Taint : matching_operation)
            | "TaintSource" ->
              (TaintSource : matching_operation)
            | "TaintSink" ->
              (TaintSink : matching_operation)
            | "TaintSanitizer" ->
              (TaintSanitizer : matching_operation)
            | "EllipsisAndStmts" ->
              (EllipsisAndStmts : matching_operation)
            | "ClassHeaderAndElems" ->
              (ClassHeaderAndElems : matching_operation)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "XPat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (XPat x : matching_operation)
            | "Filter" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Filter x : matching_operation)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let matching_operation_of_string s =
  read_matching_operation (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_position : _ -> position -> _ = (
  fun ob (x : position) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"col\":";
    (
      Yojson.Safe.write_int
    )
      ob x.col;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"offset\":";
    (
      Yojson.Safe.write_int
    )
      ob x.offset;
    Buffer.add_char ob '}';
)
let string_of_position ?(len = 1024) x =
  let ob = Buffer.create len in
  write_position ob x;
  Buffer.contents ob
let read_position = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_line = ref (None) in
    let field_col = ref (None) in
    let field_offset = ref (0) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' then (
                  1
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_line := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_col := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_offset := (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_line := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_col := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_offset := (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            line = (match !field_line with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "line");
            col = (match !field_col with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "col");
            offset = !field_offset;
          }
         : position)
      )
)
let position_of_string s =
  read_position (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__position_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_position
  )
)
let string_of__position_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__position_option ob x;
  Buffer.contents ob
let read__position_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_position
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_position
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _position_option_of_string s =
  read__position_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_location : _ -> location -> _ = (
  fun ob (x : location) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    Buffer.add_char ob '}';
)
let string_of_location ?(len = 1024) x =
  let ob = Buffer.create len in
  write_location ob x;
  Buffer.contents ob
let read_location = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_start = ref (None) in
    let field_end_ = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                  2
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 1 ->
            field_start := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 2 ->
            field_end_ := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 1 ->
              field_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 2 ->
              field_end_ := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            start = (match !field_start with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start");
            end_ = (match !field_end_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_");
          }
         : location)
      )
)
let location_of_string s =
  read_location (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_match_intermediate_var : _ -> match_intermediate_var -> _ = (
  fun ob (x : match_intermediate_var) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.content;
    Buffer.add_char ob '}';
)
let string_of_match_intermediate_var ?(len = 1024) x =
  let ob = Buffer.create len in
  write_match_intermediate_var ob x;
  Buffer.contents ob
let read_match_intermediate_var = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_location = ref (None) in
    let field_content = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                  1
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_location := (
              Some (
                (
                  read_location
                ) p lb
              )
            );
          | 1 ->
            field_content := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_location := (
                Some (
                  (
                    read_location
                  ) p lb
                )
              );
            | 1 ->
              field_content := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            location = (match !field_location with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "location");
            content = (match !field_content with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "content");
          }
         : match_intermediate_var)
      )
)
let match_intermediate_var_of_string s =
  read_match_intermediate_var (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__match_intermediate_var_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_match_intermediate_var
  )
)
let string_of__match_intermediate_var_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__match_intermediate_var_list ob x;
  Buffer.contents ob
let read__match_intermediate_var_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_match_intermediate_var
  )
)
let _match_intermediate_var_list_of_string s =
  read__match_intermediate_var_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__match_intermediate_var_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__match_intermediate_var_list
  )
)
let string_of__match_intermediate_var_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__match_intermediate_var_list_option ob x;
  Buffer.contents ob
let read__match_intermediate_var_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__match_intermediate_var_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__match_intermediate_var_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _match_intermediate_var_list_option_of_string s =
  read__match_intermediate_var_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_raw_json = (
  Yojson.Basic.write_t
)
let string_of_raw_json ?(len = 1024) x =
  let ob = Buffer.create len in
  write_raw_json ob x;
  Buffer.contents ob
let read_raw_json = (
  Yojson.Basic.read_t
)
let raw_json_of_string s =
  read_raw_json (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__raw_json_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_raw_json
  )
)
let string_of__raw_json_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__raw_json_option ob x;
  Buffer.contents ob
let read__raw_json_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_raw_json
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_raw_json
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _raw_json_option_of_string s =
  read__raw_json_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_rule_id = (
  Yojson.Safe.write_string
)
let string_of_rule_id ?(len = 1024) x =
  let ob = Buffer.create len in
  write_rule_id ob x;
  Buffer.contents ob
let read_rule_id = (
  Atdgen_runtime.Oj_run.read_string
)
let rule_id_of_string s =
  read_rule_id (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_svalue_value : _ -> svalue_value -> _ = (
  fun ob (x : svalue_value) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.svalue_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"svalue_start\":";
      (
        write_position
      )
        ob x;
    );
    (match x.svalue_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"svalue_end\":";
      (
        write_position
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"svalue_abstract_content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.svalue_abstract_content;
    Buffer.add_char ob '}';
)
let string_of_svalue_value ?(len = 1024) x =
  let ob = Buffer.create len in
  write_svalue_value ob x;
  Buffer.contents ob
let read_svalue_value = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_svalue_start = ref (None) in
    let field_svalue_end = ref (None) in
    let field_svalue_abstract_content = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 10 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 't' then (
                  0
                )
                else (
                  -1
                )
              )
            | 23 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'b' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = '_' && String.unsafe_get s (pos+16) = 'c' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'n' && String.unsafe_get s (pos+19) = 't' && String.unsafe_get s (pos+20) = 'e' && String.unsafe_get s (pos+21) = 'n' && String.unsafe_get s (pos+22) = 't' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_svalue_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_svalue_end := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            )
          | 2 ->
            field_svalue_abstract_content := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 10 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 23 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'b' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = '_' && String.unsafe_get s (pos+16) = 'c' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'n' && String.unsafe_get s (pos+19) = 't' && String.unsafe_get s (pos+20) = 'e' && String.unsafe_get s (pos+21) = 'n' && String.unsafe_get s (pos+22) = 't' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_svalue_start := (
                  Some (
                    (
                      read_position
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_svalue_end := (
                  Some (
                    (
                      read_position
                    ) p lb
                  )
                );
              )
            | 2 ->
              field_svalue_abstract_content := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            svalue_start = !field_svalue_start;
            svalue_end = !field_svalue_end;
            svalue_abstract_content = (match !field_svalue_abstract_content with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "svalue_abstract_content");
          }
         : svalue_value)
      )
)
let svalue_value_of_string s =
  read_svalue_value (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__svalue_value_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_svalue_value
  )
)
let string_of__svalue_value_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__svalue_value_option ob x;
  Buffer.contents ob
let read__svalue_value_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_svalue_value
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_svalue_value
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _svalue_value_option_of_string s =
  read__svalue_value_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_metavar_value : _ -> metavar_value -> _ = (
  fun ob (x : metavar_value) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"abstract_content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.abstract_content;
    (match x.propagated_value with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"propagated_value\":";
      (
        write_svalue_value
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_metavar_value ?(len = 1024) x =
  let ob = Buffer.create len in
  write_metavar_value ob x;
  Buffer.contents ob
let read_metavar_value = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_start = ref (None) in
    let field_end_ = ref (None) in
    let field_abstract_content = ref (None) in
    let field_propagated_value = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                  0
                )
                else (
                  -1
                )
              )
            | 16 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 't' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'v' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'e' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_start := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 1 ->
            field_end_ := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 2 ->
            field_abstract_content := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_propagated_value := (
                Some (
                  (
                    read_svalue_value
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 't' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'v' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'l' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'e' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 1 ->
              field_end_ := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 2 ->
              field_abstract_content := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_propagated_value := (
                  Some (
                    (
                      read_svalue_value
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            start = (match !field_start with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start");
            end_ = (match !field_end_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_");
            abstract_content = (match !field_abstract_content with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "abstract_content");
            propagated_value = !field_propagated_value;
          }
         : metavar_value)
      )
)
let metavar_value_of_string s =
  read_metavar_value (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_390a448 = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write_metavar_value
  )
)
let string_of__x_390a448 ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_390a448 ob x;
  Buffer.contents ob
let read__x_390a448 = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read_metavar_value
  )
)
let _x_390a448_of_string s =
  read__x_390a448 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_metavars = (
  write__x_390a448
)
let string_of_metavars ?(len = 1024) x =
  let ob = Buffer.create len in
  write_metavars ob x;
  Buffer.contents ob
let read_metavars = (
  read__x_390a448
)
let metavars_of_string s =
  read_metavars (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_validation_state = (
  fun ob x ->
    match x with
      | `CONFIRMED_VALID -> Buffer.add_string ob "\"CONFIRMED_VALID\""
      | `CONFIRMED_INVALID -> Buffer.add_string ob "\"CONFIRMED_INVALID\""
      | `VALIDATION_ERROR -> Buffer.add_string ob "\"VALIDATION_ERROR\""
      | `NO_VALIDATOR -> Buffer.add_string ob "\"NO_VALIDATOR\""
)
let string_of_validation_state ?(len = 1024) x =
  let ob = Buffer.create len in
  write_validation_state ob x;
  Buffer.contents ob
let read_validation_state = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CONFIRMED_VALID" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CONFIRMED_VALID
            | "CONFIRMED_INVALID" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CONFIRMED_INVALID
            | "VALIDATION_ERROR" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `VALIDATION_ERROR
            | "NO_VALIDATOR" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NO_VALIDATOR
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "CONFIRMED_VALID" ->
              `CONFIRMED_VALID
            | "CONFIRMED_INVALID" ->
              `CONFIRMED_INVALID
            | "VALIDATION_ERROR" ->
              `VALIDATION_ERROR
            | "NO_VALIDATOR" ->
              `NO_VALIDATOR
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let validation_state_of_string s =
  read_validation_state (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__validation_state_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_validation_state
  )
)
let string_of__validation_state_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__validation_state_option ob x;
  Buffer.contents ob
let read__validation_state_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_validation_state
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_validation_state
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _validation_state_option_of_string s =
  read__validation_state_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write_match_call_trace : _ -> match_call_trace -> _ = (
  fun ob x ->
    match x with
      | CliLoc x ->
        Buffer.add_string ob "[\"CliLoc\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_location
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              Yojson.Safe.write_string
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | CliCall x ->
        Buffer.add_string ob "[\"CliCall\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              fun ob x ->
                Buffer.add_char ob '[';
                (let x, _ = x in
                (
                  write_location
                ) ob x
                );
                Buffer.add_char ob ',';
                (let _, x = x in
                (
                  Yojson.Safe.write_string
                ) ob x
                );
                Buffer.add_char ob ']';
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__match_intermediate_var_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_match_call_trace
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_match_call_trace ?(len = 1024) x =
  let ob = Buffer.create len in
  write_match_call_trace ob x;
  Buffer.contents ob
let rec read_match_call_trace = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CliLoc" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_location
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            Atdgen_runtime.Oj_run.read_string
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (CliLoc x : match_call_trace)
            | "CliCall" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            fun p lb ->
                              Yojson.Safe.read_space p lb;
                              let std_tuple = Yojson.Safe.start_any_tuple p lb in
                              let len = ref 0 in
                              let end_of_tuple = ref false in
                              (try
                                let x0 =
                                  let x =
                                    (
                                      read_location
                                    ) p lb
                                  in
                                  incr len;
                                  Yojson.Safe.read_space p lb;
                                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  x
                                in
                                let x1 =
                                  let x =
                                    (
                                      Atdgen_runtime.Oj_run.read_string
                                    ) p lb
                                  in
                                  incr len;
                                  (try
                                    Yojson.Safe.read_space p lb;
                                    Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  with Yojson.End_of_tuple -> end_of_tuple := true);
                                  x
                                in
                                if not !end_of_tuple then (
                                  try
                                    while true do
                                      Yojson.Safe.skip_json p lb;
                                      Yojson.Safe.read_space p lb;
                                      Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                    done
                                  with Yojson.End_of_tuple -> ()
                                );
                                (x0, x1)
                              with Yojson.End_of_tuple ->
                                Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__match_intermediate_var_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_match_call_trace
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (CliCall x : match_call_trace)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "CliLoc" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_location
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            Atdgen_runtime.Oj_run.read_string
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (CliLoc x : match_call_trace)
            | "CliCall" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            fun p lb ->
                              Yojson.Safe.read_space p lb;
                              let std_tuple = Yojson.Safe.start_any_tuple p lb in
                              let len = ref 0 in
                              let end_of_tuple = ref false in
                              (try
                                let x0 =
                                  let x =
                                    (
                                      read_location
                                    ) p lb
                                  in
                                  incr len;
                                  Yojson.Safe.read_space p lb;
                                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  x
                                in
                                let x1 =
                                  let x =
                                    (
                                      Atdgen_runtime.Oj_run.read_string
                                    ) p lb
                                  in
                                  incr len;
                                  (try
                                    Yojson.Safe.read_space p lb;
                                    Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  with Yojson.End_of_tuple -> end_of_tuple := true);
                                  x
                                in
                                if not !end_of_tuple then (
                                  try
                                    while true do
                                      Yojson.Safe.skip_json p lb;
                                      Yojson.Safe.read_space p lb;
                                      Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                    done
                                  with Yojson.End_of_tuple -> ()
                                );
                                (x0, x1)
                              with Yojson.End_of_tuple ->
                                Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__match_intermediate_var_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_match_call_trace
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (CliCall x : match_call_trace)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and match_call_trace_of_string s =
  read_match_call_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__match_call_trace_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_match_call_trace
  )
)
let string_of__match_call_trace_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__match_call_trace_option ob x;
  Buffer.contents ob
let read__match_call_trace_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_match_call_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_match_call_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _match_call_trace_option_of_string s =
  read__match_call_trace_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_match_dataflow_trace : _ -> match_dataflow_trace -> _ = (
  fun ob (x : match_dataflow_trace) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.taint_source with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"taint_source\":";
      (
        write_match_call_trace
      )
        ob x;
    );
    (match x.intermediate_vars with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"intermediate_vars\":";
      (
        write__match_intermediate_var_list
      )
        ob x;
    );
    (match x.taint_sink with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"taint_sink\":";
      (
        write_match_call_trace
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_match_dataflow_trace ?(len = 1024) x =
  let ob = Buffer.create len in
  write_match_dataflow_trace ob x;
  Buffer.contents ob
let read_match_dataflow_trace = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_taint_source = ref (None) in
    let field_intermediate_vars = ref (None) in
    let field_taint_sink = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 10 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'k' then (
                  2
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'c' && String.unsafe_get s (pos+11) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 17 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'v' && String.unsafe_get s (pos+14) = 'a' && String.unsafe_get s (pos+15) = 'r' && String.unsafe_get s (pos+16) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_taint_source := (
                Some (
                  (
                    read_match_call_trace
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_intermediate_vars := (
                Some (
                  (
                    read__match_intermediate_var_list
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_taint_sink := (
                Some (
                  (
                    read_match_call_trace
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 10 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'k' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'c' && String.unsafe_get s (pos+11) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 17 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'v' && String.unsafe_get s (pos+14) = 'a' && String.unsafe_get s (pos+15) = 'r' && String.unsafe_get s (pos+16) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_taint_source := (
                  Some (
                    (
                      read_match_call_trace
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_intermediate_vars := (
                  Some (
                    (
                      read__match_intermediate_var_list
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_taint_sink := (
                  Some (
                    (
                      read_match_call_trace
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            taint_source = !field_taint_source;
            intermediate_vars = !field_intermediate_vars;
            taint_sink = !field_taint_sink;
          }
         : match_dataflow_trace)
      )
)
let match_dataflow_trace_of_string s =
  read_match_dataflow_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__match_dataflow_trace_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_match_dataflow_trace
  )
)
let string_of__match_dataflow_trace_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__match_dataflow_trace_option ob x;
  Buffer.contents ob
let read__match_dataflow_trace_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_match_dataflow_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_match_dataflow_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _match_dataflow_trace_option_of_string s =
  read__match_dataflow_trace_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match_extra : _ -> core_match_extra -> _ = (
  fun ob (x : core_match_extra) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.message with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"message\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"metavars\":";
    (
      write_metavars
    )
      ob x.metavars;
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dataflow_trace\":";
      (
        write_match_dataflow_trace
      )
        ob x;
    );
    (match x.rendered_fix with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rendered_fix\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"engine_kind\":";
    (
      write_engine_kind
    )
      ob x.engine_kind;
    (match x.validation_state with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"validation_state\":";
      (
        write_validation_state
      )
        ob x;
    );
    (match x.extra_extra with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"extra_extra\":";
      (
        write_raw_json
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_core_match_extra ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_match_extra ob x;
  Buffer.contents ob
let read_core_match_extra = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_message = ref (None) in
    let field_metavars = ref (None) in
    let field_dataflow_trace = ref (None) in
    let field_rendered_fix = ref (None) in
    let field_engine_kind = ref (None) in
    let field_validation_state = ref (None) in
    let field_extra_extra = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'e' then (
                  match String.unsafe_get s (pos+1) with
                    | 'n' -> (
                        if String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'x' -> (
                        if String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'x' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'a' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'f' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'x' then (
                  3
                )
                else (
                  -1
                )
              )
            | 14 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                  5
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_message := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 1 ->
            field_metavars := (
              Some (
                (
                  read_metavars
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dataflow_trace := (
                Some (
                  (
                    read_match_dataflow_trace
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rendered_fix := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 4 ->
            field_engine_kind := (
              Some (
                (
                  read_engine_kind
                ) p lb
              )
            );
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_validation_state := (
                Some (
                  (
                    read_validation_state
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_extra_extra := (
                Some (
                  (
                    read_raw_json
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'e' then (
                    match String.unsafe_get s (pos+1) with
                      | 'n' -> (
                          if String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                            4
                          )
                          else (
                            -1
                          )
                        )
                      | 'x' -> (
                          if String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'x' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'a' then (
                            6
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'f' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'x' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_message := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 1 ->
              field_metavars := (
                Some (
                  (
                    read_metavars
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dataflow_trace := (
                  Some (
                    (
                      read_match_dataflow_trace
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rendered_fix := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 4 ->
              field_engine_kind := (
                Some (
                  (
                    read_engine_kind
                  ) p lb
                )
              );
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_validation_state := (
                  Some (
                    (
                      read_validation_state
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_extra_extra := (
                  Some (
                    (
                      read_raw_json
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            message = !field_message;
            metavars = (match !field_metavars with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "metavars");
            dataflow_trace = !field_dataflow_trace;
            rendered_fix = !field_rendered_fix;
            engine_kind = (match !field_engine_kind with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "engine_kind");
            validation_state = !field_validation_state;
            extra_extra = !field_extra_extra;
          }
         : core_match_extra)
      )
)
let core_match_extra_of_string s =
  read_core_match_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match : _ -> core_match -> _ = (
  fun ob (x : core_match) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"check_id\":";
    (
      write_rule_id
    )
      ob x.check_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"extra\":";
    (
      write_core_match_extra
    )
      ob x.extra;
    Buffer.add_char ob '}';
)
let string_of_core_match ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_match ob x;
  Buffer.contents ob
let read_core_match = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_check_id = ref (None) in
    let field_path = ref (None) in
    let field_start = ref (None) in
    let field_end_ = ref (None) in
    let field_extra = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                  3
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                  1
                )
                else (
                  -1
                )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'e' -> (
                      if String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_check_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 2 ->
            field_start := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 3 ->
            field_end_ := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 4 ->
            field_extra := (
              Some (
                (
                  read_core_match_extra
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'e' -> (
                        if String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_check_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 2 ->
              field_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 3 ->
              field_end_ := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 4 ->
              field_extra := (
                Some (
                  (
                    read_core_match_extra
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            check_id = (match !field_check_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "check_id");
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            start = (match !field_start with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start");
            end_ = (match !field_end_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_");
            extra = (match !field_extra with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "extra");
          }
         : core_match)
      )
)
let core_match_of_string s =
  read_core_match (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__core_match_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_core_match
  )
)
let string_of__core_match_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__core_match_list ob x;
  Buffer.contents ob
let read__core_match_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_core_match
  )
)
let _core_match_list_of_string s =
  read__core_match_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write__matching_explanation_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_matching_explanation
  )
) ob x
and string_of__matching_explanation_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__matching_explanation_list ob x;
  Buffer.contents ob
and write_matching_explanation : _ -> matching_explanation -> _ = (
  fun ob (x : matching_explanation) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"op\":";
    (
      write_matching_operation
    )
      ob x.op;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"children\":";
    (
      write__matching_explanation_list
    )
      ob x.children;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"matches\":";
    (
      write__core_match_list
    )
      ob x.matches;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"loc\":";
    (
      write_location
    )
      ob x.loc;
    Buffer.add_char ob '}';
)
and string_of_matching_explanation ?(len = 1024) x =
  let ob = Buffer.create len in
  write_matching_explanation ob x;
  Buffer.contents ob
let rec read__matching_explanation_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_matching_explanation
  )
) p lb
and _matching_explanation_list_of_string s =
  read__matching_explanation_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_matching_explanation = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_op = ref (None) in
    let field_children = ref (None) in
    let field_matches = ref (None) in
    let field_loc = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' then (
                  0
                )
                else (
                  -1
                )
              )
            | 3 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' then (
                  3
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_op := (
              Some (
                (
                  read_matching_operation
                ) p lb
              )
            );
          | 1 ->
            field_children := (
              Some (
                (
                  read__matching_explanation_list
                ) p lb
              )
            );
          | 2 ->
            field_matches := (
              Some (
                (
                  read__core_match_list
                ) p lb
              )
            );
          | 3 ->
            field_loc := (
              Some (
                (
                  read_location
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 3 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_op := (
                Some (
                  (
                    read_matching_operation
                  ) p lb
                )
              );
            | 1 ->
              field_children := (
                Some (
                  (
                    read__matching_explanation_list
                  ) p lb
                )
              );
            | 2 ->
              field_matches := (
                Some (
                  (
                    read__core_match_list
                  ) p lb
                )
              );
            | 3 ->
              field_loc := (
                Some (
                  (
                    read_location
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            op = (match !field_op with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "op");
            children = (match !field_children with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "children");
            matches = (match !field_matches with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "matches");
            loc = (match !field_loc with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "loc");
          }
         : matching_explanation)
      )
)
and matching_explanation_of_string s =
  read_matching_explanation (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_version = (
  Yojson.Safe.write_string
)
let string_of_version ?(len = 1024) x =
  let ob = Buffer.create len in
  write_version ob x;
  Buffer.contents ob
let read_version = (
  Atdgen_runtime.Oj_run.read_string
)
let version_of_string s =
  read_version (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_uri = (
  Yojson.Safe.write_string
)
let string_of_uri ?(len = 1024) x =
  let ob = Buffer.create len in
  write_uri ob x;
  Buffer.contents ob
let read_uri = (
  Atdgen_runtime.Oj_run.read_string
)
let uri_of_string s =
  read_uri (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_transitivity = (
  fun ob x ->
    match x with
      | `Direct -> Buffer.add_string ob "\"direct\""
      | `Transitive -> Buffer.add_string ob "\"transitive\""
      | `Unknown -> Buffer.add_string ob "\"unknown\""
)
let string_of_transitivity ?(len = 1024) x =
  let ob = Buffer.create len in
  write_transitivity ob x;
  Buffer.contents ob
let read_transitivity = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "direct" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Direct
            | "transitive" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Transitive
            | "unknown" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Unknown
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "direct" ->
              `Direct
            | "transitive" ->
              `Transitive
            | "unknown" ->
              `Unknown
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let transitivity_of_string s =
  read_transitivity (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__float_list = (
  Atdgen_runtime.Oj_run.write_list (
    Yojson.Safe.write_std_float
  )
)
let string_of__float_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__float_list ob x;
  Buffer.contents ob
let read__float_list = (
  Atdgen_runtime.Oj_run.read_list (
    Atdgen_runtime.Oj_run.read_number
  )
)
let _float_list_of_string s =
  read__float_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_target_times : _ -> target_times -> _ = (
  fun ob (x : target_times) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"num_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.num_bytes;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"match_times\":";
    (
      write__float_list
    )
      ob x.match_times;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"parse_times\":";
    (
      write__float_list
    )
      ob x.parse_times;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"run_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.run_time;
    Buffer.add_char ob '}';
)
let string_of_target_times ?(len = 1024) x =
  let ob = Buffer.create len in
  write_target_times ob x;
  Buffer.contents ob
let read_target_times = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_num_bytes = ref (None) in
    let field_match_times = ref (None) in
    let field_parse_times = ref (None) in
    let field_run_time = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                  0
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 1 ->
            field_num_bytes := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 2 ->
            field_match_times := (
              Some (
                (
                  read__float_list
                ) p lb
              )
            );
          | 3 ->
            field_parse_times := (
              Some (
                (
                  read__float_list
                ) p lb
              )
            );
          | 4 ->
            field_run_time := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_number
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 1 ->
              field_num_bytes := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_match_times := (
                Some (
                  (
                    read__float_list
                  ) p lb
                )
              );
            | 3 ->
              field_parse_times := (
                Some (
                  (
                    read__float_list
                  ) p lb
                )
              );
            | 4 ->
              field_run_time := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            num_bytes = (match !field_num_bytes with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "num_bytes");
            match_times = (match !field_match_times with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "match_times");
            parse_times = (match !field_parse_times with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parse_times");
            run_time = (match !field_run_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "run_time");
          }
         : target_times)
      )
)
let target_times_of_string s =
  read_target_times (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skip_reason : _ -> skip_reason -> _ = (
  fun ob x ->
    match x with
      | Always_skipped -> Buffer.add_string ob "\"always_skipped\""
      | Semgrepignore_patterns_match -> Buffer.add_string ob "\"semgrepignore_patterns_match\""
      | Cli_include_flags_do_not_match -> Buffer.add_string ob "\"cli_include_flags_do_not_match\""
      | Cli_exclude_flags_match -> Buffer.add_string ob "\"cli_exclude_flags_match\""
      | Exceeded_size_limit -> Buffer.add_string ob "\"exceeded_size_limit\""
      | Analysis_failed_parser_or_internal_error -> Buffer.add_string ob "\"analysis_failed_parser_or_internal_error\""
      | Excluded_by_config -> Buffer.add_string ob "\"excluded_by_config\""
      | Wrong_language -> Buffer.add_string ob "\"wrong_language\""
      | Too_big -> Buffer.add_string ob "\"too_big\""
      | Minified -> Buffer.add_string ob "\"minified\""
      | Binary -> Buffer.add_string ob "\"binary\""
      | Irrelevant_rule -> Buffer.add_string ob "\"irrelevant_rule\""
      | Too_many_matches -> Buffer.add_string ob "\"too_many_matches\""
      | Gitignore_patterns_match -> Buffer.add_string ob "\"Gitignore_patterns_match\""
      | Dotfile -> Buffer.add_string ob "\"Dotfile\""
)
let string_of_skip_reason ?(len = 1024) x =
  let ob = Buffer.create len in
  write_skip_reason ob x;
  Buffer.contents ob
let read_skip_reason = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "always_skipped" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Always_skipped : skip_reason)
            | "semgrepignore_patterns_match" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Semgrepignore_patterns_match : skip_reason)
            | "cli_include_flags_do_not_match" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Cli_include_flags_do_not_match : skip_reason)
            | "cli_exclude_flags_match" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Cli_exclude_flags_match : skip_reason)
            | "exceeded_size_limit" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Exceeded_size_limit : skip_reason)
            | "analysis_failed_parser_or_internal_error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Analysis_failed_parser_or_internal_error : skip_reason)
            | "excluded_by_config" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Excluded_by_config : skip_reason)
            | "wrong_language" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Wrong_language : skip_reason)
            | "too_big" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Too_big : skip_reason)
            | "minified" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Minified : skip_reason)
            | "binary" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Binary : skip_reason)
            | "irrelevant_rule" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Irrelevant_rule : skip_reason)
            | "too_many_matches" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Too_many_matches : skip_reason)
            | "Gitignore_patterns_match" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Gitignore_patterns_match : skip_reason)
            | "Dotfile" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Dotfile : skip_reason)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "always_skipped" ->
              (Always_skipped : skip_reason)
            | "semgrepignore_patterns_match" ->
              (Semgrepignore_patterns_match : skip_reason)
            | "cli_include_flags_do_not_match" ->
              (Cli_include_flags_do_not_match : skip_reason)
            | "cli_exclude_flags_match" ->
              (Cli_exclude_flags_match : skip_reason)
            | "exceeded_size_limit" ->
              (Exceeded_size_limit : skip_reason)
            | "analysis_failed_parser_or_internal_error" ->
              (Analysis_failed_parser_or_internal_error : skip_reason)
            | "excluded_by_config" ->
              (Excluded_by_config : skip_reason)
            | "wrong_language" ->
              (Wrong_language : skip_reason)
            | "too_big" ->
              (Too_big : skip_reason)
            | "minified" ->
              (Minified : skip_reason)
            | "binary" ->
              (Binary : skip_reason)
            | "irrelevant_rule" ->
              (Irrelevant_rule : skip_reason)
            | "too_many_matches" ->
              (Too_many_matches : skip_reason)
            | "Gitignore_patterns_match" ->
              (Gitignore_patterns_match : skip_reason)
            | "Dotfile" ->
              (Dotfile : skip_reason)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let skip_reason_of_string s =
  read_skip_reason (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__rule_id_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_rule_id
  )
)
let string_of__rule_id_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__rule_id_option ob x;
  Buffer.contents ob
let read__rule_id_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_rule_id
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_rule_id
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _rule_id_option_of_string s =
  read__rule_id_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skipped_target : _ -> skipped_target -> _ = (
  fun ob (x : skipped_target) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"reason\":";
    (
      write_skip_reason
    )
      ob x.reason;
    (match x.details with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"details\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_skipped_target ?(len = 1024) x =
  let ob = Buffer.create len in
  write_skipped_target ob x;
  Buffer.contents ob
let read_skipped_target = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_reason = ref (None) in
    let field_details = ref (None) in
    let field_rule_id = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                  0
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 1 ->
            field_reason := (
              Some (
                (
                  read_skip_reason
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_details := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 1 ->
              field_reason := (
                Some (
                  (
                    read_skip_reason
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_details := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rule_id := (
                  Some (
                    (
                      read_rule_id
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            reason = (match !field_reason with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reason");
            details = !field_details;
            rule_id = !field_rule_id;
          }
         : skipped_target)
      )
)
let skipped_target_of_string s =
  read_skipped_target (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skipped_rule : _ -> skipped_rule -> _ = (
  fun ob (x : skipped_rule) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"details\":";
    (
      Yojson.Safe.write_string
    )
      ob x.details;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"position\":";
    (
      write_position
    )
      ob x.position;
    Buffer.add_char ob '}';
)
let string_of_skipped_rule ?(len = 1024) x =
  let ob = Buffer.create len in
  write_skipped_rule ob x;
  Buffer.contents ob
let read_skipped_rule = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_details = ref (None) in
    let field_position = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_rule_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_details := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_position := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_details := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_position := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            rule_id = (match !field_rule_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_id");
            details = (match !field_details with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "details");
            position = (match !field_position with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "position");
          }
         : skipped_rule)
      )
)
let skipped_rule_of_string s =
  read_skipped_rule (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_sha1 = (
  Yojson.Safe.write_string
)
let string_of_sha1 ?(len = 1024) x =
  let ob = Buffer.create len in
  write_sha1 ob x;
  Buffer.contents ob
let read_sha1 = (
  Atdgen_runtime.Oj_run.read_string
)
let sha1_of_string s =
  read_sha1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__skipped_target_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_skipped_target
  )
)
let string_of__skipped_target_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__skipped_target_list ob x;
  Buffer.contents ob
let read__skipped_target_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_skipped_target
  )
)
let _skipped_target_list_of_string s =
  read__skipped_target_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__skipped_target_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__skipped_target_list
  )
)
let string_of__skipped_target_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__skipped_target_list_option ob x;
  Buffer.contents ob
let read__skipped_target_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__skipped_target_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__skipped_target_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _skipped_target_list_option_of_string s =
  read__skipped_target_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__fpath_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_fpath
  )
)
let string_of__fpath_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__fpath_list ob x;
  Buffer.contents ob
let read__fpath_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_fpath
  )
)
let _fpath_list_of_string s =
  read__fpath_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_scanned_and_skipped : _ -> scanned_and_skipped -> _ = (
  fun ob (x : scanned_and_skipped) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"scanned\":";
    (
      write__fpath_list
    )
      ob x.scanned;
    (match x.skipped with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"skipped\":";
      (
        write__skipped_target_list
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_scanned_and_skipped ?(len = 1024) x =
  let ob = Buffer.create len in
  write_scanned_and_skipped ob x;
  Buffer.contents ob
let read_scanned_and_skipped = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_scanned = ref (None) in
    let field_skipped = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 7 && String.unsafe_get s pos = 's' then (
            match String.unsafe_get s (pos+1) with
              | 'c' -> (
                  if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 'k' -> (
                  if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_scanned := (
              Some (
                (
                  read__fpath_list
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped := (
                Some (
                  (
                    read__skipped_target_list
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 7 && String.unsafe_get s pos = 's' then (
              match String.unsafe_get s (pos+1) with
                | 'c' -> (
                    if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 'k' -> (
                    if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_scanned := (
                Some (
                  (
                    read__fpath_list
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped := (
                  Some (
                    (
                      read__skipped_target_list
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            scanned = (match !field_scanned with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "scanned");
            skipped = !field_skipped;
          }
         : scanned_and_skipped)
      )
)
let scanned_and_skipped_of_string s =
  read_scanned_and_skipped (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_product = (
  fun ob x ->
    match x with
      | `SAST -> Buffer.add_string ob "\"sast\""
      | `SCA -> Buffer.add_string ob "\"sca\""
      | `Secrets -> Buffer.add_string ob "\"secrets\""
)
let string_of_product ?(len = 1024) x =
  let ob = Buffer.create len in
  write_product ob x;
  Buffer.contents ob
let read_product = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "sast" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SAST
            | "sca" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SCA
            | "secrets" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Secrets
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "sast" ->
              `SAST
            | "sca" ->
              `SCA
            | "secrets" ->
              `Secrets
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let product_of_string s =
  read_product (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__product_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_product
  )
)
let string_of__product_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__product_list ob x;
  Buffer.contents ob
let read__product_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_product
  )
)
let _product_list_of_string s =
  read__product_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_scan_metadata : _ -> scan_metadata -> _ = (
  fun ob (x : scan_metadata) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cli_version\":";
    (
      write_version
    )
      ob x.cli_version;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"unique_id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.unique_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"requested_products\":";
    (
      write__product_list
    )
      ob x.requested_products;
    Buffer.add_char ob '}';
)
let string_of_scan_metadata ?(len = 1024) x =
  let ob = Buffer.create len in
  write_scan_metadata ob x;
  Buffer.contents ob
let read_scan_metadata = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_cli_version = ref (None) in
    let field_unique_id = ref (None) in
    let field_requested_products = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'q' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                  0
                )
                else (
                  -1
                )
              )
            | 18 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'o' && String.unsafe_get s (pos+13) = 'd' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'c' && String.unsafe_get s (pos+16) = 't' && String.unsafe_get s (pos+17) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_cli_version := (
              Some (
                (
                  read_version
                ) p lb
              )
            );
          | 1 ->
            field_unique_id := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_requested_products := (
              Some (
                (
                  read__product_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'q' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'o' && String.unsafe_get s (pos+13) = 'd' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'c' && String.unsafe_get s (pos+16) = 't' && String.unsafe_get s (pos+17) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_cli_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            | 1 ->
              field_unique_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_requested_products := (
                Some (
                  (
                    read__product_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            cli_version = (match !field_cli_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cli_version");
            unique_id = (match !field_unique_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "unique_id");
            requested_products = (match !field_requested_products with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "requested_products");
          }
         : scan_metadata)
      )
)
let scan_metadata_of_string s =
  read_scan_metadata (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_sca_parser_name = (
  fun ob x ->
    match x with
      | `Gemfile_lock -> Buffer.add_string ob "\"gemfile_lock\""
      | `Go_mod -> Buffer.add_string ob "\"go_mod\""
      | `Go_sum -> Buffer.add_string ob "\"go_sum\""
      | `Gradle_lockfile -> Buffer.add_string ob "\"gradle_lockfile\""
      | `Gradle_build -> Buffer.add_string ob "\"gradle_build\""
      | `Jsondoc -> Buffer.add_string ob "\"jsondoc\""
      | `Pipfile -> Buffer.add_string ob "\"pipfile\""
      | `Pnpm_lock -> Buffer.add_string ob "\"pnpm_lock\""
      | `Poetry_lock -> Buffer.add_string ob "\"poetry_lock\""
      | `Pyproject_toml -> Buffer.add_string ob "\"pyproject_toml\""
      | `Requirements -> Buffer.add_string ob "\"requirements\""
      | `Yarn_1 -> Buffer.add_string ob "\"yarn_1\""
      | `Yarn_2 -> Buffer.add_string ob "\"yarn_2\""
      | `Pomtree -> Buffer.add_string ob "\"pomtree\""
      | `Cargo_parser -> Buffer.add_string ob "\"cargo\""
      | `Composer_lock -> Buffer.add_string ob "\"composer_lock\""
)
let string_of_sca_parser_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_sca_parser_name ob x;
  Buffer.contents ob
let read_sca_parser_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "gemfile_lock" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gemfile_lock
            | "go_mod" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Go_mod
            | "go_sum" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Go_sum
            | "gradle_lockfile" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gradle_lockfile
            | "gradle_build" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gradle_build
            | "jsondoc" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Jsondoc
            | "pipfile" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pipfile
            | "pnpm_lock" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pnpm_lock
            | "poetry_lock" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Poetry_lock
            | "pyproject_toml" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pyproject_toml
            | "requirements" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Requirements
            | "yarn_1" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Yarn_1
            | "yarn_2" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Yarn_2
            | "pomtree" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pomtree
            | "cargo" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cargo_parser
            | "composer_lock" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Composer_lock
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "gemfile_lock" ->
              `Gemfile_lock
            | "go_mod" ->
              `Go_mod
            | "go_sum" ->
              `Go_sum
            | "gradle_lockfile" ->
              `Gradle_lockfile
            | "gradle_build" ->
              `Gradle_build
            | "jsondoc" ->
              `Jsondoc
            | "pipfile" ->
              `Pipfile
            | "pnpm_lock" ->
              `Pnpm_lock
            | "poetry_lock" ->
              `Poetry_lock
            | "pyproject_toml" ->
              `Pyproject_toml
            | "requirements" ->
              `Requirements
            | "yarn_1" ->
              `Yarn_1
            | "yarn_2" ->
              `Yarn_2
            | "pomtree" ->
              `Pomtree
            | "cargo" ->
              `Cargo_parser
            | "composer_lock" ->
              `Composer_lock
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let sca_parser_name_of_string s =
  read_sca_parser_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ecosystem = (
  fun ob x ->
    match x with
      | `Npm -> Buffer.add_string ob "\"npm\""
      | `Pypi -> Buffer.add_string ob "\"pypi\""
      | `Gem -> Buffer.add_string ob "\"gem\""
      | `Gomod -> Buffer.add_string ob "\"gomod\""
      | `Cargo -> Buffer.add_string ob "\"cargo\""
      | `Maven -> Buffer.add_string ob "\"maven\""
      | `Composer -> Buffer.add_string ob "\"composer\""
      | `Nuget -> Buffer.add_string ob "\"nuget\""
)
let string_of_ecosystem ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ecosystem ob x;
  Buffer.contents ob
let read_ecosystem = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "npm" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Npm
            | "pypi" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pypi
            | "gem" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gem
            | "gomod" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gomod
            | "cargo" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cargo
            | "maven" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Maven
            | "composer" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Composer
            | "nuget" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Nuget
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "npm" ->
              `Npm
            | "pypi" ->
              `Pypi
            | "gem" ->
              `Gem
            | "gomod" ->
              `Gomod
            | "cargo" ->
              `Cargo
            | "maven" ->
              `Maven
            | "composer" ->
              `Composer
            | "nuget" ->
              `Nuget
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let ecosystem_of_string s =
  read_ecosystem (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dependency_child : _ -> dependency_child -> _ = (
  fun ob (x : dependency_child) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"package\":";
    (
      Yojson.Safe.write_string
    )
      ob x.package;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.version;
    Buffer.add_char ob '}';
)
let string_of_dependency_child ?(len = 1024) x =
  let ob = Buffer.create len in
  write_dependency_child ob x;
  Buffer.contents ob
let read_dependency_child = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_package = ref (None) in
    let field_version = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 7 then (
            match String.unsafe_get s pos with
              | 'p' -> (
                  if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 'v' -> (
                  if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_package := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_version := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 7 then (
              match String.unsafe_get s pos with
                | 'p' -> (
                    if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 'v' -> (
                    if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_package := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_version := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            package = (match !field_package with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "package");
            version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
          }
         : dependency_child)
      )
)
let dependency_child_of_string s =
  read_dependency_child (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_list = (
  Atdgen_runtime.Oj_run.write_list (
    Yojson.Safe.write_string
  )
)
let string_of__string_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_list ob x;
  Buffer.contents ob
let read__string_list = (
  Atdgen_runtime.Oj_run.read_list (
    Atdgen_runtime.Oj_run.read_string
  )
)
let _string_list_of_string s =
  read__string_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_b85b97f = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write__string_list
  )
)
let string_of__x_b85b97f ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_b85b97f ob x;
  Buffer.contents ob
let read__x_b85b97f = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read__string_list
  )
)
let _x_b85b97f_of_string s =
  read__x_b85b97f (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__int_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_int
  )
)
let string_of__int_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__int_option ob x;
  Buffer.contents ob
let read__int_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _int_option_of_string s =
  read__int_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__dependency_child_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_dependency_child
  )
)
let string_of__dependency_child_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dependency_child_list ob x;
  Buffer.contents ob
let read__dependency_child_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_dependency_child
  )
)
let _dependency_child_list_of_string s =
  read__dependency_child_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__dependency_child_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__dependency_child_list
  )
)
let string_of__dependency_child_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dependency_child_list_option ob x;
  Buffer.contents ob
let read__dependency_child_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__dependency_child_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__dependency_child_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _dependency_child_list_option_of_string s =
  read__dependency_child_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_found_dependency : _ -> found_dependency -> _ = (
  fun ob (x : found_dependency) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"package\":";
    (
      Yojson.Safe.write_string
    )
      ob x.package;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.version;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ecosystem\":";
    (
      write_ecosystem
    )
      ob x.ecosystem;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"allowed_hashes\":";
    (
      write__x_b85b97f
    )
      ob x.allowed_hashes;
    (match x.resolved_url with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"resolved_url\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"transitivity\":";
    (
      write_transitivity
    )
      ob x.transitivity;
    (match x.line_number with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"line_number\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    (match x.children with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"children\":";
      (
        write__dependency_child_list
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_found_dependency ?(len = 1024) x =
  let ob = Buffer.create len in
  write_found_dependency ob x;
  Buffer.contents ob
let read_found_dependency = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_package = ref (None) in
    let field_version = ref (None) in
    let field_ecosystem = ref (None) in
    let field_allowed_hashes = ref (None) in
    let field_resolved_url = ref (None) in
    let field_transitivity = ref (None) in
    let field_line_number = ref (None) in
    let field_children = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' then (
                  7
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'm' then (
                  2
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'b' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'r' then (
                  6
                )
                else (
                  -1
                )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'l' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'y' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 14 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'w' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'h' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_package := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_version := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_ecosystem := (
              Some (
                (
                  read_ecosystem
                ) p lb
              )
            );
          | 3 ->
            field_allowed_hashes := (
              Some (
                (
                  read__x_b85b97f
                ) p lb
              )
            );
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_resolved_url := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 5 ->
            field_transitivity := (
              Some (
                (
                  read_transitivity
                ) p lb
              )
            );
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_line_number := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_children := (
                Some (
                  (
                    read__dependency_child_list
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'm' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'b' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'r' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'l' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'y' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'w' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'h' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_package := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_version := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_ecosystem := (
                Some (
                  (
                    read_ecosystem
                  ) p lb
                )
              );
            | 3 ->
              field_allowed_hashes := (
                Some (
                  (
                    read__x_b85b97f
                  ) p lb
                )
              );
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_resolved_url := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 5 ->
              field_transitivity := (
                Some (
                  (
                    read_transitivity
                  ) p lb
                )
              );
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_line_number := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_children := (
                  Some (
                    (
                      read__dependency_child_list
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            package = (match !field_package with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "package");
            version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
            ecosystem = (match !field_ecosystem with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ecosystem");
            allowed_hashes = (match !field_allowed_hashes with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "allowed_hashes");
            resolved_url = !field_resolved_url;
            transitivity = (match !field_transitivity with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "transitivity");
            line_number = !field_line_number;
            children = !field_children;
          }
         : found_dependency)
      )
)
let found_dependency_of_string s =
  read_found_dependency (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dependency_pattern : _ -> dependency_pattern -> _ = (
  fun ob (x : dependency_pattern) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ecosystem\":";
    (
      write_ecosystem
    )
      ob x.ecosystem;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"package\":";
    (
      Yojson.Safe.write_string
    )
      ob x.package;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"semver_range\":";
    (
      Yojson.Safe.write_string
    )
      ob x.semver_range;
    Buffer.add_char ob '}';
)
let string_of_dependency_pattern ?(len = 1024) x =
  let ob = Buffer.create len in
  write_dependency_pattern ob x;
  Buffer.contents ob
let read_dependency_pattern = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_ecosystem = ref (None) in
    let field_package = ref (None) in
    let field_semver_range = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'm' then (
                  0
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_ecosystem := (
              Some (
                (
                  read_ecosystem
                ) p lb
              )
            );
          | 1 ->
            field_package := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_semver_range := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'm' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_ecosystem := (
                Some (
                  (
                    read_ecosystem
                  ) p lb
                )
              );
            | 1 ->
              field_package := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_semver_range := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            ecosystem = (match !field_ecosystem with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ecosystem");
            package = (match !field_package with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "package");
            semver_range = (match !field_semver_range with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "semver_range");
          }
         : dependency_pattern)
      )
)
let dependency_pattern_of_string s =
  read_dependency_pattern (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dependency_match : _ -> dependency_match -> _ = (
  fun ob (x : dependency_match) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"dependency_pattern\":";
    (
      write_dependency_pattern
    )
      ob x.dependency_pattern;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"found_dependency\":";
    (
      write_found_dependency
    )
      ob x.found_dependency;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"lockfile\":";
    (
      Yojson.Safe.write_string
    )
      ob x.lockfile;
    Buffer.add_char ob '}';
)
let string_of_dependency_match ?(len = 1024) x =
  let ob = Buffer.create len in
  write_dependency_match ob x;
  Buffer.contents ob
let read_dependency_match = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_dependency_pattern = ref (None) in
    let field_found_dependency = ref (None) in
    let field_lockfile = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'd' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'y' then (
                  1
                )
                else (
                  -1
                )
              )
            | 18 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'r' && String.unsafe_get s (pos+17) = 'n' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_dependency_pattern := (
              Some (
                (
                  read_dependency_pattern
                ) p lb
              )
            );
          | 1 ->
            field_found_dependency := (
              Some (
                (
                  read_found_dependency
                ) p lb
              )
            );
          | 2 ->
            field_lockfile := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'd' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'r' && String.unsafe_get s (pos+17) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_dependency_pattern := (
                Some (
                  (
                    read_dependency_pattern
                  ) p lb
                )
              );
            | 1 ->
              field_found_dependency := (
                Some (
                  (
                    read_found_dependency
                  ) p lb
                )
              );
            | 2 ->
              field_lockfile := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            dependency_pattern = (match !field_dependency_pattern with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "dependency_pattern");
            found_dependency = (match !field_found_dependency with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "found_dependency");
            lockfile = (match !field_lockfile with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "lockfile");
          }
         : dependency_match)
      )
)
let dependency_match_of_string s =
  read_dependency_match (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_sca_info : _ -> sca_info -> _ = (
  fun ob (x : sca_info) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"reachable\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.reachable;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"reachability_rule\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.reachability_rule;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"sca_finding_schema\":";
    (
      Yojson.Safe.write_int
    )
      ob x.sca_finding_schema;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"dependency_match\":";
    (
      write_dependency_match
    )
      ob x.dependency_match;
    Buffer.add_char ob '}';
)
let string_of_sca_info ?(len = 1024) x =
  let ob = Buffer.create len in
  write_sca_info ob x;
  Buffer.contents ob
let read_sca_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_reachable = ref (None) in
    let field_reachability_rule = ref (None) in
    let field_sca_finding_schema = ref (None) in
    let field_dependency_match = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'm' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'h' then (
                  3
                )
                else (
                  -1
                )
              )
            | 17 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'y' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'r' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'l' && String.unsafe_get s (pos+16) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 18 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = 'h' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'a' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_reachable := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 1 ->
            field_reachability_rule := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 2 ->
            field_sca_finding_schema := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 3 ->
            field_dependency_match := (
              Some (
                (
                  read_dependency_match
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'm' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'h' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 17 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'y' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'r' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 'l' && String.unsafe_get s (pos+16) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 'c' && String.unsafe_get s (pos+14) = 'h' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'a' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_reachable := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 1 ->
              field_reachability_rule := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 2 ->
              field_sca_finding_schema := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 3 ->
              field_dependency_match := (
                Some (
                  (
                    read_dependency_match
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            reachable = (match !field_reachable with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reachable");
            reachability_rule = (match !field_reachability_rule with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reachability_rule");
            sca_finding_schema = (match !field_sca_finding_schema with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "sca_finding_schema");
            dependency_match = (match !field_dependency_match with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "dependency_match");
          }
         : sca_info)
      )
)
let sca_info_of_string s =
  read_sca_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_rule_id_and_engine_kind = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_rule_id
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_engine_kind
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of_rule_id_and_engine_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_rule_id_and_engine_kind ob x;
  Buffer.contents ob
let read_rule_id_and_engine_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_rule_id
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_engine_kind
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let rule_id_and_engine_kind_of_string s =
  read_rule_id_and_engine_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    Yojson.Safe.write_string
  )
)
let string_of__string_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_nullable ob x;
  Buffer.contents ob
let read__string_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      Atdgen_runtime.Oj_run.read_string
    ) p lb) : _ option)
)
let _string_nullable_of_string s =
  read__string_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__bool_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_bool
  )
)
let string_of__bool_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__bool_option ob x;
  Buffer.contents ob
let read__bool_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _bool_option_of_string s =
  read__bool_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_project_metadata : _ -> project_metadata -> _ = (
  fun ob (x : project_metadata) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"semgrep_version\":";
    (
      write_version
    )
      ob x.semgrep_version;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"repository\":";
    (
      Yojson.Safe.write_string
    )
      ob x.repository;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"repo_url\":";
    (
      write__string_nullable
    )
      ob x.repo_url;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"branch\":";
    (
      write__string_nullable
    )
      ob x.branch;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ci_job_url\":";
    (
      write__string_nullable
    )
      ob x.ci_job_url;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit\":";
    (
      write__string_nullable
    )
      ob x.commit;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_email\":";
    (
      write__string_nullable
    )
      ob x.commit_author_email;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_name\":";
    (
      write__string_nullable
    )
      ob x.commit_author_name;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_username\":";
    (
      write__string_nullable
    )
      ob x.commit_author_username;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_image_url\":";
    (
      write__string_nullable
    )
      ob x.commit_author_image_url;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_title\":";
    (
      write__string_nullable
    )
      ob x.commit_title;
    (match x.commit_timestamp with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"commit_timestamp\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"on\":";
    (
      Yojson.Safe.write_string
    )
      ob x.on;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pull_request_author_username\":";
    (
      write__string_nullable
    )
      ob x.pull_request_author_username;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pull_request_author_image_url\":";
    (
      write__string_nullable
    )
      ob x.pull_request_author_image_url;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pull_request_id\":";
    (
      write__string_nullable
    )
      ob x.pull_request_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pull_request_title\":";
    (
      write__string_nullable
    )
      ob x.pull_request_title;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"scan_environment\":";
    (
      Yojson.Safe.write_string
    )
      ob x.scan_environment;
    (match x.base_sha with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"base_sha\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.start_sha with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"start_sha\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"is_full_scan\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.is_full_scan;
    (match x.is_sca_scan with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"is_sca_scan\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    (match x.is_code_scan with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"is_code_scan\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    (match x.is_secrets_scan with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"is_secrets_scan\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_project_metadata ?(len = 1024) x =
  let ob = Buffer.create len in
  write_project_metadata ob x;
  Buffer.contents ob
let read_project_metadata = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_semgrep_version = ref (None) in
    let field_repository = ref (None) in
    let field_repo_url = ref (None) in
    let field_branch = ref (None) in
    let field_ci_job_url = ref (None) in
    let field_commit = ref (None) in
    let field_commit_author_email = ref (None) in
    let field_commit_author_name = ref (None) in
    let field_commit_author_username = ref (None) in
    let field_commit_author_image_url = ref (None) in
    let field_commit_title = ref (None) in
    let field_commit_timestamp = ref (None) in
    let field_on = ref (None) in
    let field_pull_request_author_username = ref (None) in
    let field_pull_request_author_image_url = ref (None) in
    let field_pull_request_id = ref (None) in
    let field_pull_request_title = ref (None) in
    let field_scan_environment = ref (None) in
    let field_base_sha = ref (None) in
    let field_start_sha = ref (None) in
    let field_is_full_scan = ref (None) in
    let field_is_sca_scan = ref (None) in
    let field_is_code_scan = ref (None) in
    let field_is_secrets_scan = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'n' then (
                  12
                )
                else (
                  -1
                )
              )
            | 6 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'h' && String.unsafe_get s (pos+7) = 'a' then (
                        18
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'l' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' then (
                  19
                )
                else (
                  -1
                )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'l' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'n' then (
                  21
                )
                else (
                  -1
                )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' then (
                        10
                      )
                      else (
                        -1
                      )
                    )
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' then (
                        match String.unsafe_get s (pos+3) with
                          | 'c' -> (
                              if String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' then (
                                22
                              )
                              else (
                                -1
                              )
                            )
                          | 'f' -> (
                              if String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' then (
                                20
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 15 -> (
                match String.unsafe_get s pos with
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'n' then (
                        23
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'd' then (
                        15
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'o' && String.unsafe_get s (pos+14) = 'n' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 16 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'p' then (
                        11
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'v' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 't' then (
                        17
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 18 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'e' then (
                        7
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'l' && String.unsafe_get s (pos+17) = 'e' then (
                        16
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 19 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'i' && String.unsafe_get s (pos+18) = 'l' then (
                  6
                )
                else (
                  -1
                )
              )
            | 22 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 's' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'r' && String.unsafe_get s (pos+18) = 'n' && String.unsafe_get s (pos+19) = 'a' && String.unsafe_get s (pos+20) = 'm' && String.unsafe_get s (pos+21) = 'e' then (
                  8
                )
                else (
                  -1
                )
              )
            | 23 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'g' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'u' && String.unsafe_get s (pos+21) = 'r' && String.unsafe_get s (pos+22) = 'l' then (
                  9
                )
                else (
                  -1
                )
              )
            | 28 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'h' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'u' && String.unsafe_get s (pos+21) = 's' && String.unsafe_get s (pos+22) = 'e' && String.unsafe_get s (pos+23) = 'r' && String.unsafe_get s (pos+24) = 'n' && String.unsafe_get s (pos+25) = 'a' && String.unsafe_get s (pos+26) = 'm' && String.unsafe_get s (pos+27) = 'e' then (
                  13
                )
                else (
                  -1
                )
              )
            | 29 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'h' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'i' && String.unsafe_get s (pos+21) = 'm' && String.unsafe_get s (pos+22) = 'a' && String.unsafe_get s (pos+23) = 'g' && String.unsafe_get s (pos+24) = 'e' && String.unsafe_get s (pos+25) = '_' && String.unsafe_get s (pos+26) = 'u' && String.unsafe_get s (pos+27) = 'r' && String.unsafe_get s (pos+28) = 'l' then (
                  14
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_semgrep_version := (
              Some (
                (
                  read_version
                ) p lb
              )
            );
          | 1 ->
            field_repository := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_repo_url := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 3 ->
            field_branch := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 4 ->
            field_ci_job_url := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 5 ->
            field_commit := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 6 ->
            field_commit_author_email := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 7 ->
            field_commit_author_name := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 8 ->
            field_commit_author_username := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 9 ->
            field_commit_author_image_url := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 10 ->
            field_commit_title := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_commit_timestamp := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 12 ->
            field_on := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 13 ->
            field_pull_request_author_username := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 14 ->
            field_pull_request_author_image_url := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 15 ->
            field_pull_request_id := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 16 ->
            field_pull_request_title := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 17 ->
            field_scan_environment := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 18 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_base_sha := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 19 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_start_sha := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 20 ->
            field_is_full_scan := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 21 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_is_sca_scan := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            )
          | 22 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_is_code_scan := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            )
          | 23 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_is_secrets_scan := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'n' then (
                    12
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'h' && String.unsafe_get s (pos+7) = 'a' then (
                          18
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'l' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' then (
                    19
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'l' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'n' then (
                    21
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' then (
                          10
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' then (
                          match String.unsafe_get s (pos+3) with
                            | 'c' -> (
                                if String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' then (
                                  22
                                )
                                else (
                                  -1
                                )
                              )
                            | 'f' -> (
                                if String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' then (
                                  20
                                )
                                else (
                                  -1
                                )
                              )
                            | _ -> (
                                -1
                              )
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 15 -> (
                  match String.unsafe_get s pos with
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'n' then (
                          23
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'd' then (
                          15
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'o' && String.unsafe_get s (pos+14) = 'n' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'p' then (
                          11
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'v' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 't' then (
                          17
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 18 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'e' then (
                          7
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'l' && String.unsafe_get s (pos+17) = 'e' then (
                          16
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 19 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'i' && String.unsafe_get s (pos+18) = 'l' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 22 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 's' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'r' && String.unsafe_get s (pos+18) = 'n' && String.unsafe_get s (pos+19) = 'a' && String.unsafe_get s (pos+20) = 'm' && String.unsafe_get s (pos+21) = 'e' then (
                    8
                  )
                  else (
                    -1
                  )
                )
              | 23 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'g' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'u' && String.unsafe_get s (pos+21) = 'r' && String.unsafe_get s (pos+22) = 'l' then (
                    9
                  )
                  else (
                    -1
                  )
                )
              | 28 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'h' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'u' && String.unsafe_get s (pos+21) = 's' && String.unsafe_get s (pos+22) = 'e' && String.unsafe_get s (pos+23) = 'r' && String.unsafe_get s (pos+24) = 'n' && String.unsafe_get s (pos+25) = 'a' && String.unsafe_get s (pos+26) = 'm' && String.unsafe_get s (pos+27) = 'e' then (
                    13
                  )
                  else (
                    -1
                  )
                )
              | 29 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'q' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = '_' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'u' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'h' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'r' && String.unsafe_get s (pos+19) = '_' && String.unsafe_get s (pos+20) = 'i' && String.unsafe_get s (pos+21) = 'm' && String.unsafe_get s (pos+22) = 'a' && String.unsafe_get s (pos+23) = 'g' && String.unsafe_get s (pos+24) = 'e' && String.unsafe_get s (pos+25) = '_' && String.unsafe_get s (pos+26) = 'u' && String.unsafe_get s (pos+27) = 'r' && String.unsafe_get s (pos+28) = 'l' then (
                    14
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_semgrep_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            | 1 ->
              field_repository := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_repo_url := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 3 ->
              field_branch := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 4 ->
              field_ci_job_url := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 5 ->
              field_commit := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 6 ->
              field_commit_author_email := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 7 ->
              field_commit_author_name := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 8 ->
              field_commit_author_username := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 9 ->
              field_commit_author_image_url := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 10 ->
              field_commit_title := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_commit_timestamp := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 12 ->
              field_on := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 13 ->
              field_pull_request_author_username := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 14 ->
              field_pull_request_author_image_url := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 15 ->
              field_pull_request_id := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 16 ->
              field_pull_request_title := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 17 ->
              field_scan_environment := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 18 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_base_sha := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 19 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_start_sha := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 20 ->
              field_is_full_scan := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 21 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_is_sca_scan := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              )
            | 22 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_is_code_scan := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              )
            | 23 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_is_secrets_scan := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            semgrep_version = (match !field_semgrep_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "semgrep_version");
            repository = (match !field_repository with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "repository");
            repo_url = (match !field_repo_url with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "repo_url");
            branch = (match !field_branch with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "branch");
            ci_job_url = (match !field_ci_job_url with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ci_job_url");
            commit = (match !field_commit with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit");
            commit_author_email = (match !field_commit_author_email with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_email");
            commit_author_name = (match !field_commit_author_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_name");
            commit_author_username = (match !field_commit_author_username with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_username");
            commit_author_image_url = (match !field_commit_author_image_url with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_image_url");
            commit_title = (match !field_commit_title with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_title");
            commit_timestamp = !field_commit_timestamp;
            on = (match !field_on with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "on");
            pull_request_author_username = (match !field_pull_request_author_username with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pull_request_author_username");
            pull_request_author_image_url = (match !field_pull_request_author_image_url with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pull_request_author_image_url");
            pull_request_id = (match !field_pull_request_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pull_request_id");
            pull_request_title = (match !field_pull_request_title with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pull_request_title");
            scan_environment = (match !field_scan_environment with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "scan_environment");
            base_sha = !field_base_sha;
            start_sha = !field_start_sha;
            is_full_scan = (match !field_is_full_scan with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "is_full_scan");
            is_sca_scan = !field_is_sca_scan;
            is_code_scan = !field_is_code_scan;
            is_secrets_scan = !field_is_secrets_scan;
          }
         : project_metadata)
      )
)
let project_metadata_of_string s =
  read_project_metadata (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_d81b58a = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    Yojson.Safe.write_std_float
  )
)
let string_of__x_d81b58a ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_d81b58a ob x;
  Buffer.contents ob
let read__x_d81b58a = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    Atdgen_runtime.Oj_run.read_number
  )
)
let _x_d81b58a_of_string s =
  read__x_d81b58a (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__target_times_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_target_times
  )
)
let string_of__target_times_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__target_times_list ob x;
  Buffer.contents ob
let read__target_times_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_target_times
  )
)
let _target_times_list_of_string s =
  read__target_times_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__rule_id_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule_id
  )
)
let string_of__rule_id_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__rule_id_list ob x;
  Buffer.contents ob
let read__rule_id_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule_id
  )
)
let _rule_id_list_of_string s =
  read__rule_id_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_profile : _ -> profile -> _ = (
  fun ob (x : profile) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"rules\":";
    (
      write__rule_id_list
    )
      ob x.rules;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"rules_parse_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.rules_parse_time;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"profiling_times\":";
    (
      write__x_d81b58a
    )
      ob x.profiling_times;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"targets\":";
    (
      write__target_times_list
    )
      ob x.targets;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"total_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.total_bytes;
    (match x.max_memory_bytes with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"max_memory_bytes\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_profile ?(len = 1024) x =
  let ob = Buffer.create len in
  write_profile ob x;
  Buffer.contents ob
let read_profile = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rules = ref (None) in
    let field_rules_parse_time = ref (None) in
    let field_profiling_times = ref (None) in
    let field_targets = ref (None) in
    let field_total_bytes = ref (None) in
    let field_max_memory_bytes = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                  4
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'g' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'i' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 16 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'b' && String.unsafe_get s (pos+12) = 'y' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'e' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_rules := (
              Some (
                (
                  read__rule_id_list
                ) p lb
              )
            );
          | 1 ->
            field_rules_parse_time := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_number
                ) p lb
              )
            );
          | 2 ->
            field_profiling_times := (
              Some (
                (
                  read__x_d81b58a
                ) p lb
              )
            );
          | 3 ->
            field_targets := (
              Some (
                (
                  read__target_times_list
                ) p lb
              )
            );
          | 4 ->
            field_total_bytes := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_max_memory_bytes := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'g' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'i' && String.unsafe_get s (pos+12) = 'm' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'b' && String.unsafe_get s (pos+12) = 'y' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'e' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_rules := (
                Some (
                  (
                    read__rule_id_list
                  ) p lb
                )
              );
            | 1 ->
              field_rules_parse_time := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            | 2 ->
              field_profiling_times := (
                Some (
                  (
                    read__x_d81b58a
                  ) p lb
                )
              );
            | 3 ->
              field_targets := (
                Some (
                  (
                    read__target_times_list
                  ) p lb
                )
              );
            | 4 ->
              field_total_bytes := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_max_memory_bytes := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            rules = (match !field_rules with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rules");
            rules_parse_time = (match !field_rules_parse_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rules_parse_time");
            profiling_times = (match !field_profiling_times with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "profiling_times");
            targets = (match !field_targets with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "targets");
            total_bytes = (match !field_total_bytes with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "total_bytes");
            max_memory_bytes = !field_max_memory_bytes;
          }
         : profile)
      )
)
let profile_of_string s =
  read_profile (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_parsing_stats : _ -> parsing_stats -> _ = (
  fun ob (x : parsing_stats) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"targets_parsed\":";
    (
      Yojson.Safe.write_int
    )
      ob x.targets_parsed;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"num_targets\":";
    (
      Yojson.Safe.write_int
    )
      ob x.num_targets;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"bytes_parsed\":";
    (
      Yojson.Safe.write_int
    )
      ob x.bytes_parsed;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"num_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.num_bytes;
    Buffer.add_char ob '}';
)
let string_of_parsing_stats ?(len = 1024) x =
  let ob = Buffer.create len in
  write_parsing_stats ob x;
  Buffer.contents ob
let read_parsing_stats = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_targets_parsed = ref (None) in
    let field_num_targets = ref (None) in
    let field_bytes_parsed = ref (None) in
    let field_num_bytes = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'g' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                  2
                )
                else (
                  -1
                )
              )
            | 14 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_targets_parsed := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_num_targets := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 2 ->
            field_bytes_parsed := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 3 ->
            field_num_bytes := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'g' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_targets_parsed := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_num_targets := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_bytes_parsed := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 3 ->
              field_num_bytes := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            targets_parsed = (match !field_targets_parsed with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "targets_parsed");
            num_targets = (match !field_num_targets with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "num_targets");
            bytes_parsed = (match !field_bytes_parsed with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "bytes_parsed");
            num_bytes = (match !field_num_bytes with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "num_bytes");
          }
         : parsing_stats)
      )
)
let parsing_stats_of_string s =
  read_parsing_stats (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__version_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_version
  )
)
let string_of__version_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__version_option ob x;
  Buffer.contents ob
let read__version_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_version
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_version
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _version_option_of_string s =
  read__version_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_incompatible_rule : _ -> incompatible_rule -> _ = (
  fun ob (x : incompatible_rule) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"this_version\":";
    (
      write_version
    )
      ob x.this_version;
    (match x.min_version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"min_version\":";
      (
        write_version
      )
        ob x;
    );
    (match x.max_version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"max_version\":";
      (
        write_version
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_incompatible_rule ?(len = 1024) x =
  let ob = Buffer.create len in
  write_incompatible_rule ob x;
  Buffer.contents ob
let read_incompatible_rule = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_this_version = ref (None) in
    let field_min_version = ref (None) in
    let field_max_version = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'm' then (
                  match String.unsafe_get s (pos+1) with
                    | 'a' -> (
                        if String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_rule_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_this_version := (
              Some (
                (
                  read_version
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_min_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_max_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'm' then (
                    match String.unsafe_get s (pos+1) with
                      | 'a' -> (
                          if String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                            3
                          )
                          else (
                            -1
                          )
                        )
                      | 'i' -> (
                          if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                            2
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_this_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_min_version := (
                  Some (
                    (
                      read_version
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_max_version := (
                  Some (
                    (
                      read_version
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            rule_id = (match !field_rule_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_id");
            this_version = (match !field_this_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "this_version");
            min_version = !field_min_version;
            max_version = !field_max_version;
          }
         : incompatible_rule)
      )
)
let incompatible_rule_of_string s =
  read_incompatible_rule (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_fix_regex : _ -> fix_regex -> _ = (
  fun ob (x : fix_regex) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"regex\":";
    (
      Yojson.Safe.write_string
    )
      ob x.regex;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"replacement\":";
    (
      Yojson.Safe.write_string
    )
      ob x.replacement;
    (match x.count with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"count\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_fix_regex ?(len = 1024) x =
  let ob = Buffer.create len in
  write_fix_regex ob x;
  Buffer.contents ob
let read_fix_regex = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_regex = ref (None) in
    let field_replacement = ref (None) in
    let field_count = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'x' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_regex := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_replacement := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_count := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'x' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_regex := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_replacement := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_count := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            regex = (match !field_regex with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "regex");
            replacement = (match !field_replacement with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "replacement");
            count = !field_count;
          }
         : fix_regex)
      )
)
let fix_regex_of_string s =
  read_fix_regex (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_finding_hashes : _ -> finding_hashes -> _ = (
  fun ob (x : finding_hashes) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start_line_hash\":";
    (
      Yojson.Safe.write_string
    )
      ob x.start_line_hash;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end_line_hash\":";
    (
      Yojson.Safe.write_string
    )
      ob x.end_line_hash;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"code_hash\":";
    (
      Yojson.Safe.write_string
    )
      ob x.code_hash;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pattern_hash\":";
    (
      Yojson.Safe.write_string
    )
      ob x.pattern_hash;
    Buffer.add_char ob '}';
)
let string_of_finding_hashes ?(len = 1024) x =
  let ob = Buffer.create len in
  write_finding_hashes ob x;
  Buffer.contents ob
let read_finding_hashes = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_start_line_hash = ref (None) in
    let field_end_line_hash = ref (None) in
    let field_code_hash = ref (None) in
    let field_pattern_hash = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'h' then (
                  2
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'h' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'h' then (
                  3
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'h' then (
                  1
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 's' && String.unsafe_get s (pos+14) = 'h' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_start_line_hash := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_end_line_hash := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_code_hash := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            field_pattern_hash := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'h' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'h' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'h' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'h' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 's' && String.unsafe_get s (pos+14) = 'h' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_start_line_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_end_line_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_code_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              field_pattern_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            start_line_hash = (match !field_start_line_hash with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start_line_hash");
            end_line_hash = (match !field_end_line_hash with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_line_hash");
            code_hash = (match !field_code_hash with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "code_hash");
            pattern_hash = (match !field_pattern_hash with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pattern_hash");
          }
         : finding_hashes)
      )
)
let finding_hashes_of_string s =
  read_finding_hashes (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__string_list
  )
)
let string_of__string_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_list_option ob x;
  Buffer.contents ob
let read__string_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _string_list_option_of_string s =
  read__string_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__sca_info_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_sca_info
  )
)
let string_of__sca_info_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__sca_info_option ob x;
  Buffer.contents ob
let read__sca_info_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_sca_info
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_sca_info
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _sca_info_option_of_string s =
  read__sca_info_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__finding_hashes_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_finding_hashes
  )
)
let string_of__finding_hashes_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__finding_hashes_option ob x;
  Buffer.contents ob
let read__finding_hashes_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_finding_hashes
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_finding_hashes
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _finding_hashes_option_of_string s =
  read__finding_hashes_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_finding : _ -> finding -> _ = (
  fun ob (x : finding) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"check_id\":";
    (
      write_rule_id
    )
      ob x.check_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"column\":";
    (
      Yojson.Safe.write_int
    )
      ob x.column;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end_line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.end_line;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end_column\":";
    (
      Yojson.Safe.write_int
    )
      ob x.end_column;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"severity\":";
    (
      Yojson.Safe.write_json
    )
      ob x.severity;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"index\":";
    (
      Yojson.Safe.write_int
    )
      ob x.index;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_date\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_date;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"syntactic_id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.syntactic_id;
    (match x.match_based_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"match_based_id\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.hashes with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"hashes\":";
      (
        write_finding_hashes
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"metadata\":";
    (
      write_raw_json
    )
      ob x.metadata;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"is_blocking\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.is_blocking;
    (match x.fixed_lines with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"fixed_lines\":";
      (
        write__string_list
      )
        ob x;
    );
    (match x.sca_info with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"sca_info\":";
      (
        write_sca_info
      )
        ob x;
    );
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dataflow_trace\":";
      (
        write_match_dataflow_trace
      )
        ob x;
    );
    (match x.validation_state with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"validation_state\":";
      (
        write_validation_state
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_finding ?(len = 1024) x =
  let ob = Buffer.create len in
  write_finding ob x;
  Buffer.contents ob
let read_finding = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_check_id = ref (None) in
    let field_path = ref (None) in
    let field_line = ref (None) in
    let field_column = ref (None) in
    let field_end_line = ref (None) in
    let field_end_column = ref (None) in
    let field_message = ref (None) in
    let field_severity = ref (None) in
    let field_index = ref (None) in
    let field_commit_date = ref (None) in
    let field_syntactic_id = ref (None) in
    let field_match_based_id = ref (None) in
    let field_hashes = ref (None) in
    let field_metadata = ref (None) in
    let field_is_blocking = ref (None) in
    let field_fixed_lines = ref (None) in
    let field_sca_info = ref (None) in
    let field_dataflow_trace = ref (None) in
    let field_validation_state = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'x' then (
                  8
                )
                else (
                  -1
                )
              )
            | 6 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'h' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                        12
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'e' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'e' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                        13
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'c' -> (
                            if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                              16
                            )
                            else (
                              -1
                            )
                          )
                        | 'e' -> (
                            if String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                              7
                            )
                            else (
                              -1
                            )
                          )
                        | _ -> (
                            -1
                          )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'n' then (
                  5
                )
                else (
                  -1
                )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' then (
                        9
                      )
                      else (
                        -1
                      )
                    )
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                        15
                      )
                      else (
                        -1
                      )
                    )
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' then (
                        14
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'd' then (
                  10
                )
                else (
                  -1
                )
              )
            | 14 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                        17
                      )
                      else (
                        -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'd' then (
                        11
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                  18
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_check_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 2 ->
            field_line := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 3 ->
            field_column := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 4 ->
            field_end_line := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 5 ->
            field_end_column := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 6 ->
            field_message := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 7 ->
            field_severity := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_json
                ) p lb
              )
            );
          | 8 ->
            field_index := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 9 ->
            field_commit_date := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 10 ->
            field_syntactic_id := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_match_based_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 12 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_hashes := (
                Some (
                  (
                    read_finding_hashes
                  ) p lb
                )
              );
            )
          | 13 ->
            field_metadata := (
              Some (
                (
                  read_raw_json
                ) p lb
              )
            );
          | 14 ->
            field_is_blocking := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 15 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_fixed_lines := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            )
          | 16 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_sca_info := (
                Some (
                  (
                    read_sca_info
                  ) p lb
                )
              );
            )
          | 17 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dataflow_trace := (
                Some (
                  (
                    read_match_dataflow_trace
                  ) p lb
                )
              );
            )
          | 18 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_validation_state := (
                Some (
                  (
                    read_validation_state
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'x' then (
                    8
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'h' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                          12
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'e' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'e' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                          13
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'c' -> (
                              if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                                16
                              )
                              else (
                                -1
                              )
                            )
                          | 'e' -> (
                              if String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                                7
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'n' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' then (
                          9
                        )
                        else (
                          -1
                        )
                      )
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                          15
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' then (
                          14
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'd' then (
                    10
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                          17
                        )
                        else (
                          -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'd' then (
                          11
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                    18
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_check_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 2 ->
              field_line := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 3 ->
              field_column := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 4 ->
              field_end_line := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 5 ->
              field_end_column := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 6 ->
              field_message := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 7 ->
              field_severity := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_json
                  ) p lb
                )
              );
            | 8 ->
              field_index := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 9 ->
              field_commit_date := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 10 ->
              field_syntactic_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_match_based_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 12 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_hashes := (
                  Some (
                    (
                      read_finding_hashes
                    ) p lb
                  )
                );
              )
            | 13 ->
              field_metadata := (
                Some (
                  (
                    read_raw_json
                  ) p lb
                )
              );
            | 14 ->
              field_is_blocking := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 15 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_fixed_lines := (
                  Some (
                    (
                      read__string_list
                    ) p lb
                  )
                );
              )
            | 16 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_sca_info := (
                  Some (
                    (
                      read_sca_info
                    ) p lb
                  )
                );
              )
            | 17 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dataflow_trace := (
                  Some (
                    (
                      read_match_dataflow_trace
                    ) p lb
                  )
                );
              )
            | 18 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_validation_state := (
                  Some (
                    (
                      read_validation_state
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            check_id = (match !field_check_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "check_id");
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            line = (match !field_line with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "line");
            column = (match !field_column with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "column");
            end_line = (match !field_end_line with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_line");
            end_column = (match !field_end_column with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_column");
            message = (match !field_message with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "message");
            severity = (match !field_severity with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "severity");
            index = (match !field_index with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "index");
            commit_date = (match !field_commit_date with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_date");
            syntactic_id = (match !field_syntactic_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "syntactic_id");
            match_based_id = !field_match_based_id;
            hashes = !field_hashes;
            metadata = (match !field_metadata with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "metadata");
            is_blocking = (match !field_is_blocking with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "is_blocking");
            fixed_lines = !field_fixed_lines;
            sca_info = !field_sca_info;
            dataflow_trace = !field_dataflow_trace;
            validation_state = !field_validation_state;
          }
         : finding)
      )
)
let finding_of_string s =
  read_finding (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_list_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write__string_list
  )
)
let string_of__string_list_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_list_nullable ob x;
  Buffer.contents ob
let read__string_list_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read__string_list
    ) p lb) : _ option)
)
let _string_list_nullable_of_string s =
  read__string_list_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_list_nullable_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__string_list_nullable
  )
)
let string_of__string_list_nullable_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_list_nullable_option ob x;
  Buffer.contents ob
let read__string_list_nullable_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_list_nullable
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_list_nullable
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _string_list_nullable_option_of_string s =
  read__string_list_nullable_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__position_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_position
  )
)
let string_of__position_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__position_nullable ob x;
  Buffer.contents ob
let read__position_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_position
    ) p lb) : _ option)
)
let _position_nullable_of_string s =
  read__position_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__position_nullable_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__position_nullable
  )
)
let string_of__position_nullable_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__position_nullable_option ob x;
  Buffer.contents ob
let read__position_nullable_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__position_nullable
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__position_nullable
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _position_nullable_option_of_string s =
  read__position_nullable_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_error_span : _ -> error_span -> _ = (
  fun ob (x : error_span) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"file\":";
    (
      write_fpath
    )
      ob x.file;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    (match x.source_hash with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"source_hash\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.config_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"config_start\":";
      (
        write__position_nullable
      )
        ob x;
    );
    (match x.config_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"config_end\":";
      (
        write__position_nullable
      )
        ob x;
    );
    (match x.config_path with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"config_path\":";
      (
        write__string_list_nullable
      )
        ob x;
    );
    (match x.context_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"context_start\":";
      (
        write__position_nullable
      )
        ob x;
    );
    (match x.context_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"context_end\":";
      (
        write__position_nullable
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_error_span ?(len = 1024) x =
  let ob = Buffer.create len in
  write_error_span ob x;
  Buffer.contents ob
let read_error_span = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_file = ref (None) in
    let field_start = ref (None) in
    let field_end_ = ref (None) in
    let field_source_hash = ref (None) in
    let field_config_start = ref (None) in
    let field_config_end = ref (None) in
    let field_config_path = ref (None) in
    let field_context_start = ref (None) in
    let field_context_end = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                  2
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                  1
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'd' then (
                  5
                )
                else (
                  -1
                )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' then (
                        match String.unsafe_get s (pos+3) with
                          | 'f' -> (
                              if String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' then (
                                6
                              )
                              else (
                                -1
                              )
                            )
                          | 't' -> (
                              if String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'x' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                                8
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'h' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 't' then (
                  4
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'x' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 't' then (
                  7
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_file := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 1 ->
            field_start := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 2 ->
            field_end_ := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_source_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_config_start := (
                Some (
                  (
                    read__position_nullable
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_config_end := (
                Some (
                  (
                    read__position_nullable
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_config_path := (
                Some (
                  (
                    read__string_list_nullable
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_context_start := (
                Some (
                  (
                    read__position_nullable
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_context_end := (
                Some (
                  (
                    read__position_nullable
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'd' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' then (
                          match String.unsafe_get s (pos+3) with
                            | 'f' -> (
                                if String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' then (
                                  6
                                )
                                else (
                                  -1
                                )
                              )
                            | 't' -> (
                                if String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'x' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                                  8
                                )
                                else (
                                  -1
                                )
                              )
                            | _ -> (
                                -1
                              )
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'h' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 't' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'x' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 's' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 't' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_file := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 1 ->
              field_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 2 ->
              field_end_ := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_source_hash := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_config_start := (
                  Some (
                    (
                      read__position_nullable
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_config_end := (
                  Some (
                    (
                      read__position_nullable
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_config_path := (
                  Some (
                    (
                      read__string_list_nullable
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_context_start := (
                  Some (
                    (
                      read__position_nullable
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_context_end := (
                  Some (
                    (
                      read__position_nullable
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            file = (match !field_file with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "file");
            start = (match !field_start with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start");
            end_ = (match !field_end_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_");
            source_hash = !field_source_hash;
            config_start = !field_config_start;
            config_end = !field_config_end;
            config_path = !field_config_path;
            context_start = !field_context_start;
            context_end = !field_context_end;
          }
         : error_span)
      )
)
let error_span_of_string s =
  read_error_span (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dependency_parser_error : _ -> dependency_parser_error -> _ = (
  fun ob (x : dependency_parser_error) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"parser\":";
    (
      write_sca_parser_name
    )
      ob x.parser;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"reason\":";
    (
      Yojson.Safe.write_string
    )
      ob x.reason;
    (match x.line with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"line\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    (match x.col with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"col\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    (match x.text with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"text\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_dependency_parser_error ?(len = 1024) x =
  let ob = Buffer.create len in
  write_dependency_parser_error ob x;
  Buffer.contents ob
let read_dependency_parser_error = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_parser = ref (None) in
    let field_reason = ref (None) in
    let field_line = ref (None) in
    let field_col = ref (None) in
    let field_text = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' then (
                  4
                )
                else (
                  -1
                )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 6 -> (
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_path := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_parser := (
              Some (
                (
                  read_sca_parser_name
                ) p lb
              )
            );
          | 2 ->
            field_reason := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_line := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_col := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_text := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 6 -> (
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_path := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_parser := (
                Some (
                  (
                    read_sca_parser_name
                  ) p lb
                )
              );
            | 2 ->
              field_reason := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_line := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_col := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_text := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            parser = (match !field_parser with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parser");
            reason = (match !field_reason with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reason");
            line = !field_line;
            col = !field_col;
            text = !field_text;
          }
         : dependency_parser_error)
      )
)
let dependency_parser_error_of_string s =
  read_dependency_parser_error (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_datetime = (
  Yojson.Safe.write_string
)
let string_of_datetime ?(len = 1024) x =
  let ob = Buffer.create len in
  write_datetime ob x;
  Buffer.contents ob
let read_datetime = (
  Atdgen_runtime.Oj_run.read_string
)
let datetime_of_string s =
  read_datetime (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__scan_metadata_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_scan_metadata
  )
)
let string_of__scan_metadata_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__scan_metadata_option ob x;
  Buffer.contents ob
let read__scan_metadata_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_scan_metadata
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_scan_metadata
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _scan_metadata_option_of_string s =
  read__scan_metadata_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__project_metadata_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_project_metadata
  )
)
let string_of__project_metadata_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__project_metadata_option ob x;
  Buffer.contents ob
let read__project_metadata_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_project_metadata
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_project_metadata
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _project_metadata_option_of_string s =
  read__project_metadata_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__abstract_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_json
  )
)
let string_of__abstract_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__abstract_option ob x;
  Buffer.contents ob
let read__abstract_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_json
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_json
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _abstract_option_of_string s =
  read__abstract_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_create_scan_request : _ -> create_scan_request -> _ = (
  fun ob (x : create_scan_request) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"meta\":";
    (
      Yojson.Safe.write_json
    )
      ob x.meta;
    (match x.project_metadata with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"project_metadata\":";
      (
        write_project_metadata
      )
        ob x;
    );
    (match x.project_config with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"project_config\":";
      (
        Yojson.Safe.write_json
      )
        ob x;
    );
    (match x.scan_metadata with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"scan_metadata\":";
      (
        write_scan_metadata
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_create_scan_request ?(len = 1024) x =
  let ob = Buffer.create len in
  write_create_scan_request ob x;
  Buffer.contents ob
let read_create_scan_request = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_meta = ref (None) in
    let field_project_metadata = ref (None) in
    let field_project_config = ref (None) in
    let field_scan_metadata = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                  0
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = 'a' then (
                  3
                )
                else (
                  -1
                )
              )
            | 14 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'g' then (
                  2
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'a' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_meta := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_json
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_project_metadata := (
                Some (
                  (
                    read_project_metadata
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_project_config := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_json
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_scan_metadata := (
                Some (
                  (
                    read_scan_metadata
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = 'a' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'f' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'g' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'j' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'a' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_meta := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_json
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_project_metadata := (
                  Some (
                    (
                      read_project_metadata
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_project_config := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_json
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_scan_metadata := (
                  Some (
                    (
                      read_scan_metadata
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            meta = (match !field_meta with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "meta");
            project_metadata = !field_project_metadata;
            project_config = !field_project_config;
            scan_metadata = !field_scan_metadata;
          }
         : create_scan_request)
      )
)
let create_scan_request_of_string s =
  read_create_scan_request (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_severity : _ -> core_severity -> _ = (
  fun ob x ->
    match x with
      | Error -> Buffer.add_string ob "\"error\""
      | Warning -> Buffer.add_string ob "\"warning\""
      | Info -> Buffer.add_string ob "\"info\""
)
let string_of_core_severity ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_severity ob x;
  Buffer.contents ob
let read_core_severity = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Error : core_severity)
            | "warning" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Warning : core_severity)
            | "info" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Info : core_severity)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "error" ->
              (Error : core_severity)
            | "warning" ->
              (Warning : core_severity)
            | "info" ->
              (Info : core_severity)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let core_severity_of_string s =
  read_core_severity (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__location_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_location
  )
)
let string_of__location_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__location_list ob x;
  Buffer.contents ob
let read__location_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_location
  )
)
let _location_list_of_string s =
  read__location_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_error_kind : _ -> core_error_kind -> _ = (
  fun ob x ->
    match x with
      | LexicalError -> Buffer.add_string ob "\"Lexical error\""
      | ParseError -> Buffer.add_string ob "\"Syntax error\""
      | SpecifiedParseError -> Buffer.add_string ob "\"Other syntax error\""
      | AstBuilderError -> Buffer.add_string ob "\"AST builder error\""
      | RuleParseError -> Buffer.add_string ob "\"Rule parse error\""
      | PatternParseError x ->
        Buffer.add_string ob "[\"Pattern parse error\",";
        (
          write__string_list
        ) ob x;
        Buffer.add_char ob ']'
      | InvalidYaml -> Buffer.add_string ob "\"Invalid YAML\""
      | MatchingError -> Buffer.add_string ob "\"Internal matching error\""
      | SemgrepMatchFound -> Buffer.add_string ob "\"Semgrep match found\""
      | TooManyMatches -> Buffer.add_string ob "\"Too many matches\""
      | FatalError -> Buffer.add_string ob "\"Fatal error\""
      | Timeout -> Buffer.add_string ob "\"Timeout\""
      | OutOfMemory -> Buffer.add_string ob "\"Out of memory\""
      | TimeoutDuringInterfile -> Buffer.add_string ob "\"Timeout during interfile analysis\""
      | OutOfMemoryDuringInterfile -> Buffer.add_string ob "\"OOM during interfile analysis\""
      | PartialParsing x ->
        Buffer.add_string ob "[\"PartialParsing\",";
        (
          write__location_list
        ) ob x;
        Buffer.add_char ob ']'
      | IncompatibleRule x ->
        Buffer.add_string ob "[\"IncompatibleRule\",";
        (
          write_incompatible_rule
        ) ob x;
        Buffer.add_char ob ']'
      | MissingPlugin -> Buffer.add_string ob "\"MissingPlugin\""
)
let string_of_core_error_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_error_kind ob x;
  Buffer.contents ob
let read_core_error_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Lexical error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (LexicalError : core_error_kind)
            | "Syntax error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (ParseError : core_error_kind)
            | "Other syntax error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (SpecifiedParseError : core_error_kind)
            | "AST builder error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (AstBuilderError : core_error_kind)
            | "Rule parse error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (RuleParseError : core_error_kind)
            | "Pattern parse error" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (PatternParseError x : core_error_kind)
            | "Invalid YAML" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (InvalidYaml : core_error_kind)
            | "Internal matching error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (MatchingError : core_error_kind)
            | "Semgrep match found" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (SemgrepMatchFound : core_error_kind)
            | "Too many matches" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (TooManyMatches : core_error_kind)
            | "Fatal error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (FatalError : core_error_kind)
            | "Timeout" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Timeout : core_error_kind)
            | "Out of memory" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (OutOfMemory : core_error_kind)
            | "Timeout during interfile analysis" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (TimeoutDuringInterfile : core_error_kind)
            | "OOM during interfile analysis" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (OutOfMemoryDuringInterfile : core_error_kind)
            | "PartialParsing" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__location_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (PartialParsing x : core_error_kind)
            | "IncompatibleRule" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_incompatible_rule
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (IncompatibleRule x : core_error_kind)
            | "MissingPlugin" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (MissingPlugin : core_error_kind)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Lexical error" ->
              (LexicalError : core_error_kind)
            | "Syntax error" ->
              (ParseError : core_error_kind)
            | "Other syntax error" ->
              (SpecifiedParseError : core_error_kind)
            | "AST builder error" ->
              (AstBuilderError : core_error_kind)
            | "Rule parse error" ->
              (RuleParseError : core_error_kind)
            | "Invalid YAML" ->
              (InvalidYaml : core_error_kind)
            | "Internal matching error" ->
              (MatchingError : core_error_kind)
            | "Semgrep match found" ->
              (SemgrepMatchFound : core_error_kind)
            | "Too many matches" ->
              (TooManyMatches : core_error_kind)
            | "Fatal error" ->
              (FatalError : core_error_kind)
            | "Timeout" ->
              (Timeout : core_error_kind)
            | "Out of memory" ->
              (OutOfMemory : core_error_kind)
            | "Timeout during interfile analysis" ->
              (TimeoutDuringInterfile : core_error_kind)
            | "OOM during interfile analysis" ->
              (OutOfMemoryDuringInterfile : core_error_kind)
            | "MissingPlugin" ->
              (MissingPlugin : core_error_kind)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Pattern parse error" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (PatternParseError x : core_error_kind)
            | "PartialParsing" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__location_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (PartialParsing x : core_error_kind)
            | "IncompatibleRule" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_incompatible_rule
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (IncompatibleRule x : core_error_kind)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let core_error_kind_of_string s =
  read_core_error_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_error : _ -> core_error -> _ = (
  fun ob (x : core_error) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"error_type\":";
    (
      write_core_error_kind
    )
      ob x.error_type;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"severity\":";
    (
      write_core_severity
    )
      ob x.severity;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    (match x.details with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"details\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_core_error ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_error ob x;
  Buffer.contents ob
let read_core_error = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_error_type = ref (None) in
    let field_severity = ref (None) in
    let field_location = ref (None) in
    let field_message = ref (None) in
    let field_details = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            )
          | 1 ->
            field_error_type := (
              Some (
                (
                  read_core_error_kind
                ) p lb
              )
            );
          | 2 ->
            field_severity := (
              Some (
                (
                  read_core_severity
                ) p lb
              )
            );
          | 3 ->
            field_location := (
              Some (
                (
                  read_location
                ) p lb
              )
            );
          | 4 ->
            field_message := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_details := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 's' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rule_id := (
                  Some (
                    (
                      read_rule_id
                    ) p lb
                  )
                );
              )
            | 1 ->
              field_error_type := (
                Some (
                  (
                    read_core_error_kind
                  ) p lb
                )
              );
            | 2 ->
              field_severity := (
                Some (
                  (
                    read_core_severity
                  ) p lb
                )
              );
            | 3 ->
              field_location := (
                Some (
                  (
                    read_location
                  ) p lb
                )
              );
            | 4 ->
              field_message := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_details := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            rule_id = !field_rule_id;
            error_type = (match !field_error_type with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "error_type");
            severity = (match !field_severity with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "severity");
            location = (match !field_location with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "location");
            message = (match !field_message with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "message");
            details = !field_details;
          }
         : core_error)
      )
)
let core_error_of_string s =
  read_core_error (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__skipped_rule_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_skipped_rule
  )
)
let string_of__skipped_rule_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__skipped_rule_list ob x;
  Buffer.contents ob
let read__skipped_rule_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_skipped_rule
  )
)
let _skipped_rule_list_of_string s =
  read__skipped_rule_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__profile_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_profile
  )
)
let string_of__profile_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__profile_option ob x;
  Buffer.contents ob
let read__profile_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_profile
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_profile
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _profile_option_of_string s =
  read__profile_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__list_a3e89bb = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule_id_and_engine_kind
  )
)
let string_of__list_a3e89bb ?(len = 1024) x =
  let ob = Buffer.create len in
  write__list_a3e89bb ob x;
  Buffer.contents ob
let read__list_a3e89bb = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule_id_and_engine_kind
  )
)
let _list_a3e89bb_of_string s =
  read__list_a3e89bb (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__option_d7f1ad8 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__list_a3e89bb
  )
)
let string_of__option_d7f1ad8 ?(len = 1024) x =
  let ob = Buffer.create len in
  write__option_d7f1ad8 ob x;
  Buffer.contents ob
let read__option_d7f1ad8 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__list_a3e89bb
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__list_a3e89bb
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _option_d7f1ad8_of_string s =
  read__option_d7f1ad8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__matching_explanation_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__matching_explanation_list
  )
)
let string_of__matching_explanation_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__matching_explanation_list_option ob x;
  Buffer.contents ob
let read__matching_explanation_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__matching_explanation_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__matching_explanation_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _matching_explanation_list_option_of_string s =
  read__matching_explanation_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__engine_kind_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_engine_kind
  )
)
let string_of__engine_kind_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__engine_kind_option ob x;
  Buffer.contents ob
let read__engine_kind_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_engine_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_engine_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _engine_kind_option_of_string s =
  read__engine_kind_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__core_error_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_core_error
  )
)
let string_of__core_error_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__core_error_list ob x;
  Buffer.contents ob
let read__core_error_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_core_error
  )
)
let _core_error_list_of_string s =
  read__core_error_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_output : _ -> core_output -> _ = (
  fun ob (x : core_output) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"version\":";
      (
        write_version
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"results\":";
    (
      write__core_match_list
    )
      ob x.results;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"errors\":";
    (
      write__core_error_list
    )
      ob x.errors;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"paths\":";
    (
      write_scanned_and_skipped
    )
      ob x.paths;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"time\":";
      (
        write_profile
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"explanations\":";
      (
        write__matching_explanation_list
      )
        ob x;
    );
    (match x.rules_by_engine with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rules_by_engine\":";
      (
        write__list_a3e89bb
      )
        ob x;
    );
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"engine_requested\":";
      (
        write_engine_kind
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"skipped_rules\":";
    (
      write__skipped_rule_list
    )
      ob x.skipped_rules;
    Buffer.add_char ob '}';
)
let string_of_core_output ?(len = 1024) x =
  let ob = Buffer.create len in
  write_core_output ob x;
  Buffer.contents ob
let read_core_output = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_version = ref (None) in
    let field_results = ref (None) in
    let field_errors = ref (None) in
    let field_paths = ref (None) in
    let field_time = ref (None) in
    let field_explanations = ref (None) in
    let field_rules_by_engine = ref (None) in
    let field_engine_requested = ref (None) in
    let field_skipped_rules = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                  5
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  8
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                  7
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            )
          | 1 ->
            field_results := (
              Some (
                (
                  read__core_match_list
                ) p lb
              )
            );
          | 2 ->
            field_errors := (
              Some (
                (
                  read__core_error_list
                ) p lb
              )
            );
          | 3 ->
            field_paths := (
              Some (
                (
                  read_scanned_and_skipped
                ) p lb
              )
            );
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_profile
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__matching_explanation_list
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules_by_engine := (
                Some (
                  (
                    read__list_a3e89bb
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_engine_requested := (
                Some (
                  (
                    read_engine_kind
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped_rules := (
                (
                  read__skipped_rule_list
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    8
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_version := (
                  Some (
                    (
                      read_version
                    ) p lb
                  )
                );
              )
            | 1 ->
              field_results := (
                Some (
                  (
                    read__core_match_list
                  ) p lb
                )
              );
            | 2 ->
              field_errors := (
                Some (
                  (
                    read__core_error_list
                  ) p lb
                )
              );
            | 3 ->
              field_paths := (
                Some (
                  (
                    read_scanned_and_skipped
                  ) p lb
                )
              );
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_profile
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__matching_explanation_list
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules_by_engine := (
                  Some (
                    (
                      read__list_a3e89bb
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_engine_requested := (
                  Some (
                    (
                      read_engine_kind
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped_rules := (
                  (
                    read__skipped_rule_list
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            version = !field_version;
            results = (match !field_results with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "results");
            errors = (match !field_errors with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "errors");
            paths = (match !field_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "paths");
            time = !field_time;
            explanations = !field_explanations;
            rules_by_engine = !field_rules_by_engine;
            engine_requested = !field_engine_requested;
            skipped_rules = !field_skipped_rules;
          }
         : core_output)
      )
)
let core_output_of_string s =
  read_core_output (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_contributor : _ -> contributor -> _ = (
  fun ob (x : contributor) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_author_name;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_author_email\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_author_email;
    Buffer.add_char ob '}';
)
let string_of_contributor ?(len = 1024) x =
  let ob = Buffer.create len in
  write_contributor ob x;
  Buffer.contents ob
let read_contributor = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_commit_author_name = ref (None) in
    let field_commit_author_email = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 18 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 19 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'i' && String.unsafe_get s (pos+18) = 'l' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_commit_author_name := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_commit_author_email := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 18 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'n' && String.unsafe_get s (pos+15) = 'a' && String.unsafe_get s (pos+16) = 'm' && String.unsafe_get s (pos+17) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 19 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'u' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'h' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'm' && String.unsafe_get s (pos+16) = 'a' && String.unsafe_get s (pos+17) = 'i' && String.unsafe_get s (pos+18) = 'l' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_commit_author_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_commit_author_email := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            commit_author_name = (match !field_commit_author_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_name");
            commit_author_email = (match !field_commit_author_email with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_author_email");
          }
         : contributor)
      )
)
let contributor_of_string s =
  read_contributor (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_contribution : _ -> contribution -> _ = (
  fun ob (x : contribution) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_hash\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_hash;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"commit_timestamp\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_timestamp;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"contributor\":";
    (
      write_contributor
    )
      ob x.contributor;
    Buffer.add_char ob '}';
)
let string_of_contribution ?(len = 1024) x =
  let ob = Buffer.create len in
  write_contribution ob x;
  Buffer.contents ob
let read_contribution = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_commit_hash = ref (None) in
    let field_commit_timestamp = ref (None) in
    let field_contributor = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 11 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' then (
                  match String.unsafe_get s (pos+2) with
                    | 'm' -> (
                        if String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'h' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'n' -> (
                        if String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'r' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'p' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_commit_hash := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_commit_timestamp := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_contributor := (
              Some (
                (
                  read_contributor
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 11 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' then (
                    match String.unsafe_get s (pos+2) with
                      | 'm' -> (
                          if String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'h' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'h' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | 'n' -> (
                          if String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'r' then (
                            2
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'p' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_commit_hash := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_commit_timestamp := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_contributor := (
                Some (
                  (
                    read_contributor
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            commit_hash = (match !field_commit_hash with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_hash");
            commit_timestamp = (match !field_commit_timestamp with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "commit_timestamp");
            contributor = (match !field_contributor with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "contributor");
          }
         : contribution)
      )
)
let contribution_of_string s =
  read_contribution (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__contribution_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_contribution
  )
)
let string_of__contribution_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__contribution_list ob x;
  Buffer.contents ob
let read__contribution_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_contribution
  )
)
let _contribution_list_of_string s =
  read__contribution_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_contributions = (
  write__contribution_list
)
let string_of_contributions ?(len = 1024) x =
  let ob = Buffer.create len in
  write_contributions ob x;
  Buffer.contents ob
let read_contributions = (
  read__contribution_list
)
let contributions_of_string s =
  read_contributions (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_output_extra : _ -> cli_output_extra -> _ = (
  fun ob (x : cli_output_extra) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"paths\":";
    (
      write_scanned_and_skipped
    )
      ob x.paths;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"time\":";
      (
        write_profile
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"explanations\":";
      (
        write__matching_explanation_list
      )
        ob x;
    );
    (match x.rules_by_engine with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rules_by_engine\":";
      (
        write__list_a3e89bb
      )
        ob x;
    );
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"engine_requested\":";
      (
        write_engine_kind
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"skipped_rules\":";
    (
      write__skipped_rule_list
    )
      ob x.skipped_rules;
    Buffer.add_char ob '}';
)
let string_of_cli_output_extra ?(len = 1024) x =
  let ob = Buffer.create len in
  write_cli_output_extra ob x;
  Buffer.contents ob
let read_cli_output_extra = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_paths = ref (None) in
    let field_time = ref (None) in
    let field_explanations = ref (None) in
    let field_rules_by_engine = ref (None) in
    let field_engine_requested = ref (None) in
    let field_skipped_rules = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  5
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                  3
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                  4
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_paths := (
              Some (
                (
                  read_scanned_and_skipped
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_profile
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__matching_explanation_list
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules_by_engine := (
                Some (
                  (
                    read__list_a3e89bb
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_engine_requested := (
                Some (
                  (
                    read_engine_kind
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped_rules := (
                (
                  read__skipped_rule_list
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_paths := (
                Some (
                  (
                    read_scanned_and_skipped
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_profile
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__matching_explanation_list
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules_by_engine := (
                  Some (
                    (
                      read__list_a3e89bb
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_engine_requested := (
                  Some (
                    (
                      read_engine_kind
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped_rules := (
                  (
                    read__skipped_rule_list
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            paths = (match !field_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "paths");
            time = !field_time;
            explanations = !field_explanations;
            rules_by_engine = !field_rules_by_engine;
            engine_requested = !field_engine_requested;
            skipped_rules = !field_skipped_rules;
          }
         : cli_output_extra)
      )
)
let cli_output_extra_of_string s =
  read_cli_output_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__metavars_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_metavars
  )
)
let string_of__metavars_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__metavars_option ob x;
  Buffer.contents ob
let read__metavars_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_metavars
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_metavars
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _metavars_option_of_string s =
  read__metavars_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__fix_regex_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_fix_regex
  )
)
let string_of__fix_regex_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__fix_regex_option ob x;
  Buffer.contents ob
let read__fix_regex_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_fix_regex
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_fix_regex
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _fix_regex_option_of_string s =
  read__fix_regex_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match_extra : _ -> cli_match_extra -> _ = (
  fun ob (x : cli_match_extra) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.metavars with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"metavars\":";
      (
        write_metavars
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fingerprint\":";
    (
      Yojson.Safe.write_string
    )
      ob x.fingerprint;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"lines\":";
    (
      Yojson.Safe.write_string
    )
      ob x.lines;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"metadata\":";
    (
      write_raw_json
    )
      ob x.metadata;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"severity\":";
    (
      Yojson.Safe.write_string
    )
      ob x.severity;
    (match x.fix with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"fix\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.fix_regex with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"fix_regex\":";
      (
        write_fix_regex
      )
        ob x;
    );
    (match x.is_ignored with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"is_ignored\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    (match x.sca_info with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"sca_info\":";
      (
        write_sca_info
      )
        ob x;
    );
    (match x.fixed_lines with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"fixed_lines\":";
      (
        write__string_list
      )
        ob x;
    );
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dataflow_trace\":";
      (
        write_match_dataflow_trace
      )
        ob x;
    );
    (match x.engine_kind with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"engine_kind\":";
      (
        write_engine_kind
      )
        ob x;
    );
    (match x.validation_state with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"validation_state\":";
      (
        write_validation_state
      )
        ob x;
    );
    (match x.extra_extra with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"extra_extra\":";
      (
        write_raw_json
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_cli_match_extra ?(len = 1024) x =
  let ob = Buffer.create len in
  write_cli_match_extra ob x;
  Buffer.contents ob
let read_cli_match_extra = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_metavars = ref (None) in
    let field_fingerprint = ref (None) in
    let field_lines = ref (None) in
    let field_message = ref (None) in
    let field_metadata = ref (None) in
    let field_severity = ref (None) in
    let field_fix = ref (None) in
    let field_fix_regex = ref (None) in
    let field_is_ignored = ref (None) in
    let field_sca_info = ref (None) in
    let field_fixed_lines = ref (None) in
    let field_dataflow_trace = ref (None) in
    let field_engine_kind = ref (None) in
    let field_validation_state = ref (None) in
    let field_extra_extra = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' then (
                  6
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                  3
                )
                else (
                  -1
                )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                        match String.unsafe_get s (pos+4) with
                          | 'd' -> (
                              if String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                                4
                              )
                              else (
                                -1
                              )
                            )
                          | 'v' -> (
                              if String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                                0
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'c' -> (
                            if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                              9
                            )
                            else (
                              -1
                            )
                          )
                        | 'e' -> (
                            if String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                              5
                            )
                            else (
                              -1
                            )
                          )
                        | _ -> (
                            -1
                          )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'x' then (
                  7
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' then (
                  8
                )
                else (
                  -1
                )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'e' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'n' -> (
                            if String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                              12
                            )
                            else (
                              -1
                            )
                          )
                        | 'x' -> (
                            if String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'x' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'a' then (
                              14
                            )
                            else (
                              -1
                            )
                          )
                        | _ -> (
                            -1
                          )
                    )
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'i' then (
                        match String.unsafe_get s (pos+2) with
                          | 'n' -> (
                              if String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                                1
                              )
                              else (
                                -1
                              )
                            )
                          | 'x' -> (
                              if String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                                10
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 14 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                  11
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                  13
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_metavars := (
                Some (
                  (
                    read_metavars
                  ) p lb
                )
              );
            )
          | 1 ->
            field_fingerprint := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_lines := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            field_message := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 4 ->
            field_metadata := (
              Some (
                (
                  read_raw_json
                ) p lb
              )
            );
          | 5 ->
            field_severity := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_fix := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_fix_regex := (
                Some (
                  (
                    read_fix_regex
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_is_ignored := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_sca_info := (
                Some (
                  (
                    read_sca_info
                  ) p lb
                )
              );
            )
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_fixed_lines := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            )
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dataflow_trace := (
                Some (
                  (
                    read_match_dataflow_trace
                  ) p lb
                )
              );
            )
          | 12 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_engine_kind := (
                Some (
                  (
                    read_engine_kind
                  ) p lb
                )
              );
            )
          | 13 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_validation_state := (
                Some (
                  (
                    read_validation_state
                  ) p lb
                )
              );
            )
          | 14 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_extra_extra := (
                Some (
                  (
                    read_raw_json
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                          match String.unsafe_get s (pos+4) with
                            | 'd' -> (
                                if String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                                  4
                                )
                                else (
                                  -1
                                )
                              )
                            | 'v' -> (
                                if String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                                  0
                                )
                                else (
                                  -1
                                )
                              )
                            | _ -> (
                                -1
                              )
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'c' -> (
                              if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                                9
                              )
                              else (
                                -1
                              )
                            )
                          | 'e' -> (
                              if String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'y' then (
                                5
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'x' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' then (
                    8
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'e' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'n' -> (
                              if String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                                12
                              )
                              else (
                                -1
                              )
                            )
                          | 'x' -> (
                              if String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'x' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'a' then (
                                14
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'i' then (
                          match String.unsafe_get s (pos+2) with
                            | 'n' -> (
                                if String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                                  1
                                )
                                else (
                                  -1
                                )
                              )
                            | 'x' -> (
                                if String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 's' then (
                                  10
                                )
                                else (
                                  -1
                                )
                              )
                            | _ -> (
                                -1
                              )
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'w' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'r' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'c' && String.unsafe_get s (pos+13) = 'e' then (
                    11
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' then (
                    13
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_metavars := (
                  Some (
                    (
                      read_metavars
                    ) p lb
                  )
                );
              )
            | 1 ->
              field_fingerprint := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_lines := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              field_message := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 4 ->
              field_metadata := (
                Some (
                  (
                    read_raw_json
                  ) p lb
                )
              );
            | 5 ->
              field_severity := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_fix := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_fix_regex := (
                  Some (
                    (
                      read_fix_regex
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_is_ignored := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_sca_info := (
                  Some (
                    (
                      read_sca_info
                    ) p lb
                  )
                );
              )
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_fixed_lines := (
                  Some (
                    (
                      read__string_list
                    ) p lb
                  )
                );
              )
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dataflow_trace := (
                  Some (
                    (
                      read_match_dataflow_trace
                    ) p lb
                  )
                );
              )
            | 12 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_engine_kind := (
                  Some (
                    (
                      read_engine_kind
                    ) p lb
                  )
                );
              )
            | 13 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_validation_state := (
                  Some (
                    (
                      read_validation_state
                    ) p lb
                  )
                );
              )
            | 14 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_extra_extra := (
                  Some (
                    (
                      read_raw_json
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            metavars = !field_metavars;
            fingerprint = (match !field_fingerprint with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fingerprint");
            lines = (match !field_lines with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "lines");
            message = (match !field_message with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "message");
            metadata = (match !field_metadata with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "metadata");
            severity = (match !field_severity with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "severity");
            fix = !field_fix;
            fix_regex = !field_fix_regex;
            is_ignored = !field_is_ignored;
            sca_info = !field_sca_info;
            fixed_lines = !field_fixed_lines;
            dataflow_trace = !field_dataflow_trace;
            engine_kind = !field_engine_kind;
            validation_state = !field_validation_state;
            extra_extra = !field_extra_extra;
          }
         : cli_match_extra)
      )
)
let cli_match_extra_of_string s =
  read_cli_match_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match : _ -> cli_match -> _ = (
  fun ob (x : cli_match) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"check_id\":";
    (
      write_rule_id
    )
      ob x.check_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"path\":";
    (
      write_fpath
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"extra\":";
    (
      write_cli_match_extra
    )
      ob x.extra;
    Buffer.add_char ob '}';
)
let string_of_cli_match ?(len = 1024) x =
  let ob = Buffer.create len in
  write_cli_match ob x;
  Buffer.contents ob
let read_cli_match = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_check_id = ref (None) in
    let field_path = ref (None) in
    let field_start = ref (None) in
    let field_end_ = ref (None) in
    let field_extra = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                  3
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                  1
                )
                else (
                  -1
                )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'e' -> (
                      if String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_check_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_path := (
              Some (
                (
                  read_fpath
                ) p lb
              )
            );
          | 2 ->
            field_start := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 3 ->
            field_end_ := (
              Some (
                (
                  read_position
                ) p lb
              )
            );
          | 4 ->
            field_extra := (
              Some (
                (
                  read_cli_match_extra
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'e' -> (
                        if String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'k' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_check_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            | 2 ->
              field_start := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 3 ->
              field_end_ := (
                Some (
                  (
                    read_position
                  ) p lb
                )
              );
            | 4 ->
              field_extra := (
                Some (
                  (
                    read_cli_match_extra
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            check_id = (match !field_check_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "check_id");
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            start = (match !field_start with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "start");
            end_ = (match !field_end_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "end_");
            extra = (match !field_extra with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "extra");
          }
         : cli_match)
      )
)
let cli_match_of_string s =
  read_cli_match (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__fpath_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_fpath
  )
)
let string_of__fpath_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__fpath_option ob x;
  Buffer.contents ob
let read__fpath_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_fpath
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_fpath
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _fpath_option_of_string s =
  read__fpath_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__error_span_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_error_span
  )
)
let string_of__error_span_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__error_span_list ob x;
  Buffer.contents ob
let read__error_span_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_error_span
  )
)
let _error_span_list_of_string s =
  read__error_span_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__error_span_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__error_span_list
  )
)
let string_of__error_span_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__error_span_list_option ob x;
  Buffer.contents ob
let read__error_span_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__error_span_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__error_span_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _error_span_list_option_of_string s =
  read__error_span_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_error : _ -> cli_error -> _ = (
  fun ob (x : cli_error) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"code\":";
    (
      Yojson.Safe.write_int
    )
      ob x.code;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"level\":";
    (
      Yojson.Safe.write_string
    )
      ob x.level;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"type\":";
    (
      Yojson.Safe.write_string
    )
      ob x.type_;
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    (match x.message with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"message\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.path with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"path\":";
      (
        write_fpath
      )
        ob x;
    );
    (match x.long_msg with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"long_msg\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.short_msg with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"short_msg\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.spans with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"spans\":";
      (
        write__error_span_list
      )
        ob x;
    );
    (match x.help with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"help\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_cli_error ?(len = 1024) x =
  let ob = Buffer.create len in
  write_cli_error ob x;
  Buffer.contents ob
let read_cli_error = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_code = ref (None) in
    let field_level = ref (None) in
    let field_type_ = ref (None) in
    let field_rule_id = ref (None) in
    let field_message = ref (None) in
    let field_path = ref (None) in
    let field_long_msg = ref (None) in
    let field_short_msg = ref (None) in
    let field_spans = ref (None) in
    let field_help = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'h' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'p' then (
                        9
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 's' then (
                        8
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'g' then (
                  6
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'g' then (
                  7
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_code := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_level := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_type_ := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_message := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_path := (
                Some (
                  (
                    read_fpath
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_long_msg := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_short_msg := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_spans := (
                Some (
                  (
                    read__error_span_list
                  ) p lb
                )
              );
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_help := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'h' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'p' then (
                          9
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 's' then (
                          8
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'g' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'g' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_code := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_level := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_type_ := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rule_id := (
                  Some (
                    (
                      read_rule_id
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_message := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_path := (
                  Some (
                    (
                      read_fpath
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_long_msg := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_short_msg := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_spans := (
                  Some (
                    (
                      read__error_span_list
                    ) p lb
                  )
                );
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_help := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            code = (match !field_code with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "code");
            level = (match !field_level with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "level");
            type_ = (match !field_type_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "type_");
            rule_id = !field_rule_id;
            message = !field_message;
            path = !field_path;
            long_msg = !field_long_msg;
            short_msg = !field_short_msg;
            spans = !field_spans;
            help = !field_help;
          }
         : cli_error)
      )
)
let cli_error_of_string s =
  read_cli_error (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__cli_match_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_match
  )
)
let string_of__cli_match_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__cli_match_list ob x;
  Buffer.contents ob
let read__cli_match_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_match
  )
)
let _cli_match_list_of_string s =
  read__cli_match_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__cli_error_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_error
  )
)
let string_of__cli_error_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__cli_error_list ob x;
  Buffer.contents ob
let read__cli_error_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_error
  )
)
let _cli_error_list_of_string s =
  read__cli_error_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_output : _ -> cli_output -> _ = (
  fun ob (x : cli_output) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"version\":";
      (
        write_version
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"errors\":";
    (
      write__cli_error_list
    )
      ob x.errors;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"results\":";
    (
      write__cli_match_list
    )
      ob x.results;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"paths\":";
    (
      write_scanned_and_skipped
    )
      ob x.paths;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"time\":";
      (
        write_profile
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"explanations\":";
      (
        write__matching_explanation_list
      )
        ob x;
    );
    (match x.rules_by_engine with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"rules_by_engine\":";
      (
        write__list_a3e89bb
      )
        ob x;
    );
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"engine_requested\":";
      (
        write_engine_kind
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"skipped_rules\":";
    (
      write__skipped_rule_list
    )
      ob x.skipped_rules;
    Buffer.add_char ob '}';
)
let string_of_cli_output ?(len = 1024) x =
  let ob = Buffer.create len in
  write_cli_output ob x;
  Buffer.contents ob
let read_cli_output = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_version = ref (None) in
    let field_errors = ref (None) in
    let field_results = ref (None) in
    let field_paths = ref (None) in
    let field_time = ref (None) in
    let field_explanations = ref (None) in
    let field_rules_by_engine = ref (None) in
    let field_engine_requested = ref (None) in
    let field_skipped_rules = ref ([]) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                  5
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  8
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                  7
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_version := (
                Some (
                  (
                    read_version
                  ) p lb
                )
              );
            )
          | 1 ->
            field_errors := (
              Some (
                (
                  read__cli_error_list
                ) p lb
              )
            );
          | 2 ->
            field_results := (
              Some (
                (
                  read__cli_match_list
                ) p lb
              )
            );
          | 3 ->
            field_paths := (
              Some (
                (
                  read_scanned_and_skipped
                ) p lb
              )
            );
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_profile
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__matching_explanation_list
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules_by_engine := (
                Some (
                  (
                    read__list_a3e89bb
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_engine_requested := (
                Some (
                  (
                    read_engine_kind
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped_rules := (
                (
                  read__skipped_rule_list
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    8
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'g' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_version := (
                  Some (
                    (
                      read_version
                    ) p lb
                  )
                );
              )
            | 1 ->
              field_errors := (
                Some (
                  (
                    read__cli_error_list
                  ) p lb
                )
              );
            | 2 ->
              field_results := (
                Some (
                  (
                    read__cli_match_list
                  ) p lb
                )
              );
            | 3 ->
              field_paths := (
                Some (
                  (
                    read_scanned_and_skipped
                  ) p lb
                )
              );
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_profile
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__matching_explanation_list
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules_by_engine := (
                  Some (
                    (
                      read__list_a3e89bb
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_engine_requested := (
                  Some (
                    (
                      read_engine_kind
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped_rules := (
                  (
                    read__skipped_rule_list
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            version = !field_version;
            errors = (match !field_errors with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "errors");
            results = (match !field_results with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "results");
            paths = (match !field_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "paths");
            time = !field_time;
            explanations = !field_explanations;
            rules_by_engine = !field_rules_by_engine;
            engine_requested = !field_engine_requested;
            skipped_rules = !field_skipped_rules;
          }
         : cli_output)
      )
)
let cli_output_of_string s =
  read_cli_output (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__found_dependency_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_found_dependency
  )
)
let string_of__found_dependency_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__found_dependency_list ob x;
  Buffer.contents ob
let read__found_dependency_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_found_dependency
  )
)
let _found_dependency_list_of_string s =
  read__found_dependency_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_a534bf0 = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write__found_dependency_list
  )
)
let string_of__x_a534bf0 ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_a534bf0 ob x;
  Buffer.contents ob
let read__x_a534bf0 = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read__found_dependency_list
  )
)
let _x_a534bf0_of_string s =
  read__x_a534bf0 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ci_scan_dependencies = (
  write__x_a534bf0
)
let string_of_ci_scan_dependencies ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ci_scan_dependencies ob x;
  Buffer.contents ob
let read_ci_scan_dependencies = (
  read__x_a534bf0
)
let ci_scan_dependencies_of_string s =
  read_ci_scan_dependencies (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__finding_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_finding
  )
)
let string_of__finding_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__finding_list ob x;
  Buffer.contents ob
let read__finding_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_finding
  )
)
let _finding_list_of_string s =
  read__finding_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__contributions_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_contributions
  )
)
let string_of__contributions_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__contributions_option ob x;
  Buffer.contents ob
let read__contributions_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_contributions
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_contributions
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _contributions_option_of_string s =
  read__contributions_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__ci_scan_dependencies_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_ci_scan_dependencies
  )
)
let string_of__ci_scan_dependencies_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__ci_scan_dependencies_option ob x;
  Buffer.contents ob
let read__ci_scan_dependencies_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_ci_scan_dependencies
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_ci_scan_dependencies
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _ci_scan_dependencies_option_of_string s =
  read__ci_scan_dependencies_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ci_scan_results : _ -> ci_scan_results -> _ = (
  fun ob (x : ci_scan_results) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"findings\":";
    (
      write__finding_list
    )
      ob x.findings;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ignores\":";
    (
      write__finding_list
    )
      ob x.ignores;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"token\":";
    (
      write__string_nullable
    )
      ob x.token;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"searched_paths\":";
    (
      write__string_list
    )
      ob x.searched_paths;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"renamed_paths\":";
    (
      write__string_list
    )
      ob x.renamed_paths;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"rule_ids\":";
    (
      write__rule_id_list
    )
      ob x.rule_ids;
    (match x.contributions with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"contributions\":";
      (
        write_contributions
      )
        ob x;
    );
    (match x.dependencies with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dependencies\":";
      (
        write_ci_scan_dependencies
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_ci_scan_results ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ci_scan_results ob x;
  Buffer.contents ob
let read_ci_scan_results = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_findings = ref (None) in
    let field_ignores = ref (None) in
    let field_token = ref (None) in
    let field_searched_paths = ref (None) in
    let field_renamed_paths = ref (None) in
    let field_rule_ids = ref (None) in
    let field_contributions = ref (None) in
    let field_dependencies = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' then (
                  2
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 's' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                  7
                )
                else (
                  -1
                )
              )
            | 13 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 's' then (
                        6
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 's' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 14 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = 'h' && String.unsafe_get s (pos+13) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_findings := (
              Some (
                (
                  read__finding_list
                ) p lb
              )
            );
          | 1 ->
            field_ignores := (
              Some (
                (
                  read__finding_list
                ) p lb
              )
            );
          | 2 ->
            field_token := (
              Some (
                (
                  read__string_nullable
                ) p lb
              )
            );
          | 3 ->
            field_searched_paths := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 4 ->
            field_renamed_paths := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 5 ->
            field_rule_ids := (
              Some (
                (
                  read__rule_id_list
                ) p lb
              )
            );
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_contributions := (
                Some (
                  (
                    read_contributions
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dependencies := (
                Some (
                  (
                    read_ci_scan_dependencies
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 's' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 's' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'h' && String.unsafe_get s (pos+12) = 's' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 't' && String.unsafe_get s (pos+12) = 'h' && String.unsafe_get s (pos+13) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_findings := (
                Some (
                  (
                    read__finding_list
                  ) p lb
                )
              );
            | 1 ->
              field_ignores := (
                Some (
                  (
                    read__finding_list
                  ) p lb
                )
              );
            | 2 ->
              field_token := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 3 ->
              field_searched_paths := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 4 ->
              field_renamed_paths := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 5 ->
              field_rule_ids := (
                Some (
                  (
                    read__rule_id_list
                  ) p lb
                )
              );
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_contributions := (
                  Some (
                    (
                      read_contributions
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dependencies := (
                  Some (
                    (
                      read_ci_scan_dependencies
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            findings = (match !field_findings with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "findings");
            ignores = (match !field_ignores with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ignores");
            token = (match !field_token with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "token");
            searched_paths = (match !field_searched_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "searched_paths");
            renamed_paths = (match !field_renamed_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "renamed_paths");
            rule_ids = (match !field_rule_ids with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_ids");
            contributions = !field_contributions;
            dependencies = !field_dependencies;
          }
         : ci_scan_results)
      )
)
let ci_scan_results_of_string s =
  read_ci_scan_results (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_a95369c = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write_parsing_stats
  )
)
let string_of__x_a95369c ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_a95369c ob x;
  Buffer.contents ob
let read__x_a95369c = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read_parsing_stats
  )
)
let _x_a95369c_of_string s =
  read__x_a95369c (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_852c7ec = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    Yojson.Safe.write_int
  )
)
let string_of__x_852c7ec ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_852c7ec ob x;
  Buffer.contents ob
let read__x_852c7ec = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    Atdgen_runtime.Oj_run.read_int
  )
)
let _x_852c7ec_of_string s =
  read__x_852c7ec (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ci_scan_complete_stats : _ -> ci_scan_complete_stats -> _ = (
  fun ob (x : ci_scan_complete_stats) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"findings\":";
    (
      Yojson.Safe.write_int
    )
      ob x.findings;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"errors\":";
    (
      write__cli_error_list
    )
      ob x.errors;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"total_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.total_time;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"unsupported_exts\":";
    (
      write__x_852c7ec
    )
      ob x.unsupported_exts;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"lockfile_scan_info\":";
    (
      write__x_852c7ec
    )
      ob x.lockfile_scan_info;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"parse_rate\":";
    (
      write__x_a95369c
    )
      ob x.parse_rate;
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"engine_requested\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_ci_scan_complete_stats ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ci_scan_complete_stats ob x;
  Buffer.contents ob
let read_ci_scan_complete_stats = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_findings = ref (None) in
    let field_errors = ref (None) in
    let field_total_time = ref (None) in
    let field_unsupported_exts = ref (None) in
    let field_lockfile_scan_info = ref (None) in
    let field_parse_rate = ref (None) in
    let field_engine_requested = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 6 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 16 -> (
                match String.unsafe_get s pos with
                  | 'e' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                        6
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'x' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 's' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 18 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'c' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'n' && String.unsafe_get s (pos+16) = 'f' && String.unsafe_get s (pos+17) = 'o' then (
                  4
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_findings := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_errors := (
              Some (
                (
                  read__cli_error_list
                ) p lb
              )
            );
          | 2 ->
            field_total_time := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_number
                ) p lb
              )
            );
          | 3 ->
            field_unsupported_exts := (
              Some (
                (
                  read__x_852c7ec
                ) p lb
              )
            );
          | 4 ->
            field_lockfile_scan_info := (
              Some (
                (
                  read__x_852c7ec
                ) p lb
              )
            );
          | 5 ->
            field_parse_rate := (
              Some (
                (
                  read__x_a95369c
                ) p lb
              )
            );
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_engine_requested := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'g' && String.unsafe_get s (pos+7) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'e' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'x' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'f' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'c' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = '_' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'n' && String.unsafe_get s (pos+16) = 'f' && String.unsafe_get s (pos+17) = 'o' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_findings := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_errors := (
                Some (
                  (
                    read__cli_error_list
                  ) p lb
                )
              );
            | 2 ->
              field_total_time := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            | 3 ->
              field_unsupported_exts := (
                Some (
                  (
                    read__x_852c7ec
                  ) p lb
                )
              );
            | 4 ->
              field_lockfile_scan_info := (
                Some (
                  (
                    read__x_852c7ec
                  ) p lb
                )
              );
            | 5 ->
              field_parse_rate := (
                Some (
                  (
                    read__x_a95369c
                  ) p lb
                )
              );
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_engine_requested := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            findings = (match !field_findings with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "findings");
            errors = (match !field_errors with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "errors");
            total_time = (match !field_total_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "total_time");
            unsupported_exts = (match !field_unsupported_exts with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "unsupported_exts");
            lockfile_scan_info = (match !field_lockfile_scan_info with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "lockfile_scan_info");
            parse_rate = (match !field_parse_rate with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parse_rate");
            engine_requested = !field_engine_requested;
          }
         : ci_scan_complete_stats)
      )
)
let ci_scan_complete_stats_of_string s =
  read_ci_scan_complete_stats (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__dependency_parser_error_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_dependency_parser_error
  )
)
let string_of__dependency_parser_error_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dependency_parser_error_list ob x;
  Buffer.contents ob
let read__dependency_parser_error_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_dependency_parser_error
  )
)
let _dependency_parser_error_list_of_string s =
  read__dependency_parser_error_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__dependency_parser_error_list_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__dependency_parser_error_list
  )
)
let string_of__dependency_parser_error_list_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dependency_parser_error_list_option ob x;
  Buffer.contents ob
let read__dependency_parser_error_list_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__dependency_parser_error_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__dependency_parser_error_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _dependency_parser_error_list_option_of_string s =
  read__dependency_parser_error_list_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ci_scan_complete_response : _ -> ci_scan_complete_response -> _ = (
  fun ob (x : ci_scan_complete_response) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"exit_code\":";
    (
      Yojson.Safe.write_int
    )
      ob x.exit_code;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"stats\":";
    (
      write_ci_scan_complete_stats
    )
      ob x.stats;
    (match x.dependencies with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dependencies\":";
      (
        write_ci_scan_dependencies
      )
        ob x;
    );
    (match x.dependency_parser_errors with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dependency_parser_errors\":";
      (
        write__dependency_parser_error_list
      )
        ob x;
    );
    (match x.task_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"task_id\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.final_attempt with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"final_attempt\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
let string_of_ci_scan_complete_response ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ci_scan_complete_response ob x;
  Buffer.contents ob
let read_ci_scan_complete_response = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_exit_code = ref (None) in
    let field_stats = ref (None) in
    let field_dependencies = ref (None) in
    let field_dependency_parser_errors = ref (None) in
    let field_task_id = ref (None) in
    let field_final_attempt = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                  4
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 't' then (
                  5
                )
                else (
                  -1
                )
              )
            | 24 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'r' && String.unsafe_get s (pos+14) = 's' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'r' && String.unsafe_get s (pos+17) = '_' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 'r' && String.unsafe_get s (pos+20) = 'r' && String.unsafe_get s (pos+21) = 'o' && String.unsafe_get s (pos+22) = 'r' && String.unsafe_get s (pos+23) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_exit_code := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_stats := (
              Some (
                (
                  read_ci_scan_complete_stats
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dependencies := (
                Some (
                  (
                    read_ci_scan_dependencies
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dependency_parser_errors := (
                Some (
                  (
                    read__dependency_parser_error_list
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_task_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_final_attempt := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 't' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 24 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'r' && String.unsafe_get s (pos+14) = 's' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = 'r' && String.unsafe_get s (pos+17) = '_' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 'r' && String.unsafe_get s (pos+20) = 'r' && String.unsafe_get s (pos+21) = 'o' && String.unsafe_get s (pos+22) = 'r' && String.unsafe_get s (pos+23) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_exit_code := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_stats := (
                Some (
                  (
                    read_ci_scan_complete_stats
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dependencies := (
                  Some (
                    (
                      read_ci_scan_dependencies
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dependency_parser_errors := (
                  Some (
                    (
                      read__dependency_parser_error_list
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_task_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_final_attempt := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            exit_code = (match !field_exit_code with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "exit_code");
            stats = (match !field_stats with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "stats");
            dependencies = !field_dependencies;
            dependency_parser_errors = !field_dependency_parser_errors;
            task_id = !field_task_id;
            final_attempt = !field_final_attempt;
          }
         : ci_scan_complete_response)
      )
)
let ci_scan_complete_response_of_string s =
  read_ci_scan_complete_response (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
