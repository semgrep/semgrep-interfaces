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
  engine_kind: engine_kind
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
    Excluded_by_config | Wrong_language | Too_big | Minified | Binary
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

type rule = Semgrep_output_v1_t.rule = {
  rule_id: rule_id;
  engine_kind: engine_kind
}
  [@@deriving show]

type raw_json = Yojson.Basic.t [@@deriving show]

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
  rules: rule list;
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
  reason: string
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
  rules: rule list option;
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
  engine_kind: engine_kind option
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
  rules: rule list option;
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

let write__1 = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_string
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
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
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_engine_kind = (
  fun ob x ->
    match x with
      | `OSS -> Bi_outbuf.add_string ob "\"OSS\""
      | `PRO -> Bi_outbuf.add_string ob "\"PRO\""
)
let string_of_engine_kind ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_engine_kind ob x;
  Bi_outbuf.contents ob
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
let write_matching_operation : _ -> matching_operation -> _ = (
  fun ob x ->
    match x with
      | And -> Bi_outbuf.add_string ob "\"And\""
      | Or -> Bi_outbuf.add_string ob "\"Or\""
      | Inside -> Bi_outbuf.add_string ob "\"Inside\""
      | XPat x ->
        Bi_outbuf.add_string ob "[\"XPat\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | Negation -> Bi_outbuf.add_string ob "\"Negation\""
      | Filter x ->
        Bi_outbuf.add_string ob "[\"Filter\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | Taint -> Bi_outbuf.add_string ob "\"Taint\""
      | TaintSource -> Bi_outbuf.add_string ob "\"TaintSource\""
      | TaintSink -> Bi_outbuf.add_string ob "\"TaintSink\""
      | TaintSanitizer -> Bi_outbuf.add_string ob "\"TaintSanitizer\""
      | EllipsisAndStmts -> Bi_outbuf.add_string ob "\"EllipsisAndStmts\""
      | ClassHeaderAndElems -> Bi_outbuf.add_string ob "\"ClassHeaderAndElems\""
)
let string_of_matching_operation ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_matching_operation ob x;
  Bi_outbuf.contents ob
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
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"col\":";
    (
      Yojson.Safe.write_int
    )
      ob x.col;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"offset\":";
    (
      Yojson.Safe.write_int
    )
      ob x.offset;
    Bi_outbuf.add_char ob '}';
)
let string_of_position ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_position ob x;
  Bi_outbuf.contents ob
let read_position = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_line = ref (None) in
    let field_col = ref (None) in
    let field_offset = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
            field_offset := (
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
              invalid_arg "out-of-bounds substring position or length";
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
              field_offset := (
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
            line = (match !field_line with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "line");
            col = (match !field_col with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "col");
            offset = (match !field_offset with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "offset");
          }
         : position)
      )
)
let position_of_string s =
  read_position (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__8 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_position
  )
)
let string_of__8 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__8 ob x;
  Bi_outbuf.contents ob
let read__8 = (
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
let _8_of_string s =
  read__8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_location : _ -> location -> _ = (
  fun ob (x : location) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    Bi_outbuf.add_char ob '}';
)
let string_of_location ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_location ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
                  Atdgen_runtime.Oj_run.read_string
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
              invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
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
let write_cli_match_intermediate_var : _ -> cli_match_intermediate_var -> _ = (
  fun ob (x : cli_match_intermediate_var) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.content;
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_match_intermediate_var ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match_intermediate_var ob x;
  Bi_outbuf.contents ob
let read_cli_match_intermediate_var = (
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
         : cli_match_intermediate_var)
      )
)
let cli_match_intermediate_var_of_string s =
  read_cli_match_intermediate_var (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__33 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_match_intermediate_var
  )
)
let string_of__33 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__33 ob x;
  Bi_outbuf.contents ob
let read__33 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_match_intermediate_var
  )
)
let _33_of_string s =
  read__33 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match_intermediate_var : _ -> core_match_intermediate_var -> _ = (
  fun ob (x : core_match_intermediate_var) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_match_intermediate_var ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match_intermediate_var ob x;
  Bi_outbuf.contents ob
let read_core_match_intermediate_var = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_location = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 8 && String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
            0
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
            field_location := (
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
              invalid_arg "out-of-bounds substring position or length";
            if len = 8 && String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
              0
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
              field_location := (
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
            location = (match !field_location with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "location");
          }
         : core_match_intermediate_var)
      )
)
let core_match_intermediate_var_of_string s =
  read_core_match_intermediate_var (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__3 = (
  Atdgen_runtime.Oj_run.write_list (
    write_core_match_intermediate_var
  )
)
let string_of__3 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__3 ob x;
  Bi_outbuf.contents ob
let read__3 = (
  Atdgen_runtime.Oj_run.read_list (
    read_core_match_intermediate_var
  )
)
let _3_of_string s =
  read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__5 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__3
  )
)
let string_of__5 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__5 ob x;
  Bi_outbuf.contents ob
