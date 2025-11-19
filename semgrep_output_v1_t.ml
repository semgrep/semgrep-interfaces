(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

(** RFC 3339 format *)
type datetime = ATD_string_wrap.Datetime.t
  [@@deriving ord]

type dependency_child = { package: string; version: string } [@@deriving ord]

(** *)
type dependency_kind =  Direct (** *) | Transitive (** *) | Unknown (** *) 
  [@@deriving ord, eq, show]

(** *)
type ecosystem = 
    Npm
  | Pypi
  | Gem
  | Gomod
  | Cargo
  | Maven
  | Composer
  | Nuget
  | Pub
  | SwiftPM
  | Cocoapods
  | Mix (** *)
  | Hex
  | Opam

  [@@deriving eq, ord, show]

type fpath = ATD_string_wrap.Fpath.t [@@deriving eq, ord, show]

type found_dependency = {
  package: string;
  version: string;
  ecosystem: ecosystem;
  allowed_hashes: (string * string list) list (** *);
  resolved_url: string option;
  transitivity: dependency_kind;
  manifest_path: fpath option (** *);
  lockfile_path: fpath option (** *);
  line_number: int option (** *);
  children: dependency_child list option (** *);
  git_ref: string option (** *)
}
  [@@deriving ord]

type lockfile_kind = 
    PipRequirementsTxt
  | PoetryLock
  | PipfileLock
  | UvLock
  | NpmPackageLockJson
  | YarnLock
  | PnpmLock
  | BunLock
  | BunBinaryLock (** Bun's deprecated binary bun.lockb format *)
  | GemfileLock
  | GoModLock
  | CargoLock
  | MavenDepTree (** *)
  | GradleLockfile
  | ComposerLock
  | NugetPackagesLockJson
  | PubspecLock
  | SwiftPackageResolved (** *)
  | PodfileLock
  | MixLock
  | ConanLock
  | OpamLocked

  [@@deriving show, eq, yojson]

type lockfile = { kind: lockfile_kind; path: fpath } [@@deriving show, eq]

type manifest_kind = 
    RequirementsIn (** *)
  | SetupPy (** *)
  | PackageJson (** *)
  | Gemfile (** *)
  | GoModManifest (** *)
  | CargoToml (** *)
  | PomXml (** *)
  | BuildGradle (** *)
  | BuildGradleKts (** *)
  | SettingsGradle (** *)
  | ComposerJson (** *)
  | NugetManifestJson (** *)
  | PubspecYaml (** *)
  | PackageSwift (** *)
  | Podfile (** *)
  | MixExs (** *)
  | Pipfile (** *)
  | PyprojectToml (** *)
  | ConanFileTxt (** *)
  | ConanFilePy (** *)
  | Csproj (** *)
  | OpamFile (** *)
  | BuildSbt (** *)

  [@@deriving show, eq]

type manifest = { kind: manifest_kind; path: fpath } [@@deriving show, eq]

(**
  This is used in rules to specify the severity of matches/findings. alt:
  could be called rule_severity, or finding_severity.
  
{v
   Error = something wrong that must be fixed
   Warning = something wrong that should be fixed
   Info = some special condition worth knowing about
   Experiment = deprecated: guess what
   Inventory = deprecated: was used for the Code Asset Inventory (CAI) project
v}
*)
type match_severity = [
    `Error
  | `Warning
  | `Experiment
  | `Inventory
  | `Critical
      (**
        since 1.72.0, meant to replace the cases above where Error -> High,
        Warning -> Medium. Critical/Low are the only really new category here
        without equivalent before. Experiment and Inventory above should be
        removed. Info can be kept.
      *)
  | `High
  | `Medium
  | `Low
  | `Info
      (** generic placeholder for non-risky things (including experiments) *)
]
  [@@deriving eq, ord, show]

(** *)
type matching_operation = 
    And
  | Or
  | Inside
  | Anywhere
  | XPat of string (** *)
  | Negation
  | Filter of string
  | Taint
  | TaintSource
  | TaintSink
  | TaintSanitizer
  | EllipsisAndStmts
  | ClassHeaderAndElems

  [@@deriving show { with_path = false}]

(** Note that there is no filename here like in 'location' below *)
type position = {
  line: int;
  col: int;
  offset: int
    (**
      Byte position from the beginning of the file, starts at 0. OCaml code
      sets it correctly. Python code sets it to a dummy value (-1). This uses
      '~' because pysemgrep < 1.30? was *producing* positions without offset
      sometimes, and we want the backend to still *consume* such positions.
      Note that pysemgrep 1.97 was still producing dummy positions without an
      offset so we might need this ~offset longer than expected?
    *)
}
  [@@deriving ord, show]

type location = { path: fpath; start: position; end_ (*atd end *): position }
  [@@deriving ord, show]

(** *)
type loc_and_content = (location * string) [@@deriving ord]

(** *)
type match_intermediate_var = { location: location; content: string (** *) }
  [@@deriving ord]

(**
  Used for a best-effort report to users about what findings they get with
  the pro engine that they couldn't with the oss engine.
  
{v
    interproc_taint = requires interprocedural taint
    interfile_taint = requires interfile taint
    proprietary_language = requires some non-taint pro feature
v}
*)
type pro_feature = {
  interproc_taint: bool;
  interfile_taint: bool;
  proprietary_language: bool
}
  [@@deriving ord, show]

(** *)
type engine_of_finding = [
    `OSS
  | `PRO
  | `PRO_REQUIRED of pro_feature (** *)
]
  [@@deriving ord, show]

(** escape hatch *)
type raw_json = JSON.Yojson.t [@@deriving eq, ord, show]

(** e.g., "javascript.security.do-not-use-eval" *)
type rule_id = Rule_ID.t
  [@@deriving show, eq, ord]

type sca_pattern = {
  ecosystem: ecosystem;
  package: string;
  semver_range: string
}
  [@@deriving ord]

type dependency_match = {
  dependency_pattern: sca_pattern;
  found_dependency: found_dependency;
  lockfile: fpath
}
  [@@deriving ord]

type sha1 = ATD_string_wrap.Sha1.t [@@deriving ord]

(** *)
type historical_info = {
  git_commit: sha1 (** *);
  git_blob: sha1 option (** *);
  git_commit_timestamp: datetime
}
  [@@deriving ord]

type svalue_value = {
  svalue_start: position option;
  svalue_end: position option;
  svalue_abstract_content: string (** *)
}
  [@@deriving ord]

type metavar_value = {
  start: position (** *);
  end_ (*atd end *): position;
  abstract_content: string (** *);
  propagated_value: svalue_value option
}
  [@@deriving ord]

(** *)
type metavars = (string * metavar_value) list [@@deriving ord]

type transitive_undetermined = { explanation: string option }
  [@@deriving ord]

type transitive_unreachable = {
  analyzed_packages: found_dependency list (** *);
  explanation: string option (** *)
}
  [@@deriving ord]

(** *)
type validation_state = [
    `Confirmed_valid | `Confirmed_invalid | `Validation_error | `No_validator
]
  [@@deriving eq, ord, show]

type dependency_source = 
    ManifestOnly of manifest
  | LockfileOnly of lockfile
  | ManifestLockfile of (manifest * lockfile)
  | MultiLockfile of dependency_source list (** *)

  [@@deriving show]

type match_call_trace = 
    CliLoc of loc_and_content
  | CliCall
      of (loc_and_content * match_intermediate_var list * match_call_trace)

  [@@deriving ord]

type match_dataflow_trace = {
  taint_source: match_call_trace option;
  intermediate_vars: match_intermediate_var list option (** *);
  taint_sink: match_call_trace option
}
  [@@deriving ord]

type cli_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: cli_match_extra
}

and cli_match_extra = {
  metavars: metavars option (** *);
  message: string (** *);
  fix: string option (** *);
  fixed_lines: string list option (** *);
  metadata: raw_json (** *);
  severity: match_severity;
  fingerprint: string (** *);
  lines: string;
  is_ignored: bool option (** *);
  sca_info: sca_match option (** *);
  validation_state: validation_state option (** *);
  historical_info: historical_info option (** *);
  dataflow_trace: match_dataflow_trace option (** *);
  engine_kind: engine_of_finding option;
  extra_extra: raw_json option (** *)
}

(** *)
and sca_match = {
  reachability_rule: bool;
  sca_finding_schema: int;
  dependency_match: dependency_match;
  reachable: bool;
  kind: sca_match_kind option (** *)
}

(** *)
and sca_match_kind = 
    LockfileOnlyMatch of dependency_kind (** *)
  | DirectReachable (** *)
  | TransitiveReachable of transitive_reachable (** *)
  | TransitiveUnreachable of transitive_unreachable (** *)
  | TransitiveUndetermined of transitive_undetermined (** *)

  [@@deriving ord]

(** *)
and transitive_reachable = {
  matches: (found_dependency * cli_match list) list (** *);
  callgraph_reachable: bool option (** *);
  explanation: string option (** *)
}

(** *)
type core_match_extra = {
  metavars: metavars;
  engine_kind: engine_of_finding;
  is_ignored: bool;
  message: string option (** *);
  metadata: raw_json option;
  severity: match_severity option;
  fix: string option;
  dataflow_trace: match_dataflow_trace option;
  sca_match: sca_match option;
  validation_state: validation_state option;
  historical_info: historical_info option;
  extra_extra: raw_json option (** *)
}

(** *)
type core_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: core_match_extra
}

(** *)
type matching_explanation_extra = {
  before_negation_matches: core_match list option (** *);
  before_filter_matches: core_match list option (** *)
}

(** *)
type matching_explanation = {
  op: matching_operation;
  children: matching_explanation list;
  matches: core_match list (** *);
  loc: location (** *);
  extra: matching_explanation_extra option (** *)
}

(** *)
type very_slow_stats = {
  time_ratio: float (** *);
  count_ratio: float (** *)
}

(** e.g., '1.1.0' *)
type version = string [@@deriving show]

type uuid = ATD_string_wrap.Uuidm.t [@@deriving ord]

type uri = ATD_string_wrap.Uri.t [@@deriving ord]

type unresolved_reason = 
    UnresolvedFailed (** *)
  | UnresolvedSkipped (** *)
  | UnresolvedUnsupported (** *)
  | UnresolvedDisabled (** *)


(** *)
type subproject = {
  root_dir: fpath;
  ecosystem: ecosystem option (** *);
  dependency_source: dependency_source
}
  [@@deriving show]

(** *)
type sca_parser_name = 
    PGemfile_lock | PGo_mod | PGo_sum | PGradle_lockfile | PGradle_build
  | PJsondoc | PPipfile | PPnpm_lock | PPoetry_lock | PPyproject_toml
  | PRequirements | PYarn_1 | PYarn_2 | PPomtree | PCargo_parser
  | PComposer_lock | PPubspec_lock | PPackage_swift | PPodfile_lock
  | PPackage_resolved | PMix_lock

  [@@deriving show]