let read__5 = (
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
                  read__3
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
                  read__3
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _5_of_string s =
  read__5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_rule_id = (
  Yojson.Safe.write_string
)
let string_of_rule_id ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_rule_id ob x;
  Bi_outbuf.contents ob
let read_rule_id = (
  Atdgen_runtime.Oj_run.read_string
)
let rule_id_of_string s =
  read_rule_id (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_svalue_value : _ -> svalue_value -> _ = (
  fun ob (x : svalue_value) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.svalue_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"svalue_start\":";
      (
        write_position
      )
        ob x;
    );
    (match x.svalue_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"svalue_end\":";
      (
        write_position
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"svalue_abstract_content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.svalue_abstract_content;
    Bi_outbuf.add_char ob '}';
)
let string_of_svalue_value ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_svalue_value ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write__7 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_svalue_value
  )
)
let string_of__7 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__7 ob x;
  Bi_outbuf.contents ob
let read__7 = (
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
let _7_of_string s =
  read__7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_metavar_value : _ -> metavar_value -> _ = (
  fun ob (x : metavar_value) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"abstract_content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.abstract_content;
    (match x.propagated_value with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"propagated_value\":";
      (
        write_svalue_value
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_metavar_value ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_metavar_value ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write__6 = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write_metavar_value
  )
)
let string_of__6 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__6 ob x;
  Bi_outbuf.contents ob
let read__6 = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read_metavar_value
  )
)
let _6_of_string s =
  read__6 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_metavars = (
  write__6
)
let string_of_metavars ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_metavars ob x;
  Bi_outbuf.contents ob
let read_metavars = (
  read__6
)
let metavars_of_string s =
  read_metavars (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write_cli_match_call_trace : _ -> cli_match_call_trace -> _ = (
  fun ob x ->
    match x with
      | CliLoc x ->
        Bi_outbuf.add_string ob "[\"CliLoc\",";
        (
          fun ob x ->
            Bi_outbuf.add_char ob '[';
            (let x, _ = x in
            (
              write_location
            ) ob x
            );
            Bi_outbuf.add_char ob ',';
            (let _, x = x in
            (
              Yojson.Safe.write_string
            ) ob x
            );
            Bi_outbuf.add_char ob ']';
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | CliCall x ->
        Bi_outbuf.add_string ob "[\"CliCall\",";
        (
          fun ob x ->
            Bi_outbuf.add_char ob '[';
            (let x, _, _ = x in
            (
              fun ob x ->
                Bi_outbuf.add_char ob '[';
                (let x, _ = x in
                (
                  write_location
                ) ob x
                );
                Bi_outbuf.add_char ob ',';
                (let _, x = x in
                (
                  Yojson.Safe.write_string
                ) ob x
                );
                Bi_outbuf.add_char ob ']';
            ) ob x
            );
            Bi_outbuf.add_char ob ',';
            (let _, x, _ = x in
            (
              write__33
            ) ob x
            );
            Bi_outbuf.add_char ob ',';
            (let _, _, x = x in
            (
              write_cli_match_call_trace
            ) ob x
            );
            Bi_outbuf.add_char ob ']';
        ) ob x;
        Bi_outbuf.add_char ob ']'
)
and string_of_cli_match_call_trace ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match_call_trace ob x;
  Bi_outbuf.contents ob
let rec read_cli_match_call_trace = (
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
              (CliLoc x : cli_match_call_trace)
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
                            read__33
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
                            read_cli_match_call_trace
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
              (CliCall x : cli_match_call_trace)
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
              (CliLoc x : cli_match_call_trace)
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
                            read__33
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
                            read_cli_match_call_trace
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
              (CliCall x : cli_match_call_trace)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and cli_match_call_trace_of_string s =
  read_cli_match_call_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write_core_match_call_trace : _ -> core_match_call_trace -> _ = (
  fun ob x ->
    match x with
      | CoreLoc x ->
        Bi_outbuf.add_string ob "[\"CoreLoc\",";
        (
          write_location
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | CoreCall x ->
        Bi_outbuf.add_string ob "[\"CoreCall\",";
        (
          fun ob x ->
            Bi_outbuf.add_char ob '[';
            (let x, _, _ = x in
            (
              write_location
            ) ob x
            );
            Bi_outbuf.add_char ob ',';
            (let _, x, _ = x in
            (
              write__3
            ) ob x
            );
            Bi_outbuf.add_char ob ',';
            (let _, _, x = x in
            (
              write_core_match_call_trace
            ) ob x
            );
            Bi_outbuf.add_char ob ']';
        ) ob x;
        Bi_outbuf.add_char ob ']'
)
and string_of_core_match_call_trace ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match_call_trace ob x;
  Bi_outbuf.contents ob
let rec read_core_match_call_trace = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CoreLoc" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_location
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (CoreLoc x : core_match_call_trace)
            | "CoreCall" ->
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
                            read__3
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
                            read_core_match_call_trace
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
              (CoreCall x : core_match_call_trace)
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
            | "CoreLoc" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_location
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (CoreLoc x : core_match_call_trace)
            | "CoreCall" ->
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
                            read__3
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
                            read_core_match_call_trace
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
              (CoreCall x : core_match_call_trace)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and core_match_call_trace_of_string s =
  read_core_match_call_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__4 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_core_match_call_trace
  )
)
let string_of__4 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__4 ob x;
  Bi_outbuf.contents ob
let read__4 = (
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
                  read_core_match_call_trace
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
                  read_core_match_call_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _4_of_string s =
  read__4 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match_dataflow_trace : _ -> core_match_dataflow_trace -> _ = (
  fun ob (x : core_match_dataflow_trace) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.taint_source with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"taint_source\":";
      (
        write_core_match_call_trace
      )
        ob x;
    );
    (match x.intermediate_vars with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"intermediate_vars\":";
      (
        write__3
      )
        ob x;
    );
    (match x.taint_sink with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"taint_sink\":";
      (
        write_core_match_call_trace
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_core_match_dataflow_trace ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match_dataflow_trace ob x;
  Bi_outbuf.contents ob
let read_core_match_dataflow_trace = (
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
            invalid_arg "out-of-bounds substring position or length";
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
                    read_core_match_call_trace
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_intermediate_vars := (
                Some (
                  (
                    read__3
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_taint_sink := (
                Some (
                  (
                    read_core_match_call_trace
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
              invalid_arg "out-of-bounds substring position or length";
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
                      read_core_match_call_trace
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_intermediate_vars := (
                  Some (
                    (
                      read__3
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_taint_sink := (
                  Some (
                    (
                      read_core_match_call_trace
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
         : core_match_dataflow_trace)
      )
)
let core_match_dataflow_trace_of_string s =
  read_core_match_dataflow_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__2 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_core_match_dataflow_trace
  )
)
let string_of__2 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__2 ob x;
  Bi_outbuf.contents ob
let read__2 = (
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
                  read_core_match_dataflow_trace
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
                  read_core_match_dataflow_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _2_of_string s =
  read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match_extra : _ -> core_match_extra -> _ = (
  fun ob (x : core_match_extra) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.message with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"message\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"metavars\":";
    (
      write_metavars
    )
      ob x.metavars;
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"dataflow_trace\":";
      (
        write_core_match_dataflow_trace
      )
        ob x;
    );
    (match x.rendered_fix with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rendered_fix\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"engine_kind\":";
    (
      write_engine_kind
    )
      ob x.engine_kind;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_match_extra ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match_extra ob x;
  Bi_outbuf.contents ob
let read_core_match_extra = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_message = ref (None) in
    let field_metavars = ref (None) in
    let field_dataflow_trace = ref (None) in
    let field_rendered_fix = ref (None) in
    let field_engine_kind = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                  4
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
                    read_core_match_dataflow_trace
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
              invalid_arg "out-of-bounds substring position or length";
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
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                    4
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
                      read_core_match_dataflow_trace
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
          }
         : core_match_extra)
      )
)
let core_match_extra_of_string s =
  read_core_match_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match : _ -> core_match -> _ = (
  fun ob (x : core_match) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"extra\":";
    (
      write_core_match_extra
    )
      ob x.extra;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_match ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match ob x;
  Bi_outbuf.contents ob
let read_core_match = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_location = ref (None) in
    let field_extra = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                  2
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
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
            field_location := (
              Some (
                (
                  read_location
                ) p lb
              )
            );
          | 2 ->
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
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
              field_location := (
                Some (
                  (
                    read_location
                  ) p lb
                )
              );
            | 2 ->
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
            rule_id = (match !field_rule_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_id");
            location = (match !field_location with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "location");
            extra = (match !field_extra with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "extra");
          }
         : core_match)
      )
)
let core_match_of_string s =
  read_core_match (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__17 = (
  Atdgen_runtime.Oj_run.write_list (
    write_core_match
  )
)
let string_of__17 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__17 ob x;
  Bi_outbuf.contents ob
let read__17 = (
  Atdgen_runtime.Oj_run.read_list (
    read_core_match
  )
)
let _17_of_string s =
  read__17 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write__16 ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_matching_explanation
  )
) ob x
and string_of__16 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__16 ob x;
  Bi_outbuf.contents ob
and write_matching_explanation : _ -> matching_explanation -> _ = (
  fun ob (x : matching_explanation) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"op\":";
    (
      write_matching_operation
    )
      ob x.op;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"children\":";
    (
      write__16
    )
      ob x.children;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"matches\":";
    (
      write__17
    )
      ob x.matches;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"loc\":";
    (
      write_location
    )
      ob x.loc;
    Bi_outbuf.add_char ob '}';
)
and string_of_matching_explanation ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_matching_explanation ob x;
  Bi_outbuf.contents ob
let rec read__16 p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_matching_explanation
  )
) p lb
and _16_of_string s =
  read__16 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
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
            invalid_arg "out-of-bounds substring position or length";
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
                  read__16
                ) p lb
              )
            );
          | 2 ->
            field_matches := (
              Some (
                (
                  read__17
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
              invalid_arg "out-of-bounds substring position or length";
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
                    read__16
                  ) p lb
                )
              );
            | 2 ->
              field_matches := (
                Some (
                  (
                    read__17
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
  let ob = Bi_outbuf.create len in
  write_version ob x;
  Bi_outbuf.contents ob
let read_version = (
  Atdgen_runtime.Oj_run.read_string
)
let version_of_string s =
  read_version (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_transitivity = (
  fun ob x ->
    match x with
      | `Direct -> Bi_outbuf.add_string ob "\"direct\""
      | `Transitive -> Bi_outbuf.add_string ob "\"transitive\""
      | `Unknown -> Bi_outbuf.add_string ob "\"unknown\""
)
let string_of_transitivity ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_transitivity ob x;
  Bi_outbuf.contents ob
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
let write_rule_times : _ -> rule_times -> _ = (
  fun ob (x : rule_times) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"parse_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.parse_time;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"match_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.match_time;
    Bi_outbuf.add_char ob '}';
)
let string_of_rule_times ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_rule_times ob x;
  Bi_outbuf.contents ob
let read_rule_times = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_parse_time = ref (None) in
    let field_match_time = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
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
            field_rule_id := (
              Some (
                (
                  read_rule_id
                ) p lb
              )
            );
          | 1 ->
            field_parse_time := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_number
                ) p lb
              )
            );
          | 2 ->
            field_match_time := (
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'e' then (
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
              field_rule_id := (
                Some (
                  (
                    read_rule_id
                  ) p lb
                )
              );
            | 1 ->
              field_parse_time := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            | 2 ->
              field_match_time := (
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
            rule_id = (match !field_rule_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_id");
            parse_time = (match !field_parse_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parse_time");
            match_time = (match !field_match_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "match_time");
          }
         : rule_times)
      )
)
let rule_times_of_string s =
  read_rule_times (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__15 = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule_times
  )
)
let string_of__15 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__15 ob x;
  Bi_outbuf.contents ob
let read__15 = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule_times
  )
)
let _15_of_string s =
  read__15 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_target_time : _ -> target_time -> _ = (
  fun ob (x : target_time) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_times\":";
    (
      write__15
    )
      ob x.rule_times;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"run_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.run_time;
    Bi_outbuf.add_char ob '}';
)
let string_of_target_time ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_target_time ob x;
  Bi_outbuf.contents ob
let read_target_time = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_rule_times = ref (None) in
    let field_run_time = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                  2
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
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
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_rule_times := (
              Some (
                (
                  read__15
                ) p lb
              )
            );
          | 2 ->
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
              invalid_arg "out-of-bounds substring position or length";
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
                    2
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
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
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_rule_times := (
                Some (
                  (
                    read__15
                  ) p lb
                )
              );
            | 2 ->
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
            rule_times = (match !field_rule_times with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_times");
            run_time = (match !field_run_time with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "run_time");
          }
         : target_time)
      )
)
let target_time_of_string s =
  read_target_time (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skip_reason : _ -> skip_reason -> _ = (
  fun ob x ->
    match x with
      | Excluded_by_config -> Bi_outbuf.add_string ob "\"excluded_by_config\""
      | Wrong_language -> Bi_outbuf.add_string ob "\"wrong_language\""
      | Too_big -> Bi_outbuf.add_string ob "\"too_big\""
      | Minified -> Bi_outbuf.add_string ob "\"minified\""
      | Binary -> Bi_outbuf.add_string ob "\"binary\""
      | Irrelevant_rule -> Bi_outbuf.add_string ob "\"irrelevant_rule\""
      | Too_many_matches -> Bi_outbuf.add_string ob "\"too_many_matches\""
)
let string_of_skip_reason ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_skip_reason ob x;
  Bi_outbuf.contents ob
let read_skip_reason = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
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
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
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
let write__9 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_rule_id
  )
)
let string_of__9 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__9 ob x;
  Bi_outbuf.contents ob
let read__9 = (
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
let _9_of_string s =
  read__9 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skipped_target : _ -> skipped_target -> _ = (
  fun ob (x : skipped_target) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"reason\":";
    (
      write_skip_reason
    )
      ob x.reason;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"details\":";
    (
      Yojson.Safe.write_string
    )
      ob x.details;
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_skipped_target ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_skipped_target ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
                  Atdgen_runtime.Oj_run.read_string
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
            field_details := (
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
              invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
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
              field_details := (
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
            details = (match !field_details with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "details");
            rule_id = !field_rule_id;
          }
         : skipped_target)
      )
)
let skipped_target_of_string s =
  read_skipped_target (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_skipped_rule : _ -> skipped_rule -> _ = (
  fun ob (x : skipped_rule) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"details\":";
    (
      Yojson.Safe.write_string
    )
      ob x.details;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"position\":";
    (
      write_position
    )
      ob x.position;
    Bi_outbuf.add_char ob '}';
)
let string_of_skipped_rule ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_skipped_rule ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write_ecosystem = (
  fun ob x ->
    match x with
      | `Npm -> Bi_outbuf.add_string ob "\"npm\""
      | `Pypi -> Bi_outbuf.add_string ob "\"pypi\""
      | `Gem -> Bi_outbuf.add_string ob "\"gem\""
      | `Gomod -> Bi_outbuf.add_string ob "\"gomod\""
      | `Cargo -> Bi_outbuf.add_string ob "\"cargo\""
      | `Maven -> Bi_outbuf.add_string ob "\"maven\""
)
let string_of_ecosystem ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_ecosystem ob x;
  Bi_outbuf.contents ob
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
let write__10 = (
  Atdgen_runtime.Oj_run.write_list (
    Yojson.Safe.write_string
  )
)
let string_of__10 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__10 ob x;
  Bi_outbuf.contents ob
let read__10 = (
  Atdgen_runtime.Oj_run.read_list (
    Atdgen_runtime.Oj_run.read_string
  )
)
let _10_of_string s =
  read__10 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__55 = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    write__10
  )
)
let string_of__55 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__55 ob x;
  Bi_outbuf.contents ob
let read__55 = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    read__10
  )
)
let _55_of_string s =
  read__55 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__43 = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_int
  )
)
let string_of__43 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__43 ob x;
  Bi_outbuf.contents ob
let read__43 = (
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
let _43_of_string s =
  read__43 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_found_dependency : _ -> found_dependency -> _ = (
  fun ob (x : found_dependency) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"package\":";
    (
      Yojson.Safe.write_string
    )
      ob x.package;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.version;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"ecosystem\":";
    (
      write_ecosystem
    )
      ob x.ecosystem;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"allowed_hashes\":";
    (
      write__55
    )
      ob x.allowed_hashes;
    (match x.resolved_url with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"resolved_url\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"transitivity\":";
    (
      write_transitivity
    )
      ob x.transitivity;
    (match x.line_number with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"line_number\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_found_dependency ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_found_dependency ob x;
  Bi_outbuf.contents ob
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
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                  read__55
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
              invalid_arg "out-of-bounds substring position or length";
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
                    read__55
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
          }
         : found_dependency)
      )
)
let found_dependency_of_string s =
  read_found_dependency (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dependency_pattern : _ -> dependency_pattern -> _ = (
  fun ob (x : dependency_pattern) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"ecosystem\":";
    (
      write_ecosystem
    )
      ob x.ecosystem;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"package\":";
    (
      Yojson.Safe.write_string
    )
      ob x.package;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"semver_range\":";
    (
      Yojson.Safe.write_string
    )
      ob x.semver_range;
    Bi_outbuf.add_char ob '}';
)
let string_of_dependency_pattern ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_dependency_pattern ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"dependency_pattern\":";
    (
      write_dependency_pattern
    )
      ob x.dependency_pattern;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"found_dependency\":";
    (
      write_found_dependency
    )
      ob x.found_dependency;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"lockfile\":";
    (
      Yojson.Safe.write_string
    )
      ob x.lockfile;
    Bi_outbuf.add_char ob '}';
)
let string_of_dependency_match ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_dependency_match ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"reachable\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.reachable;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"reachability_rule\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.reachability_rule;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"sca_finding_schema\":";
    (
      Yojson.Safe.write_int
    )
      ob x.sca_finding_schema;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"dependency_match\":";
    (
      write_dependency_match
    )
      ob x.dependency_match;
    Bi_outbuf.add_char ob '}';
)
let string_of_sca_info ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_sca_info ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write_rule_id_dict : _ -> rule_id_dict -> _ = (
  fun ob (x : rule_id_dict) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_rule_id
    )
      ob x.id;
    Bi_outbuf.add_char ob '}';
)
let string_of_rule_id_dict ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_rule_id_dict ob x;
  Bi_outbuf.contents ob
let read_rule_id_dict = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 2 && String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
            0
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
            field_id := (
              Some (
                (
                  read_rule_id
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
              invalid_arg "out-of-bounds substring position or length";
            if len = 2 && String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
              0
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
              field_id := (
                Some (
                  (
                    read_rule_id
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
            id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
          }
         : rule_id_dict)
      )
)
let rule_id_dict_of_string s =
  read_rule_id_dict (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_rule : _ -> rule -> _ = (
  fun ob (x : rule) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_id\":";
    (
      write_rule_id
    )
      ob x.rule_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"engine_kind\":";
    (
      write_engine_kind
    )
      ob x.engine_kind;
    Bi_outbuf.add_char ob '}';
)
let string_of_rule ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_rule ob x;
  Bi_outbuf.contents ob
let read_rule = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_rule_id = ref (None) in
    let field_engine_kind = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
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
            field_engine_kind := (
              Some (
                (
                  read_engine_kind
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
              invalid_arg "out-of-bounds substring position or length";
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
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
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
              field_engine_kind := (
                Some (
                  (
                    read_engine_kind
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
            engine_kind = (match !field_engine_kind with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "engine_kind");
          }
         : rule)
      )
)
let rule_of_string s =
  read_rule (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_raw_json = (
  Yojson.Basic.write_t
)
let string_of_raw_json ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_raw_json ob x;
  Bi_outbuf.contents ob
let read_raw_json = (
  Yojson.Basic.read_t
)
let raw_json_of_string s =
  read_raw_json (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_position_bis : _ -> position_bis -> _ = (
  fun ob (x : position_bis) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"col\":";
    (
      Yojson.Safe.write_int
    )
      ob x.col;
    Bi_outbuf.add_char ob '}';
)
let string_of_position_bis ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_position_bis ob x;
  Bi_outbuf.contents ob
let read_position_bis = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_line = ref (None) in
    let field_col = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
          }
         : position_bis)
      )
)
let position_bis_of_string s =
  read_position_bis (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_fix_regex : _ -> fix_regex -> _ = (
  fun ob (x : fix_regex) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"regex\":";
    (
      Yojson.Safe.write_string
    )
      ob x.regex;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"replacement\":";
    (
      Yojson.Safe.write_string
    )
      ob x.replacement;
    (match x.count with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"count\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_fix_regex ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_fix_regex ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write__35 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__33
  )
)
let string_of__35 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__35 ob x;
  Bi_outbuf.contents ob
let read__35 = (
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
                  read__33
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
                  read__33
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _35_of_string s =
  read__35 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__34 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_cli_match_call_trace
  )
)
let string_of__34 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__34 ob x;
  Bi_outbuf.contents ob
let read__34 = (
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
                  read_cli_match_call_trace
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
                  read_cli_match_call_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _34_of_string s =
  read__34 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match_dataflow_trace : _ -> cli_match_dataflow_trace -> _ = (
  fun ob (x : cli_match_dataflow_trace) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.taint_source with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"taint_source\":";
      (
        write_cli_match_call_trace
      )
        ob x;
    );
    (match x.intermediate_vars with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"intermediate_vars\":";
      (
        write__33
      )
        ob x;
    );
    (match x.taint_sink with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"taint_sink\":";
      (
        write_cli_match_call_trace
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_match_dataflow_trace ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match_dataflow_trace ob x;
  Bi_outbuf.contents ob
let read_cli_match_dataflow_trace = (
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
            invalid_arg "out-of-bounds substring position or length";
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
                    read_cli_match_call_trace
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_intermediate_vars := (
                Some (
                  (
                    read__33
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_taint_sink := (
                Some (
                  (
                    read_cli_match_call_trace
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
              invalid_arg "out-of-bounds substring position or length";
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
                      read_cli_match_call_trace
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_intermediate_vars := (
                  Some (
                    (
                      read__33
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_taint_sink := (
                  Some (
                    (
                      read_cli_match_call_trace
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
         : cli_match_dataflow_trace)
      )
)
let cli_match_dataflow_trace_of_string s =
  read_cli_match_dataflow_trace (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__41 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_cli_match_dataflow_trace
  )
)
let string_of__41 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__41 ob x;
  Bi_outbuf.contents ob
let read__41 = (
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
                  read_cli_match_dataflow_trace
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
                  read_cli_match_dataflow_trace
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _41_of_string s =
  read__41 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__40 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__10
  )
)
let string_of__40 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__40 ob x;
  Bi_outbuf.contents ob
let read__40 = (
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
                  read__10
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
                  read__10
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _40_of_string s =
  read__40 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__39 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_sca_info
  )
)
let string_of__39 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__39 ob x;
  Bi_outbuf.contents ob
let read__39 = (
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
let _39_of_string s =
  read__39 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_finding : _ -> finding -> _ = (
  fun ob (x : finding) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"check_id\":";
    (
      write_rule_id
    )
      ob x.check_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"column\":";
    (
      Yojson.Safe.write_int
    )
      ob x.column;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end_line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.end_line;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end_column\":";
    (
      Yojson.Safe.write_int
    )
      ob x.end_column;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"severity\":";
    (
      Yojson.Safe.write_int
    )
      ob x.severity;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"index\":";
    (
      Yojson.Safe.write_int
    )
      ob x.index;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"commit_date\":";
    (
      Yojson.Safe.write_string
    )
      ob x.commit_date;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"syntactic_id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.syntactic_id;
    (match x.match_based_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"match_based_id\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"metadata\":";
    (
      write_raw_json
    )
      ob x.metadata;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"is_blocking\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.is_blocking;
    (match x.fixed_lines with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"fixed_lines\":";
      (
        write__10
      )
        ob x;
    );
    (match x.sca_info with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"sca_info\":";
      (
        write_sca_info
      )
        ob x;
    );
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"dataflow_trace\":";
      (
        write_cli_match_dataflow_trace
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_finding ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_finding ob x;
  Bi_outbuf.contents ob
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
    let field_metadata = ref (None) in
    let field_is_blocking = ref (None) in
    let field_fixed_lines = ref (None) in
    let field_sca_info = ref (None) in
    let field_dataflow_trace = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                  3
                )
                else (
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
                        12
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'c' -> (
                            if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                              15
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
                        14
                      )
                      else (
                        -1
                      )
                    )
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' then (
                        13
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
                        16
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
                  Atdgen_runtime.Oj_run.read_string
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
                  Atdgen_runtime.Oj_run.read_int
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
            field_metadata := (
              Some (
                (
                  read_raw_json
                ) p lb
              )
            );
          | 13 ->
            field_is_blocking := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 14 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_fixed_lines := (
                Some (
                  (
                    read__10
                  ) p lb
                )
              );
            )
          | 15 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_sca_info := (
                Some (
                  (
                    read_sca_info
                  ) p lb
                )
              );
            )
          | 16 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dataflow_trace := (
                Some (
                  (
                    read_cli_match_dataflow_trace
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
              invalid_arg "out-of-bounds substring position or length";
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
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                    3
                  )
                  else (
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
                          12
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'c' -> (
                              if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'o' then (
                                15
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
                          14
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'g' then (
                          13
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
                          16
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
                    Atdgen_runtime.Oj_run.read_string
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
                    Atdgen_runtime.Oj_run.read_int
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
              field_metadata := (
                Some (
                  (
                    read_raw_json
                  ) p lb
                )
              );
            | 13 ->
              field_is_blocking := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 14 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_fixed_lines := (
                  Some (
                    (
                      read__10
                    ) p lb
                  )
                );
              )
            | 15 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_sca_info := (
                  Some (
                    (
                      read_sca_info
                    ) p lb
                  )
                );
              )
            | 16 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dataflow_trace := (
                  Some (
                    (
                      read_cli_match_dataflow_trace
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
            metadata = (match !field_metadata with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "metadata");
            is_blocking = (match !field_is_blocking with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "is_blocking");
            fixed_lines = !field_fixed_lines;
            sca_info = !field_sca_info;
            dataflow_trace = !field_dataflow_trace;
          }
         : finding)
      )
)
let finding_of_string s =
  read_finding (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__31 = (
  Atdgen_runtime.Oj_run.write_nullable (
    write__10
  )
)
let string_of__31 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__31 ob x;
  Bi_outbuf.contents ob
let read__31 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read__10
    ) p lb) : _ option)
)
let _31_of_string s =
  read__31 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__32 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__31
  )
)
let string_of__32 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__32 ob x;
  Bi_outbuf.contents ob
let read__32 = (
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
                  read__31
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
                  read__31
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _32_of_string s =
  read__32 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__29 = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_position_bis
  )
)
let string_of__29 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__29 ob x;
  Bi_outbuf.contents ob
let read__29 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_position_bis
    ) p lb) : _ option)
)
let _29_of_string s =
  read__29 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__30 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__29
  )
)
let string_of__30 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__30 ob x;
  Bi_outbuf.contents ob
let read__30 = (
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
                  read__29
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
                  read__29
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _30_of_string s =
  read__30 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_error_span : _ -> error_span -> _ = (
  fun ob (x : error_span) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"file\":";
    (
      Yojson.Safe.write_string
    )
      ob x.file;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"start\":";
    (
      write_position_bis
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end\":";
    (
      write_position_bis
    )
      ob x.end_;
    (match x.source_hash with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"source_hash\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.config_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"config_start\":";
      (
        write__29
      )
        ob x;
    );
    (match x.config_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"config_end\":";
      (
        write__29
      )
        ob x;
    );
    (match x.config_path with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"config_path\":";
      (
        write__31
      )
        ob x;
    );
    (match x.context_start with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"context_start\":";
      (
        write__29
      )
        ob x;
    );
    (match x.context_end with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"context_end\":";
      (
        write__29
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_error_span ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_error_span ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_start := (
              Some (
                (
                  read_position_bis
                ) p lb
              )
            );
          | 2 ->
            field_end_ := (
              Some (
                (
                  read_position_bis
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
                    read__29
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_config_end := (
                Some (
                  (
                    read__29
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_config_path := (
                Some (
                  (
                    read__31
                  ) p lb
                )
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_context_start := (
                Some (
                  (
                    read__29
                  ) p lb
                )
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_context_end := (
                Some (
                  (
                    read__29
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
              invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_start := (
                Some (
                  (
                    read_position_bis
                  ) p lb
                )
              );
            | 2 ->
              field_end_ := (
                Some (
                  (
                    read_position_bis
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
                      read__29
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_config_end := (
                  Some (
                    (
                      read__29
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_config_path := (
                  Some (
                    (
                      read__31
                    ) p lb
                  )
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_context_start := (
                  Some (
                    (
                      read__29
                    ) p lb
                  )
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_context_end := (
                  Some (
                    (
                      read__29
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
let write_cve_result : _ -> cve_result -> _ = (
  fun ob (x : cve_result) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"url\":";
    (
      Yojson.Safe.write_string
    )
      ob x.url;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"filename\":";
    (
      Yojson.Safe.write_string
    )
      ob x.filename;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"funcnames\":";
    (
      write__10
    )
      ob x.funcnames;
    Bi_outbuf.add_char ob '}';
)
let string_of_cve_result ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cve_result ob x;
  Bi_outbuf.contents ob
let read_cve_result = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_url = ref (None) in
    let field_filename = ref (None) in
    let field_funcnames = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'l' then (
                  0
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
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
            field_url := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_filename := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_funcnames := (
              Some (
                (
                  read__10
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'l' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
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
              field_url := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_filename := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_funcnames := (
                Some (
                  (
                    read__10
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
            url = (match !field_url with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "url");
            filename = (match !field_filename with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "filename");
            funcnames = (match !field_funcnames with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "funcnames");
          }
         : cve_result)
      )
)
let cve_result_of_string s =
  read_cve_result (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__18 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cve_result
  )
)
let string_of__18 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__18 ob x;
  Bi_outbuf.contents ob
let read__18 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cve_result
  )
)
let _18_of_string s =
  read__18 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cve_results = (
  write__18
)
let string_of_cve_results ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cve_results ob x;
  Bi_outbuf.contents ob
let read_cve_results = (
  read__18
)
let cve_results_of_string s =
  read_cve_results (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__14 = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_std_float
  )
)
let string_of__14 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__14 ob x;
  Bi_outbuf.contents ob
let read__14 = (
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
                  Atdgen_runtime.Oj_run.read_number
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
                  Atdgen_runtime.Oj_run.read_number
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _14_of_string s =
  read__14 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__13 = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule_id
  )
)
let string_of__13 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__13 ob x;
  Bi_outbuf.contents ob
let read__13 = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule_id
  )
)
let _13_of_string s =
  read__13 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__12 = (
  Atdgen_runtime.Oj_run.write_list (
    write_target_time
  )
)
let string_of__12 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__12 ob x;
  Bi_outbuf.contents ob
let read__12 = (
  Atdgen_runtime.Oj_run.read_list (
    read_target_time
  )
)
let _12_of_string s =
  read__12 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_timing : _ -> core_timing -> _ = (
  fun ob (x : core_timing) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"targets\":";
    (
      write__12
    )
      ob x.targets;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rules\":";
    (
      write__13
    )
      ob x.rules;
    (match x.rules_parse_time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rules_parse_time\":";
      (
        Yojson.Safe.write_std_float
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"max_memory_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.max_memory_bytes;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_timing ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_timing ob x;
  Bi_outbuf.contents ob
let read_core_timing = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_targets = ref (None) in
    let field_rules = ref (None) in
    let field_rules_parse_time = ref (None) in
    let field_max_memory_bytes = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | 16 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'b' && String.unsafe_get s (pos+12) = 'y' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'e' then (
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
            field_targets := (
              Some (
                (
                  read__12
                ) p lb
              )
            );
          | 1 ->
            field_rules := (
              Some (
                (
                  read__13
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules_parse_time := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            )
          | 3 ->
            field_max_memory_bytes := (
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = '_' && String.unsafe_get s (pos+11) = 'b' && String.unsafe_get s (pos+12) = 'y' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 't' && String.unsafe_get s (pos+13) = 'i' && String.unsafe_get s (pos+14) = 'm' && String.unsafe_get s (pos+15) = 'e' then (
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
              field_targets := (
                Some (
                  (
                    read__12
                  ) p lb
                )
              );
            | 1 ->
              field_rules := (
                Some (
                  (
                    read__13
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules_parse_time := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_number
                    ) p lb
                  )
                );
              )
            | 3 ->
              field_max_memory_bytes := (
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
            targets = (match !field_targets with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "targets");
            rules = (match !field_rules with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rules");
            rules_parse_time = !field_rules_parse_time;
            max_memory_bytes = (match !field_max_memory_bytes with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "max_memory_bytes");
          }
         : core_timing)
      )
)
let core_timing_of_string s =
  read_core_timing (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_stats : _ -> core_stats -> _ = (
  fun ob (x : core_stats) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"okfiles\":";
    (
      Yojson.Safe.write_int
    )
      ob x.okfiles;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"errorfiles\":";
    (
      Yojson.Safe.write_int
    )
      ob x.errorfiles;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_stats ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_stats ob x;
  Bi_outbuf.contents ob
let read_core_stats = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_okfiles = ref (None) in
    let field_errorfiles = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
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
            field_okfiles := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 1 ->
            field_errorfiles := (
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
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
              field_okfiles := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_errorfiles := (
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
            okfiles = (match !field_okfiles with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "okfiles");
            errorfiles = (match !field_errorfiles with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "errorfiles");
          }
         : core_stats)
      )
)
let core_stats_of_string s =
  read_core_stats (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_severity : _ -> core_severity -> _ = (
  fun ob x ->
    match x with
      | Error -> Bi_outbuf.add_string ob "\"error\""
      | Warning -> Bi_outbuf.add_string ob "\"warning\""
)
let string_of_core_severity ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_severity ob x;
  Bi_outbuf.contents ob
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
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "error" ->
              (Error : core_severity)
            | "warning" ->
              (Warning : core_severity)
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
let write__11 = (
  Atdgen_runtime.Oj_run.write_list (
    write_location
  )
)
let string_of__11 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__11 ob x;
  Bi_outbuf.contents ob
let read__11 = (
  Atdgen_runtime.Oj_run.read_list (
    read_location
  )
)
let _11_of_string s =
  read__11 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_error_kind : _ -> core_error_kind -> _ = (
  fun ob x ->
    match x with
      | LexicalError -> Bi_outbuf.add_string ob "\"Lexical error\""
      | ParseError -> Bi_outbuf.add_string ob "\"Syntax error\""
      | SpecifiedParseError -> Bi_outbuf.add_string ob "\"Other syntax error\""
      | AstBuilderError -> Bi_outbuf.add_string ob "\"AST builder error\""
      | RuleParseError -> Bi_outbuf.add_string ob "\"Rule parse error\""
      | PatternParseError x ->
        Bi_outbuf.add_string ob "[\"Pattern parse error\",";
        (
          write__10
        ) ob x;
        Bi_outbuf.add_char ob ']'
      | InvalidYaml -> Bi_outbuf.add_string ob "\"Invalid YAML\""
      | MatchingError -> Bi_outbuf.add_string ob "\"Internal matching error\""
      | SemgrepMatchFound -> Bi_outbuf.add_string ob "\"Semgrep match found\""
      | TooManyMatches -> Bi_outbuf.add_string ob "\"Too many matches\""
      | FatalError -> Bi_outbuf.add_string ob "\"Fatal error\""
      | Timeout -> Bi_outbuf.add_string ob "\"Timeout\""
      | OutOfMemory -> Bi_outbuf.add_string ob "\"Out of memory\""
      | TimeoutDuringInterfile -> Bi_outbuf.add_string ob "\"Timeout during interfile analysis\""
      | OutOfMemoryDuringInterfile -> Bi_outbuf.add_string ob "\"OOM during interfile analysis\""
      | PartialParsing x ->
        Bi_outbuf.add_string ob "[\"PartialParsing\",";
        (
          write__11
        ) ob x;
        Bi_outbuf.add_char ob ']'
)
let string_of_core_error_kind ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_error_kind ob x;
  Bi_outbuf.contents ob
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
                  read__10
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
                  read__11
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (PartialParsing x : core_error_kind)
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
                  read__10
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
                  read__11
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (PartialParsing x : core_error_kind)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let core_error_kind_of_string s =
  read_core_error_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_error : _ -> core_error -> _ = (
  fun ob (x : core_error) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"error_type\":";
    (
      write_core_error_kind
    )
      ob x.error_type;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"severity\":";
    (
      write_core_severity
    )
      ob x.severity;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    (match x.details with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"details\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_core_error ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_error ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
let write__26 = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule
  )
)
let string_of__26 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__26 ob x;
  Bi_outbuf.contents ob
let read__26 = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule
  )
)
let _26_of_string s =
  read__26 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__25 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_core_timing
  )
)
let string_of__25 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__25 ob x;
  Bi_outbuf.contents ob
let read__25 = (
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
                  read_core_timing
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
                  read_core_timing
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _25_of_string s =
  read__25 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__24 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__16
  )
)
let string_of__24 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__24 ob x;
  Bi_outbuf.contents ob
let read__24 = (
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
                  read__16
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
                  read__16
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _24_of_string s =
  read__24 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__22 = (
  Atdgen_runtime.Oj_run.write_list (
    write_skipped_rule
  )
)
let string_of__22 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__22 ob x;
  Bi_outbuf.contents ob
let read__22 = (
  Atdgen_runtime.Oj_run.read_list (
    read_skipped_rule
  )
)
let _22_of_string s =
  read__22 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__23 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__22
  )
)
let string_of__23 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__23 ob x;
  Bi_outbuf.contents ob
let read__23 = (
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
                  read__22
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
                  read__22
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _23_of_string s =
  read__23 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__20 = (
  Atdgen_runtime.Oj_run.write_list (
    write_skipped_target
  )
)
let string_of__20 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__20 ob x;
  Bi_outbuf.contents ob
let read__20 = (
  Atdgen_runtime.Oj_run.read_list (
    read_skipped_target
  )
)
let _20_of_string s =
  read__20 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__21 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__20
  )
)
let string_of__21 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__21 ob x;
  Bi_outbuf.contents ob
let read__21 = (
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
                  read__20
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
                  read__20
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _21_of_string s =
  read__21 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__19 = (
  Atdgen_runtime.Oj_run.write_list (
    write_core_error
  )
)
let string_of__19 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__19 ob x;
  Bi_outbuf.contents ob
let read__19 = (
  Atdgen_runtime.Oj_run.read_list (
    read_core_error
  )
)
let _19_of_string s =
  read__19 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_core_match_results : _ -> core_match_results -> _ = (
  fun ob (x : core_match_results) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"matches\":";
    (
      write__17
    )
      ob x.matches;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"errors\":";
    (
      write__19
    )
      ob x.errors;
    (match x.skipped_targets with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"skipped\":";
      (
        write__20
      )
        ob x;
    );
    (match x.skipped_rules with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"skipped_rules\":";
      (
        write__22
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"explanations\":";
      (
        write__16
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"stats\":";
    (
      write_core_stats
    )
      ob x.stats;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"time\":";
      (
        write_core_timing
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rules\":";
    (
      write__26
    )
      ob x.rules;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"engine_requested\":";
    (
      write_engine_kind
    )
      ob x.engine_requested;
    Bi_outbuf.add_char ob '}';
)
let string_of_core_match_results ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_core_match_results ob x;
  Bi_outbuf.contents ob
let read_core_match_results = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_matches = ref (None) in
    let field_errors = ref (None) in
    let field_skipped_targets = ref (None) in
    let field_skipped_rules = ref (None) in
    let field_explanations = ref (None) in
    let field_stats = ref (None) in
    let field_time = ref (None) in
    let field_rules = ref (None) in
    let field_engine_requested = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                        7
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 's' then (
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
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
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
            | 12 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                  4
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                  8
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
            field_matches := (
              Some (
                (
                  read__17
                ) p lb
              )
            );
          | 1 ->
            field_errors := (
              Some (
                (
                  read__19
                ) p lb
              )
            );
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped_targets := (
                Some (
                  (
                    read__20
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped_rules := (
                Some (
                  (
                    read__22
                  ) p lb
                )
              );
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__16
                  ) p lb
                )
              );
            )
          | 5 ->
            field_stats := (
              Some (
                (
                  read_core_stats
                ) p lb
              )
            );
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_core_timing
                  ) p lb
                )
              );
            )
          | 7 ->
            field_rules := (
              Some (
                (
                  read__26
                ) p lb
              )
            );
          | 8 ->
            field_engine_requested := (
              Some (
                (
                  read_engine_kind
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                          7
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 's' then (
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
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' then (
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
              | 12 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 's' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'e' && String.unsafe_get s (pos+15) = 'd' then (
                    8
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
              field_matches := (
                Some (
                  (
                    read__17
                  ) p lb
                )
              );
            | 1 ->
              field_errors := (
                Some (
                  (
                    read__19
                  ) p lb
                )
              );
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped_targets := (
                  Some (
                    (
                      read__20
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped_rules := (
                  Some (
                    (
                      read__22
                    ) p lb
                  )
                );
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__16
                    ) p lb
                  )
                );
              )
            | 5 ->
              field_stats := (
                Some (
                  (
                    read_core_stats
                  ) p lb
                )
              );
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_core_timing
                    ) p lb
                  )
                );
              )
            | 7 ->
              field_rules := (
                Some (
                  (
                    read__26
                  ) p lb
                )
              );
            | 8 ->
              field_engine_requested := (
                Some (
                  (
                    read_engine_kind
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
            matches = (match !field_matches with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "matches");
            errors = (match !field_errors with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "errors");
            skipped_targets = !field_skipped_targets;
            skipped_rules = !field_skipped_rules;
            explanations = !field_explanations;
            stats = (match !field_stats with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "stats");
            time = !field_time;
            rules = (match !field_rules with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rules");
            engine_requested = (match !field_engine_requested with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "engine_requested");
          }
         : core_match_results)
      )
)
let core_match_results_of_string s =
  read_core_match_results (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__54 = (
  Atdgen_runtime.Oj_run.write_list (
    Yojson.Safe.write_std_float
  )
)
let string_of__54 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__54 ob x;
  Bi_outbuf.contents ob
let read__54 = (
  Atdgen_runtime.Oj_run.read_list (
    Atdgen_runtime.Oj_run.read_number
  )
)
let _54_of_string s =
  read__54 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_target_times : _ -> cli_target_times -> _ = (
  fun ob (x : cli_target_times) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"num_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.num_bytes;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"match_times\":";
    (
      write__54
    )
      ob x.match_times;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"parse_times\":";
    (
      write__54
    )
      ob x.parse_times;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"run_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.run_time;
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_target_times ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_target_times ob x;
  Bi_outbuf.contents ob
let read_cli_target_times = (
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
            invalid_arg "out-of-bounds substring position or length";
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
                  Atdgen_runtime.Oj_run.read_string
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
                  read__54
                ) p lb
              )
            );
          | 3 ->
            field_parse_times := (
              Some (
                (
                  read__54
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
              invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
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
                    read__54
                  ) p lb
                )
              );
            | 3 ->
              field_parse_times := (
                Some (
                  (
                    read__54
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
         : cli_target_times)
      )
)
let cli_target_times_of_string s =
  read_cli_target_times (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__53 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_target_times
  )
)
let string_of__53 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__53 ob x;
  Bi_outbuf.contents ob
let read__53 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_target_times
  )
)
let _53_of_string s =
  read__53 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__52 = (
  Atdgen_runtime.Oj_run.write_assoc_list (
    Yojson.Safe.write_string
  ) (
    Yojson.Safe.write_std_float
  )
)
let string_of__52 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__52 ob x;
  Bi_outbuf.contents ob
let read__52 = (
  Atdgen_runtime.Oj_run.read_assoc_list (
    Atdgen_runtime.Oj_run.read_string
  ) (
    Atdgen_runtime.Oj_run.read_number
  )
)
let _52_of_string s =
  read__52 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__51 = (
  Atdgen_runtime.Oj_run.write_list (
    write_rule_id_dict
  )
)
let string_of__51 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__51 ob x;
  Bi_outbuf.contents ob
let read__51 = (
  Atdgen_runtime.Oj_run.read_list (
    read_rule_id_dict
  )
)
let _51_of_string s =
  read__51 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_timing : _ -> cli_timing -> _ = (
  fun ob (x : cli_timing) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rules\":";
    (
      write__51
    )
      ob x.rules;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rules_parse_time\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.rules_parse_time;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"profiling_times\":";
    (
      write__52
    )
      ob x.profiling_times;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"targets\":";
    (
      write__53
    )
      ob x.targets;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"total_bytes\":";
    (
      Yojson.Safe.write_int
    )
      ob x.total_bytes;
    (match x.max_memory_bytes with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"max_memory_bytes\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_timing ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_timing ob x;
  Bi_outbuf.contents ob
let read_cli_timing = (
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
            invalid_arg "out-of-bounds substring position or length";
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
                  read__51
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
                  read__52
                ) p lb
              )
            );
          | 3 ->
            field_targets := (
              Some (
                (
                  read__53
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
              invalid_arg "out-of-bounds substring position or length";
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
                    read__51
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
                    read__52
                  ) p lb
                )
              );
            | 3 ->
              field_targets := (
                Some (
                  (
                    read__53
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
         : cli_timing)
      )
)
let cli_timing_of_string s =
  read_cli_timing (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_skipped_target : _ -> cli_skipped_target -> _ = (
  fun ob (x : cli_skipped_target) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"reason\":";
    (
      Yojson.Safe.write_string
    )
      ob x.reason;
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_skipped_target ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_skipped_target ob x;
  Bi_outbuf.contents ob
let read_cli_skipped_target = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_path = ref (None) in
    let field_reason = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
            field_reason := (
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
              invalid_arg "out-of-bounds substring position or length";
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
              field_reason := (
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
            path = (match !field_path with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "path");
            reason = (match !field_reason with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reason");
          }
         : cli_skipped_target)
      )
)
let cli_skipped_target_of_string s =
  read_cli_skipped_target (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__49 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_skipped_target
  )
)
let string_of__49 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__49 ob x;
  Bi_outbuf.contents ob
let read__49 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_skipped_target
  )
)
let _49_of_string s =
  read__49 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__50 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__49
  )
)
let string_of__50 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__50 ob x;
  Bi_outbuf.contents ob
let read__50 = (
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
                  read__49
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
                  read__49
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _50_of_string s =
  read__50 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_paths : _ -> cli_paths -> _ = (
  fun ob (x : cli_paths) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"scanned\":";
    (
      write__10
    )
      ob x.scanned;
    (match x._comment with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"_comment\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.skipped with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"skipped\":";
      (
        write__49
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_paths ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_paths ob x;
  Bi_outbuf.contents ob
let read_cli_paths = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_scanned = ref (None) in
    let field__comment = ref (None) in
    let field_skipped = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 's' then (
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
            | 8 -> (
                if String.unsafe_get s pos = '_' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 't' then (
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
            field_scanned := (
              Some (
                (
                  read__10
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field__comment := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_skipped := (
                Some (
                  (
                    read__49
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 's' then (
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
              | 8 -> (
                  if String.unsafe_get s pos = '_' && String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 't' then (
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
              field_scanned := (
                Some (
                  (
                    read__10
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field__comment := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_skipped := (
                  Some (
                    (
                      read__49
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
            _comment = !field__comment;
            skipped = !field_skipped;
          }
         : cli_paths)
      )
)
let cli_paths_of_string s =
  read_cli_paths (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__48 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__26
  )
)
let string_of__48 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__48 ob x;
  Bi_outbuf.contents ob
let read__48 = (
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
                  read__26
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
                  read__26
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _48_of_string s =
  read__48 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__47 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_cli_timing
  )
)
let string_of__47 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__47 ob x;
  Bi_outbuf.contents ob
let read__47 = (
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
                  read_cli_timing
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
                  read_cli_timing
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _47_of_string s =
  read__47 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__42 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_engine_kind
  )
)
let string_of__42 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__42 ob x;
  Bi_outbuf.contents ob
let read__42 = (
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
let _42_of_string s =
  read__42 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_output_extra : _ -> cli_output_extra -> _ = (
  fun ob (x : cli_output_extra) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"paths\":";
    (
      write_cli_paths
    )
      ob x.paths;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"time\":";
      (
        write_cli_timing
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"explanations\":";
      (
        write__16
      )
        ob x;
    );
    (match x.rules with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rules\":";
      (
        write__26
      )
        ob x;
    );
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"engine_requested\":";
      (
        write_engine_kind
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_output_extra ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_output_extra ob x;
  Bi_outbuf.contents ob
let read_cli_output_extra = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_paths = ref (None) in
    let field_time = ref (None) in
    let field_explanations = ref (None) in
    let field_rules = ref (None) in
    let field_engine_requested = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
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
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                  2
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
                  read_cli_paths
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_cli_timing
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__16
                  ) p lb
                )
              );
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules := (
                Some (
                  (
                    read__26
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
              invalid_arg "out-of-bounds substring position or length";
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
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
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
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' then (
                    2
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
                    read_cli_paths
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_cli_timing
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__16
                    ) p lb
                  )
                );
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules := (
                  Some (
                    (
                      read__26
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
            rules = !field_rules;
            engine_requested = !field_engine_requested;
          }
         : cli_output_extra)
      )
)
let cli_output_extra_of_string s =
  read_cli_output_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__38 = (
  Atdgen_runtime.Oj_run.write_std_option (
    Yojson.Safe.write_bool
  )
)
let string_of__38 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__38 ob x;
  Bi_outbuf.contents ob
let read__38 = (
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
let _38_of_string s =
  read__38 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__37 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_fix_regex
  )
)
let string_of__37 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__37 ob x;
  Bi_outbuf.contents ob
let read__37 = (
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
let _37_of_string s =
  read__37 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__36 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_metavars
  )
)
let string_of__36 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__36 ob x;
  Bi_outbuf.contents ob
let read__36 = (
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
let _36_of_string s =
  read__36 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match_extra : _ -> cli_match_extra -> _ = (
  fun ob (x : cli_match_extra) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.metavars with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"metavars\":";
      (
        write_metavars
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"fingerprint\":";
    (
      Yojson.Safe.write_string
    )
      ob x.fingerprint;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"lines\":";
    (
      Yojson.Safe.write_string
    )
      ob x.lines;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"metadata\":";
    (
      write_raw_json
    )
      ob x.metadata;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"severity\":";
    (
      Yojson.Safe.write_string
    )
      ob x.severity;
    (match x.fix with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"fix\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.fix_regex with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"fix_regex\":";
      (
        write_fix_regex
      )
        ob x;
    );
    (match x.is_ignored with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"is_ignored\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    (match x.sca_info with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"sca_info\":";
      (
        write_sca_info
      )
        ob x;
    );
    (match x.fixed_lines with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"fixed_lines\":";
      (
        write__10
      )
        ob x;
    );
    (match x.dataflow_trace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"dataflow_trace\":";
      (
        write_cli_match_dataflow_trace
      )
        ob x;
    );
    (match x.engine_kind with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"engine_kind\":";
      (
        write_engine_kind
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_match_extra ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match_extra ob x;
  Bi_outbuf.contents ob
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
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                        12
                      )
                      else (
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
                    read__10
                  ) p lb
                )
              );
            )
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_dataflow_trace := (
                Some (
                  (
                    read_cli_match_dataflow_trace
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
              invalid_arg "out-of-bounds substring position or length";
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
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 'd' then (
                          12
                        )
                        else (
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
                      read__10
                    ) p lb
                  )
                );
              )
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_dataflow_trace := (
                  Some (
                    (
                      read_cli_match_dataflow_trace
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
          }
         : cli_match_extra)
      )
)
let cli_match_extra_of_string s =
  read_cli_match_extra (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match : _ -> cli_match -> _ = (
  fun ob (x : cli_match) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"check_id\":";
    (
      write_rule_id
    )
      ob x.check_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"path\":";
    (
      Yojson.Safe.write_string
    )
      ob x.path;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"start\":";
    (
      write_position
    )
      ob x.start;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"end\":";
    (
      write_position
    )
      ob x.end_;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"extra\":";
    (
      write_cli_match_extra
    )
      ob x.extra;
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_match ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
                  Atdgen_runtime.Oj_run.read_string
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
              invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
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
let write__27 = (
  Atdgen_runtime.Oj_run.write_list (
    write_error_span
  )
)
let string_of__27 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__27 ob x;
  Bi_outbuf.contents ob
let read__27 = (
  Atdgen_runtime.Oj_run.read_list (
    read_error_span
  )
)
let _27_of_string s =
  read__27 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__28 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write__27
  )
)
let string_of__28 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__28 ob x;
  Bi_outbuf.contents ob
let read__28 = (
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
                  read__27
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
                  read__27
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _28_of_string s =
  read__28 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_error : _ -> cli_error -> _ = (
  fun ob (x : cli_error) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"code\":";
    (
      Yojson.Safe.write_int
    )
      ob x.code;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"level\":";
    (
      Yojson.Safe.write_string
    )
      ob x.level;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"type\":";
    (
      Yojson.Safe.write_string
    )
      ob x.type_;
    (match x.rule_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rule_id\":";
      (
        write_rule_id
      )
        ob x;
    );
    (match x.message with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"message\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.path with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"path\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.long_msg with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"long_msg\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.short_msg with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"short_msg\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.spans with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"spans\":";
      (
        write__27
      )
        ob x;
    );
    (match x.help with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"help\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_error ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_error ob x;
  Bi_outbuf.contents ob
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
            invalid_arg "out-of-bounds substring position or length";
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
                    Atdgen_runtime.Oj_run.read_string
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
                    read__27
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
              invalid_arg "out-of-bounds substring position or length";
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
                      Atdgen_runtime.Oj_run.read_string
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
                      read__27
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
let write__46 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_match
  )
)
let string_of__46 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__46 ob x;
  Bi_outbuf.contents ob
let read__46 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_match
  )
)
let _46_of_string s =
  read__46 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__45 = (
  Atdgen_runtime.Oj_run.write_list (
    write_cli_error
  )
)
let string_of__45 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__45 ob x;
  Bi_outbuf.contents ob
let read__45 = (
  Atdgen_runtime.Oj_run.read_list (
    read_cli_error
  )
)
let _45_of_string s =
  read__45 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__44 = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_version
  )
)
let string_of__44 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__44 ob x;
  Bi_outbuf.contents ob
let read__44 = (
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
let _44_of_string s =
  read__44 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_output : _ -> cli_output -> _ = (
  fun ob (x : cli_output) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.version with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        write_version
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"errors\":";
    (
      write__45
    )
      ob x.errors;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"results\":";
    (
      write__46
    )
      ob x.results;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"paths\":";
    (
      write_cli_paths
    )
      ob x.paths;
    (match x.time with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"time\":";
      (
        write_cli_timing
      )
        ob x;
    );
    (match x.explanations with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"explanations\":";
      (
        write__16
      )
        ob x;
    );
    (match x.rules with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"rules\":";
      (
        write__26
      )
        ob x;
    );
    (match x.engine_requested with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"engine_requested\":";
      (
        write_engine_kind
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_output ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_output ob x;
  Bi_outbuf.contents ob
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
    let field_rules = ref (None) in
    let field_engine_requested = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
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
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
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
                  read__45
                ) p lb
              )
            );
          | 2 ->
            field_results := (
              Some (
                (
                  read__46
                ) p lb
              )
            );
          | 3 ->
            field_paths := (
              Some (
                (
                  read_cli_paths
                ) p lb
              )
            );
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_time := (
                Some (
                  (
                    read_cli_timing
                  ) p lb
                )
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_explanations := (
                Some (
                  (
                    read__16
                  ) p lb
                )
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_rules := (
                Some (
                  (
                    read__26
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
              invalid_arg "out-of-bounds substring position or length";
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
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
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
                    read__45
                  ) p lb
                )
              );
            | 2 ->
              field_results := (
                Some (
                  (
                    read__46
                  ) p lb
                )
              );
            | 3 ->
              field_paths := (
                Some (
                  (
                    read_cli_paths
                  ) p lb
                )
              );
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_time := (
                  Some (
                    (
                      read_cli_timing
                    ) p lb
                  )
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_explanations := (
                  Some (
                    (
                      read__16
                    ) p lb
                  )
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_rules := (
                  Some (
                    (
                      read__26
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
            rules = !field_rules;
            engine_requested = !field_engine_requested;
          }
         : cli_output)
      )
)
let cli_output_of_string s =
  read_cli_output (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cli_match_taint_source : _ -> cli_match_taint_source -> _ = (
  fun ob (x : cli_match_taint_source) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"content\":";
    (
      Yojson.Safe.write_string
    )
      ob x.content;
    Bi_outbuf.add_char ob '}';
)
let string_of_cli_match_taint_source ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cli_match_taint_source ob x;
  Bi_outbuf.contents ob
let read_cli_match_taint_source = (
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
            invalid_arg "out-of-bounds substring position or length";
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
              invalid_arg "out-of-bounds substring position or length";
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
         : cli_match_taint_source)
      )
)
let cli_match_taint_source_of_string s =
  read_cli_match_taint_source (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__57 = (
  Atdgen_runtime.Oj_run.write_nullable (
    Yojson.Safe.write_string
  )
)
let string_of__57 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__57 ob x;
  Bi_outbuf.contents ob
let read__57 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      Atdgen_runtime.Oj_run.read_string
    ) p lb) : _ option)
)
let _57_of_string s =
  read__57 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__56 = (
  Atdgen_runtime.Oj_run.write_list (
    write_finding
  )
)
let string_of__56 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__56 ob x;
  Bi_outbuf.contents ob
let read__56 = (
  Atdgen_runtime.Oj_run.read_list (
    read_finding
  )
)
let _56_of_string s =
  read__56 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_api_scans_findings : _ -> api_scans_findings -> _ = (
  fun ob (x : api_scans_findings) ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"findings\":";
    (
      write__56
    )
      ob x.findings;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"token\":";
    (
      write__57
    )
      ob x.token;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"gitlab_token\":";
    (
      write__57
    )
      ob x.gitlab_token;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"searched_paths\":";
    (
      write__10
    )
      ob x.searched_paths;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rule_ids\":";
    (
      write__10
    )
      ob x.rule_ids;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"cai_ids\":";
    (
      write__10
    )
      ob x.cai_ids;
    Bi_outbuf.add_char ob '}';
)
let string_of_api_scans_findings ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_api_scans_findings ob x;
  Bi_outbuf.contents ob
let read_api_scans_findings = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_findings = ref (None) in
    let field_token = ref (None) in
    let field_gitlab_token = ref (None) in
    let field_searched_paths = ref (None) in
    let field_rule_ids = ref (None) in
    let field_cai_ids = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 's' then (
                  5
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
            | 12 -> (
                if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'k' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'n' then (
                  2
                )
                else (
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
                  read__56
                ) p lb
              )
            );
          | 1 ->
            field_token := (
              Some (
                (
                  read__57
                ) p lb
              )
            );
          | 2 ->
            field_gitlab_token := (
              Some (
                (
                  read__57
                ) p lb
              )
            );
          | 3 ->
            field_searched_paths := (
              Some (
                (
                  read__10
                ) p lb
              )
            );
          | 4 ->
            field_rule_ids := (
              Some (
                (
                  read__10
                ) p lb
              )
            );
          | 5 ->
            field_cai_ids := (
              Some (
                (
                  read__10
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
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 's' then (
                    5
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
              | 12 -> (
                  if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'k' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'n' then (
                    2
                  )
                  else (
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
                    read__56
                  ) p lb
                )
              );
            | 1 ->
              field_token := (
                Some (
                  (
                    read__57
                  ) p lb
                )
              );
            | 2 ->
              field_gitlab_token := (
                Some (
                  (
                    read__57
                  ) p lb
                )
              );
            | 3 ->
              field_searched_paths := (
                Some (
                  (
                    read__10
                  ) p lb
                )
              );
            | 4 ->
              field_rule_ids := (
                Some (
                  (
                    read__10
                  ) p lb
                )
              );
            | 5 ->
              field_cai_ids := (
                Some (
                  (
                    read__10
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
            findings = (match !field_findings with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "findings");
            token = (match !field_token with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "token");
            gitlab_token = (match !field_gitlab_token with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "gitlab_token");
            searched_paths = (match !field_searched_paths with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "searched_paths");
            rule_ids = (match !field_rule_ids with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "rule_ids");
            cai_ids = (match !field_cai_ids with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cai_ids");
          }
         : api_scans_findings)
      )
)
let api_scans_findings_of_string s =
  read_api_scans_findings (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