type resolution_cmd_failed = { command: string; message: string }
  [@@deriving show]

type resolution_error_kind = 
    UnsupportedManifest
  | MissingRequirement of string
  | ResolutionCmdFailed of resolution_cmd_failed
  | ParseDependenciesFailed of string (** *)
  | ScaParseError of sca_parser_name (** *)

  [@@deriving show]

(** *)
type sca_resolution_error = {
  type_: resolution_error_kind;
  dependency_source_file: fpath
}

type dependency_parser_error = {
  path: fpath;
  parser: sca_parser_name;
  reason: string;
  line: int option (** *);
  col: int option;
  text: string option
}

type sca_error = 
    SCAParse of dependency_parser_error
  | SCAResol of sca_resolution_error


type unresolved_subproject = {
  info: subproject;
  reason: unresolved_reason;
  errors: sca_error list (** *)
}

(** *)
type snippet = { line: int; text: string }

type killing_parent_kind = [ `And | `Inside | `Negation | `Filter of string ]

(** *)
type killing_parent = {
  killing_parent_kind: killing_parent_kind;
  snippet: snippet
}

type unexpected_no_match_diagnosis_kind = [
    `Never_matched
  | `Killed_by_nodes of killing_parent list
]

type unexpected_no_match_diagnosis = {
  line: int;
  kind: unexpected_no_match_diagnosis_kind
}

type originating_node_kind = [ `Focus | `Xpattern ]

type unexpected_match_diagnosis = {
  matched_text: snippet;
  originating_kind: originating_node_kind (** *);
  originating_text: snippet;
  killing_parents: killing_parent list
}

type triage_ignored = {
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list (** *)
}

type transitive_finding = { m: core_match (** *) }

(** *)
type downloaded_dependency = { source_paths: fpath list }

type resolved_dependency = (found_dependency * downloaded_dependency option)

type transitive_reachability_filter_params = {
  rules_path: fpath;
  findings: transitive_finding list;
  dependencies: resolved_dependency list;
  write_to_cache: bool
}

(** *)
type tr_cache_match_result = { matches: cli_match list (** *) }

(** *)
type tr_cache_key = {
  rule_id: rule_id;
  rule_version: string (** *);
  engine_version: int (** *);
  package_url: string (** *);
  extra: string (** *)
}
  [@@deriving show, eq]

(** *)
type tr_query_cache_response = {
  cached: (tr_cache_key * tr_cache_match_result) list
}

(** *)
type tr_query_cache_request = { entries: tr_cache_key list }

(** *)
type tr_add_cache_request = {
  new_entries: (tr_cache_key * tr_cache_match_result) list
}

type todo = int

type matching_diagnosis = {
  target: fpath (** *);
  unexpected_match_diagnoses: unexpected_match_diagnosis list;
  unexpected_no_match_diagnoses: unexpected_no_match_diagnosis list
}

type expected_reported = {
  expected_lines: int list;
  reported_lines: int list
}

type rule_result = {
  passed: bool;
  matches: (string * expected_reported) list (** *);
  errors: todo list;
  diagnosis: matching_diagnosis option (** *)
}

type fixtest_result = { passed: bool }

type config_error_reason =  UnparsableRule 

type config_error = { file: fpath; reason: config_error_reason }

type checks = { checks: (string * rule_result) list (** *) }

type tests_result = {
  results: (string * checks) list (** *);
  fixtest_results: (string * fixtest_result) list (** *);
  config_missing_tests: fpath list;
  config_missing_fixtests: fpath list;
  config_with_errors: config_error list
}

(** *)
type project_root = [
    `Filesystem of string (** *)
  | `Git_remote of string (** *)
]
  [@@deriving show]

(** *)
type targeting_conf = {
  exclude: string list;
  include_: string list option;
  max_target_bytes: int;
  respect_gitignore: bool;
  respect_semgrepignore_files: bool;
  semgrepignore_filename: string option;
  always_select_explicit_targets: bool;
  explicit_targets: string list (** *);
  force_project_root: project_root option (** *);
  force_novcs_project: bool;
  exclude_minified_files: bool;
  baseline_commit: string option
}
  [@@deriving show]

type product = [ `SAST (** *) | `SCA (** *) | `Secrets ]
  [@@deriving eq, ord, show]

type ppath = Ppath.t [@@deriving show, eq]

(**
  Same as Fppath.t: a nice filesystem path + the path relative to the project
  root provided for pattern-based filtering purposes.
*)
type fppath = { fpath: fpath; ppath: ppath }
  [@@deriving show, eq]

(** *)
type analyzer = Analyzer.t [@@deriving show]

(** *)
type code_target = {
  path: fppath;
  analyzer: analyzer (** *);
  products: product list;
  dependency_source: dependency_source option
}
  [@@deriving show]

(** *)
type target = [
    `CodeTarget of code_target
  | `DependencySourceTarget of dependency_source
]
  [@@deriving show]

type scanning_roots = {
  root_paths: fpath list;
  targeting_conf: targeting_conf
}
  [@@deriving show]

(** *)
type targets = [
    `Scanning_roots of scanning_roots (** *)
  | `Targets of target list (** *)
]
  [@@deriving show]

type target_times = {
  path: fpath;
  num_bytes: int;
  match_times: float list (** *);
  parse_times: float list (** *);
  run_time: float (** *)
}

(** *)
type skip_reason = 
    Always_skipped (** *)
  | Semgrepignore_patterns_match
  | Cli_include_flags_do_not_match
  | Cli_exclude_flags_match
  | Exceeded_size_limit
  | Analysis_failed_parser_or_internal_error
  | Excluded_by_config (** *)
  | Wrong_language
  | Too_big
  | Minified
  | Binary
  | Irrelevant_rule
  | Too_many_matches
  | Gitignore_patterns_match (** *)
  | Dotfile (** *)
  | Nonexistent_file (** *)
  | Insufficient_permissions (** *)

  [@@deriving show]

(** *)
type skipped_target = {
  path: fpath;
  reason: skip_reason;
  details: string option (** *);
  rule_id: rule_id option (** *)
}
  [@@deriving show]

type incompatible_rule = {
  rule_id: rule_id;
  this_version: version;
  min_version: version option;
  max_version: version option
}
  [@@deriving show]

(** *)
type error_type = 
    LexicalError (** *)
  | ParseError (** *)
  | OtherParseError
  | AstBuilderError
  | RuleParseError (** *)
  | SemgrepWarning (** *)
  | SemgrepError
  | InvalidRuleSchemaError
  | UnknownLanguageError
  | InvalidYaml
  | MatchingError (** *)
  | SemgrepMatchFound (** *)
  | TooManyMatches
  | FatalError (** *)
  | Timeout
  | OutOfMemory
  | FixpointTimeout (** *)
  | StackOverflow (** *)
  | TimeoutDuringInterfile (** *)
  | OutOfMemoryDuringInterfile
  | MissingPlugin (** *)
  | PatternParseError of string list (** *)
  | PartialParsing of location list (** *)
  | IncompatibleRule of incompatible_rule (** *)
  | PatternParseError0 (** *)
  | IncompatibleRule0
  | DependencyResolutionError of resolution_error_kind (** *)

  [@@deriving show]

(**
  This is used to specify the severity of errors which happened during
  Semgrep execution (e.g., a parse error).
  
{v
    Error = Always an error
    Warning = Only an error if "strict" is set
    Info = Nothing may be wrong
v}
  
  alt: could reuse match_severity but seems cleaner to define its own type
*)
type error_severity = [ `Error | `Warning | `Info ]
  [@@deriving show, eq]

(** *)
type core_error = {
  error_type: error_type;
  severity: error_severity;
  message: string;
  details: string option;
  location: location option;
  rule_id: rule_id option
}

(** *)
type target_discovery_result = {
  target_paths: fppath list;
  errors: core_error list;
  skipped: skipped_target list
}

(** *)
type summary_stats = { mean: float; std_dev: float }

(** *)
type def_rule_time = {
  fpath: fpath;
  fline: int;
  rule_id: rule_id;
  time: float
}
  [@@deriving show]

(** *)
type tainting_time = {
  total_time: float;
  per_def_and_rule_time: summary_stats;
  very_slow_stats: very_slow_stats;
  very_slow_rules_on_defs: def_rule_time list (** *)
}

(** *)
type tag = string

(** *)
type symbol = { fqn: string list } [@@deriving show]

(** *)
type symbol_usage = { symbol: symbol; locs: location list }
  [@@deriving show]

type symbol_analysis_upload_response = { upload_url: uri (** *) }

type symbol_analysis = symbol_usage list [@@deriving show]

type resolution_method = [
    `LockfileParsing (** *)
  | `DynamicResolution (** *)
]
  [@@deriving show]

type dependency_source_file_kind = [
    `Lockfile of lockfile_kind
  | `Manifest of manifest_kind
]
  [@@deriving show]

type dependency_source_file = {
  kind: dependency_source_file_kind;
  path: fpath
}

type dependency_resolution_stats = {
  resolution_method: resolution_method;
  dependency_count: int;
  ecosystem: ecosystem
}

type subproject_stats = {
  subproject_id: string (** *);
  dependency_sources: dependency_source_file list (** *);
  resolved_stats: dependency_resolution_stats option (** *);
  unresolved_reason: unresolved_reason option (** *);
  errors: sca_error list (** *)
}

type supply_chain_stats = { subprojects_stats: subproject_stats list }

type skipped_rule = {
  rule_id: rule_id;
  details: string;
  position: position (** *)
}

(** *)
type file_time = { fpath: fpath; ftime: float } [@@deriving show]

(** *)
type scanning_time = {
  total_time: float;
  per_file_time: summary_stats;
  very_slow_stats: very_slow_stats;
  very_slow_files: file_time list (** *)
}

type scanned_and_skipped = {
  scanned: fpath list;
  skipped: skipped_target list option (** *)
}

type scan_info = {
  id: int option (** *);
  enabled_products: product list;
  deployment_id: int;
  deployment_name: string
}

(** *)
type scan_configuration = {
  rules: raw_json;
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list (** *);
  project_merge_base: sha1 option (** *);
  fips_mode: bool (** *)
}

type glob = string

(** *)
type product_ignored_files = (product * glob list) list

(** *)
type historical_configuration = { enabled: bool; lookback_days: int option }

type engine_configuration = {
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool (** *);
  scan_all_deps_in_diff_scan: bool (** *);
  symbol_analysis: bool (** *);
  transitive_reachability_enabled: bool;
  ignored_files: string list (** *);
  product_ignored_files: product_ignored_files option (** *);
  generic_slow_rollout: bool (** *);
  historical_config: historical_configuration option (** *);
  always_suppress_errors: bool (** *)
}

(** *)
type scan_response = {
  info: scan_info;
  config: scan_configuration;
  engine_params: engine_configuration
}

(** *)
type scan_metadata = {
  cli_version: version;
  unique_id: uuid (** *);
  requested_products: product list;
  dry_run: bool (** *);
  sms_scan_id: string option (** *);
  ecosystems: string list;
  packages: string list
}

(** *)
type project_metadata = {
  scan_environment: string (** *);
  repository: string (** *);
  repo_url: uri option;
  repo_id: string option (** *);
  org_id: string option (** *);
  repo_display_name: string option (** *);
  branch: string option (** *);
  commit: sha1 option;
  commit_title: string option;
  commit_timestamp: datetime option (** *);
  commit_author_email: string option;
  commit_author_name: string option;
  commit_author_username: string option;
  commit_author_image_url: uri option;
  ci_job_url: uri option;
  on: string (** *);
  pull_request_author_username: string option;
  pull_request_author_image_url: uri option;
  pull_request_id: string option;
  pull_request_title: string option;
  base_branch_head_commit: sha1 option (** *);
  base_sha: sha1 option (** *);
  start_sha: sha1 option (** *);
  is_full_scan: bool (** *);
  is_sca_scan: bool option (** *);
  is_code_scan: bool option (** *);
  is_secrets_scan: bool option (** *);
  project_id: string option (** *)
}

type ci_config_from_repo = { version: version (** *); tags: tag list option }

(** *)
type scan_request = {
  project_metadata: project_metadata;
  scan_metadata: scan_metadata;
  project_config: ci_config_from_repo option
}

type ci_env = (string * string) list

(** *)
type ci_config = {
  env: ci_env (** *);
  enabled_products: product list;
  ignored_files: string list (** *);
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool (** *);
  scan_all_deps_in_diff_scan: bool (** *);
  symbol_analysis: bool (** *);
  transitive_reachability_enabled: bool
}

type action = [
    `Message of string
  | `Delay of float (** *)
  | `Exit of int (** *)
]

(** *)
type ci_config_from_cloud = {
  repo_config: ci_config;
  org_config: ci_config option;
  dirs_config: (fpath * ci_config) list option (** *);
  actions: action list
}

(** *)
type scan_config = {
  deployment_id: int;
  deployment_name: string;
  policy_names: string list (** *);
  rule_config: string (** *);
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool (** *);
  scan_all_deps_in_diff_scan: bool (** *);
  symbol_analysis: bool (** *);
  transitive_reachability_enabled: bool;
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list (** *);
  ignored_files: string list (** *);
  enabled_products: product list option (** *);
  actions: action list (** *);
  ci_config_from_cloud: ci_config_from_cloud option (** *)
}

type sarif_format = {
  rules: fpath (** *);
  is_pro: bool;
  show_dataflow_traces: bool
}

type engine_kind = [ `OSS | `PRO ] [@@deriving ord, show]

type rule_id_and_engine_kind = (rule_id * engine_kind)

(** *)
type resolved_subproject = {
  info: subproject;
  resolution_method: resolution_method (** *);
  ecosystem: ecosystem (** *);
  resolved_dependencies: (dependency_child * resolved_dependency list) list
    (** *);
  errors: sca_error list
}

type resolve_dependencies_params = {
  dependency_sources: dependency_source list;
  download_dependency_source_code: bool;
  allow_local_builds: bool (** *)
}

type resolution_result = [
    `ResolutionOk of (resolved_dependency list * resolution_error_kind list)
  | `ResolutionError of resolution_error_kind list
]

(** *)
type profiling_entry = {
  name: string;
  total_time: float (** *);
  count: int (** *)
}

type prefiltering_stats = {
  project_level_time: float (** *);
  file_level_time: float (** *);
  rules_with_project_prefilters_ratio: float (** *);
  rules_with_file_prefilters_ratio: float (** *);
  rules_selected_ratio: float (** *);
  rules_matched_ratio: float (** *)
}
  [@@deriving show]

(** *)
type parsing_time = {
  total_time: float;
  per_file_time: summary_stats;
  very_slow_stats: very_slow_stats option;
  very_slow_files: file_time list (** *)
}

(** *)
type file_rule_time = { fpath: fpath; rule_id: rule_id; time: float }
  [@@deriving show]

(** *)
type matching_time = {
  total_time: float;
  per_file_and_rule_time: summary_stats;
  very_slow_stats: very_slow_stats;
  very_slow_rules_on_files: file_rule_time list (** *)
}

(** *)
type profile = {
  rules: rule_id list (** *);
  rules_parse_time: float;
  profiling_times: (string * float) list (** *);
  parsing_time: parsing_time option (** *);
  scanning_time: scanning_time option (** *);
  matching_time: matching_time option (** *);
  tainting_time: tainting_time option (** *);
  fixpoint_timeouts: core_error list option (** *);
  prefiltering: prefiltering_stats option;
  targets: target_times list;
  total_bytes: int;
  max_memory_bytes: int option (** *)
}

type parsing_stats = {
  targets_parsed: int;
  num_targets: int;
  bytes_parsed: int;
  num_bytes: int
}

type finding_hashes = {
  start_line_hash: string;
  end_line_hash: string;
  code_hash: string (** *);
  pattern_hash: string (** *)
}

type finding = {
  check_id: rule_id;
  path: fpath;
  line: int;
  column: int;
  end_line: int;
  end_column: int;
  message: string;
  severity: Yojson.Safe.t (** *);
  index: int;
  commit_date: string;
  syntactic_id: string;
  match_based_id: string option (** *);
  hashes: finding_hashes option (** *);
  metadata: raw_json (** *);
  is_blocking: bool;
  fixed_lines: string list option;
  sca_info: sca_match option;
  dataflow_trace: match_dataflow_trace option (** *);
  validation_state: validation_state option (** *);
  historical_info: historical_info option (** *);
  engine_kind: engine_of_finding option (** *)
}

type error_span = {
  file: fpath (** *);
  start: position;
  end_ (*atd end *): position;
  source_hash: string option;
  config_start: position option option (** *);
  config_end: position option option;
  config_path: string list option option;
  context_start: position option option (** *);
  context_end: position option option
}

(** *)
type contributor = {
  commit_author_name: string;
  commit_author_email: string
}

type contribution = {
  commit_hash: string;
  commit_timestamp: datetime;
  contributor: contributor
}

(** *)
type contributions = contribution list

type cli_error = {
  code: int (** *);
  level: error_severity;
  type_: error_type (** *);
  rule_id: rule_id option;
  message: string option (** *);
  path: fpath option;
  long_msg: string option (** *);
  short_msg: string option;
  spans: error_span list option;
  help: string option
}

(** *)
type ci_scan_metadata = {
  scan_id: int;
  deployment_id: int;
  repository_id: int (** *);
  repository_ref_id: int (** *);
  enabled_products: product list;
  git_commit: sha1 option;
  git_ref: string option
}

type ci_scan_dependencies = (string * found_dependency list) list

type ci_scan_results = {
  findings: finding list;
  ignores: finding list;
  token: string option;
  searched_paths: fpath list;
  renamed_paths: fpath list;
  rule_ids: rule_id list;
  contributions: contributions option (** *);
  dependencies: ci_scan_dependencies option (** *);
  metadata: ci_scan_metadata option (** *)
}

(** *)
type ci_scan_failure = { exit_code: int; stderr: string }

type ci_scan_complete_stats = {
  findings: int;
  errors: cli_error list;
  total_time: float;
  unsupported_exts: (string * int) list;
  lockfile_scan_info: (string * int) list;
  parse_rate: (string * parsing_stats) list;
  engine_requested: string option (** *);
  findings_by_product: (string * int) list option (** *);
  supply_chain_stats: supply_chain_stats option (** *)
}

type ci_scan_complete = {
  exit_code: int;
  stats: ci_scan_complete_stats;
  dependencies: ci_scan_dependencies option (** *);
  dependency_parser_errors: dependency_parser_error list option (** *);
  task_id: string option (** *);
  final_attempt: bool option
}

(** *)
type partial_scan_result = [
    `PartialScanOk of (ci_scan_results * ci_scan_complete)
  | `PartialScanError of ci_scan_failure
]

type output_format = 
    Text
  | Json
  | Emacs
  | Vim
  | Sarif
  | Gitlab_sast
  | Gitlab_secrets
  | Junit_xml
  | Files_with_matches (** *)
  | Incremental (** *)

  [@@deriving show]

type mcp_scan_results = { rules: string list; total_bytes_scanned: int }

(** *)
type match_based_id = string [@@deriving show, eq]

(** *)
type has_features = {
  has_autofix: bool;
  has_deepsemgrep: bool;
  has_triage_via_comment: bool;
  has_dependency_query: bool
}

type apply_fixes_return = {
  modified_file_count: int (** *);
  fixed_lines: (int * string list) list (** *)
}

type function_return = [
    `RetError of string
  | `RetApplyFixes of apply_fixes_return
  | `RetContributions of contributions
  | `RetFormatter of string
  | `RetSarifFormat of string
  | `RetValidate of core_error option (** *)
  | `RetResolveDependencies of (dependency_source * resolution_result) list
  | `RetUploadSymbolAnalysis of string (** *)
  | `RetDumpRulePartitions of bool
  | `RetTransitiveReachabilityFilter of transitive_finding list
  | `RetGetTargets of target_discovery_result
  | `RetMatchSubprojects of subproject list
]

type function_result = {
  function_return: function_return;
  profiling_results: profiling_entry list
}

type format_context = {
  is_ci_invocation: bool;
  is_logged_in: bool;
  is_using_registry: bool
}
  [@@deriving show]

type edit = {
  path: fpath;
  start_offset: int;
  end_offset: int;
  replacement_text: string
}

type dump_rule_partitions_params = {
  rules: raw_json;
  n_partitions: int;
  output_dir: fpath;
  strategy: string option
}

(** *)
type cli_output_subproject_info = {
  dependency_sources: fpath list (** *);
  resolved: bool (** *);
  unresolved_reason: unresolved_reason option (** *);
  resolved_stats: dependency_resolution_stats option (** *)
}

type cli_output = {
  version: version option (** *);
  results: cli_match list;
  errors: cli_error list;
  paths: scanned_and_skipped (** *);
  time: profile option (** *);
  explanations: matching_explanation list option (** *);
  rules_by_engine: rule_id_and_engine_kind list option (** *);
  engine_requested: engine_kind option;
  interfile_languages_used: string list option (** *);
  skipped_rules: skipped_rule list (** *);
  subprojects: cli_output_subproject_info list option (** *);
  mcp_scan_results: mcp_scan_results option (** *);
  profiling_results: profiling_entry list (** *)
}

type apply_fixes_params = { dryrun: bool; edits: edit list }

type function_call = [
    `CallContributions
  | `CallApplyFixes of apply_fixes_params
  | `CallFormatter of (output_format * format_context * cli_output)
  | `CallSarifFormat of (sarif_format * format_context * cli_output) (** *)
  | `CallValidate of fpath (** *)
  | `CallResolveDependencies of resolve_dependencies_params
  | `CallUploadSymbolAnalysis of (string * int * symbol_analysis)
  | `CallDumpRulePartitions of dump_rule_partitions_params
  | `CallGetTargets of scanning_roots
  | `CallTransitiveReachabilityFilter
      of transitive_reachability_filter_params
      (** *)
  | `CallMatchSubprojects of fpath list
]

type features = {
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool (** *);
  scan_all_deps_in_diff_scan: bool (** *);
  symbol_analysis: bool (** *);
  transitive_reachability_enabled: bool
}

(** *)
type diff_file = {
  filename: fpath;
  diffs: string list (** *);
  url: string (** *)
}
  [@@deriving show]

type diff_files = { cve_diffs: diff_file list } [@@deriving show]

(** *)
type deployment_config = {
  id: int;
  name: string (** *);
  organization_id: int;
  display_name: string (** *);
  scm_name: string;
  slug: string;
  source_type: string (** *);
  default_user_role: string (** *);
  has_autofix: bool;
  has_deepsemgrep: bool;
  has_triage_via_comment: bool;
  has_dependency_query: bool
}
  [@@deriving show]

type deployment_response = { deployment: deployment_config }

(** *)
type core_output_extra = { symbol_analysis: symbol_analysis option (** *) }

type core_output = {
  version: version;
  results: core_match list;
  errors: core_error list (** *);
  paths: scanned_and_skipped (** *);
  time: profile option (** *);
  explanations: matching_explanation list option (** *);
  rules_by_engine: rule_id_and_engine_kind list option (** *);
  engine_requested: engine_kind option;
  interfile_languages_used: string list option (** *);
  skipped_rules: skipped_rule list (** *);
  subprojects: cli_output_subproject_info list option (** *);
  mcp_scan_results: mcp_scan_results option (** *);
  profiling_results: profiling_entry list (** *);
  symbol_analysis: symbol_analysis option (** *)
}

type cli_output_extra = {
  paths: scanned_and_skipped (** *);
  time: profile option (** *);
  explanations: matching_explanation list option (** *);
  rules_by_engine: rule_id_and_engine_kind list option (** *);
  engine_requested: engine_kind option;
  interfile_languages_used: string list option (** *);
  skipped_rules: skipped_rule list (** *);
  subprojects: cli_output_subproject_info list option (** *);
  mcp_scan_results: mcp_scan_results option (** *);
  profiling_results: profiling_entry list (** *)
}

type ci_scan_results_response_error = { message: string } [@@deriving show]

(** *)
type ci_scan_results_response = {
  errors: ci_scan_results_response_error list;
  task_id: string option
}
  [@@deriving show]

(** *)
type ci_scan_complete_response = {
  success: bool;
  app_block_override: bool;
  app_block_reason: string (** *);
  app_blocking_match_based_ids: match_based_id list (** *)
}
  [@@deriving show]
