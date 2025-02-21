(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type datetime = Semgrep_output_v1_t.datetime

type dependency_child = Semgrep_output_v1_t.dependency_child = {
  package: string;
  version: string
}

type ecosystem = Semgrep_output_v1_t.ecosystem [@@deriving show,eq]

type fpath = Semgrep_output_v1_t.fpath [@@deriving show, eq]

type lockfile_kind = Semgrep_output_v1_t.lockfile_kind = 
    PipRequirementsTxt | PoetryLock | PipfileLock | UvLock
  | NpmPackageLockJson | YarnLock | PnpmLock | GemfileLock | GoMod
  | CargoLock | MavenDepTree | GradleLockfile | ComposerLock
  | NugetPackagesLockJson | PubspecLock | SwiftPackageResolved | PodfileLock
  | MixLock | ConanLock

  [@@deriving show, eq, yojson]

type lockfile = Semgrep_output_v1_t.lockfile = {
  kind: lockfile_kind;
  path: fpath
}
  [@@deriving show, eq]

type manifest_kind = Semgrep_output_v1_t.manifest_kind [@@deriving show, eq]

type manifest = Semgrep_output_v1_t.manifest = {
  kind: manifest_kind;
  path: fpath
}
  [@@deriving show, eq]

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

type loc_and_content = Semgrep_output_v1_t.loc_and_content

type match_intermediate_var = Semgrep_output_v1_t.match_intermediate_var = {
  location: location;
  content: string
}

type pro_feature = Semgrep_output_v1_t.pro_feature = {
  interproc_taint: bool;
  interfile_taint: bool;
  proprietary_language: bool
}
  [@@deriving show]

type engine_of_finding = Semgrep_output_v1_t.engine_of_finding
  [@@deriving show]

type raw_json = Yojson.Basic.t

type rule_id = Semgrep_output_v1_t.rule_id [@@deriving show]

type sca_pattern = Semgrep_output_v1_t.sca_pattern = {
  ecosystem: ecosystem;
  package: string;
  semver_range: string
}

type sha1 = Semgrep_output_v1_t.sha1

type historical_info = Semgrep_output_v1_t.historical_info = {
  git_commit: sha1;
  git_blob: sha1 option;
  git_commit_timestamp: datetime
}

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

type transitive_reachable = Semgrep_output_v1_t.transitive_reachable = {
  explanation: string option;
  callgraph_reachable: bool option
}

type transitive_unreachable = Semgrep_output_v1_t.transitive_unreachable = {
  explanation: string option
}

type transitivity = Semgrep_output_v1_t.transitivity [@@deriving show,eq]

type found_dependency = Semgrep_output_v1_t.found_dependency = {
  package: string;
  version: string;
  ecosystem: ecosystem;
  allowed_hashes: (string * string list) list;
  resolved_url: string option;
  transitivity: transitivity;
  manifest_path: fpath option;
  lockfile_path: fpath option;
  line_number: int option;
  children: dependency_child list option;
  git_ref: string option
}

type dependency_match = Semgrep_output_v1_t.dependency_match = {
  dependency_pattern: sca_pattern;
  found_dependency: found_dependency;
  lockfile: fpath
}

type sca_match_kind = Semgrep_output_v1_t.sca_match_kind = 
    LockfileOnlyMatch of transitivity
  | DirectReachable
  | DirectUnreachable
  | TransitiveReachable of transitive_reachable
  | TransitiveUnreachable of transitive_unreachable
  | TransitiveUndetermined


type sca_match = Semgrep_output_v1_t.sca_match = {
  reachability_rule: bool;
  sca_finding_schema: int;
  dependency_match: dependency_match;
  reachable: bool;
  kind: sca_match_kind option
}

type validation_state = Semgrep_output_v1_t.validation_state
  [@@deriving show, eq]

type dependency_source = Semgrep_output_v1_t.dependency_source = 
    ManifestOnlyDependencySource of manifest
  | LockfileOnlyDependencySource of lockfile
  | ManifestLockfileDependencySource of (manifest * lockfile)
  | MultiLockfileDependencySource of dependency_source list

  [@@deriving show]

type match_call_trace = Semgrep_output_v1_t.match_call_trace = 
    CliLoc of loc_and_content
  | CliCall
      of (loc_and_content * match_intermediate_var list * match_call_trace)


type match_dataflow_trace = Semgrep_output_v1_t.match_dataflow_trace = {
  taint_source: match_call_trace option;
  intermediate_vars: match_intermediate_var list option;
  taint_sink: match_call_trace option
}

type core_match_extra = Semgrep_output_v1_t.core_match_extra = {
  metavars: metavars;
  engine_kind: engine_of_finding;
  is_ignored: bool;
  message: string option;
  metadata: raw_json option;
  severity: match_severity option;
  fix: string option;
  dataflow_trace: match_dataflow_trace option;
  sca_match: sca_match option;
  validation_state: validation_state option;
  historical_info: historical_info option;
  extra_extra: raw_json option
}

type core_match = Semgrep_output_v1_t.core_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: core_match_extra
}

type matching_explanation_extra =
  Semgrep_output_v1_t.matching_explanation_extra = {
  before_negation_matches: core_match list option;
  before_filter_matches: core_match list option
}

type matching_explanation = Semgrep_output_v1_t.matching_explanation = {
  op: matching_operation;
  children: matching_explanation list;
  matches: core_match list;
  loc: location;
  extra: matching_explanation_extra option
}

type version = Semgrep_output_v1_t.version [@@deriving show]

type uuid = Semgrep_output_v1_t.uuid

type uri = Semgrep_output_v1_t.uri

type unresolved_reason = Semgrep_output_v1_t.unresolved_reason = 
    UnresolvedFailed | UnresolvedSkipped | UnresolvedUnsupported


type subproject = Semgrep_output_v1_t.subproject = {
  root_dir: fpath;
  ecosystem: ecosystem option;
  dependency_source: dependency_source
}

type sca_parser_name = Semgrep_output_v1_t.sca_parser_name = 
    PGemfile_lock | PGo_mod | PGo_sum | PGradle_lockfile | PGradle_build
  | PJsondoc | PPipfile | PPnpm_lock | PPoetry_lock | PPyproject_toml
  | PRequirements | PYarn_1 | PYarn_2 | PPomtree | PCargo_parser
  | PComposer_lock | PPubspec_lock | PPackage_swift | PPodfile_lock
  | PPackage_resolved | PMix_lock

  [@@deriving show]

type resolution_cmd_failed = Semgrep_output_v1_t.resolution_cmd_failed = {
  command: string;
  message: string
}
  [@@deriving show]

type resolution_error_kind = Semgrep_output_v1_t.resolution_error_kind = 
    UnsupportedManifest
  | MissingRequirement of string
  | ResolutionCmdFailed of resolution_cmd_failed
  | ParseDependenciesFailed of string
  | ScaParseError of sca_parser_name

  [@@deriving show]

type sca_resolution_error = Semgrep_output_v1_t.sca_resolution_error = {
  type_: resolution_error_kind;
  dependency_source_file: fpath
}

type dependency_parser_error = Semgrep_output_v1_t.dependency_parser_error = {
  path: fpath;
  parser: sca_parser_name;
  reason: string;
  line: int option;
  col: int option;
  text: string option
}

type sca_error = Semgrep_output_v1_t.sca_error = 
    SCAParse of dependency_parser_error
  | SCAResol of sca_resolution_error


type unresolved_subproject = Semgrep_output_v1_t.unresolved_subproject = {
  info: subproject;
  reason: unresolved_reason;
  errors: sca_error list
}

type snippet = Semgrep_output_v1_t.snippet = { line: int; text: string }

type killing_parent_kind = Semgrep_output_v1_t.killing_parent_kind

type killing_parent = Semgrep_output_v1_t.killing_parent = {
  killing_parent_kind: killing_parent_kind;
  snippet: snippet
}

type unexpected_no_match_diagnosis_kind =
  Semgrep_output_v1_t.unexpected_no_match_diagnosis_kind

type unexpected_no_match_diagnosis =
  Semgrep_output_v1_t.unexpected_no_match_diagnosis = {
  line: int;
  kind: unexpected_no_match_diagnosis_kind
}

type originating_node_kind = Semgrep_output_v1_t.originating_node_kind

type unexpected_match_diagnosis =
  Semgrep_output_v1_t.unexpected_match_diagnosis = {
  matched_text: snippet;
  originating_kind: originating_node_kind;
  originating_text: snippet;
  killing_parents: killing_parent list
}

type triage_ignored = Semgrep_output_v1_t.triage_ignored = {
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list
}

type transitive_finding = Semgrep_output_v1_t.transitive_finding = {
  m: core_match
}

type todo = Semgrep_output_v1_t.todo

type matching_diagnosis = Semgrep_output_v1_t.matching_diagnosis = {
  target: fpath;
  unexpected_match_diagnoses: unexpected_match_diagnosis list;
  unexpected_no_match_diagnoses: unexpected_no_match_diagnosis list
}

type expected_reported = Semgrep_output_v1_t.expected_reported = {
  expected_lines: int list;
  reported_lines: int list
}

type rule_result = Semgrep_output_v1_t.rule_result = {
  passed: bool;
  matches: (string * expected_reported) list;
  errors: todo list;
  diagnosis: matching_diagnosis option
}

type fixtest_result = Semgrep_output_v1_t.fixtest_result = { passed: bool }

type config_error_reason = Semgrep_output_v1_t.config_error_reason = 
  UnparsableRule


type config_error = Semgrep_output_v1_t.config_error = {
  file: fpath;
  reason: config_error_reason
}

type checks = Semgrep_output_v1_t.checks = {
  checks: (string * rule_result) list
}

type tests_result = Semgrep_output_v1_t.tests_result = {
  results: (string * checks) list;
  fixtest_results: (string * fixtest_result) list;
  config_missing_tests: fpath list;
  config_missing_fixtests: fpath list;
  config_with_errors: config_error list
}

type project_root = Semgrep_output_v1_t.project_root [@@deriving show]

type targeting_conf = Semgrep_output_v1_t.targeting_conf = {
  exclude: string list;
  include_: string list option;
  max_target_bytes: int;
  respect_gitignore: bool;
  respect_semgrepignore_files: bool;
  always_select_explicit_targets: bool;
  explicit_targets: string list;
  force_project_root: project_root option;
  force_novcs_project: bool;
  exclude_minified_files: bool;
  baseline_commit: string option;
  diff_depth: int
}
  [@@deriving show]

type product = Semgrep_output_v1_t.product [@@deriving show, eq]

type analyzer = Semgrep_output_v1_t.analyzer [@@deriving show]

type code_target = Semgrep_output_v1_t.code_target = {
  path: fpath;
  analyzer: analyzer;
  products: product list;
  lockfile_target: lockfile option
}
  [@@deriving show]

type target = Semgrep_output_v1_t.target [@@deriving show]

type scanning_roots = Semgrep_output_v1_t.scanning_roots = {
  root_paths: fpath list;
  targeting_conf: targeting_conf
}
  [@@deriving show]

type targets = Semgrep_output_v1_t.targets [@@deriving show]

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
  | Nonexistent_file | Insufficient_permissions

  [@@deriving show]

type skipped_target = Semgrep_output_v1_t.skipped_target = {
  path: fpath;
  reason: skip_reason;
  details: string option;
  rule_id: rule_id option
}
  [@@deriving show]

type incompatible_rule = Semgrep_output_v1_t.incompatible_rule = {
  rule_id: rule_id;
  this_version: version;
  min_version: version option;
  max_version: version option
}
  [@@deriving show]

type error_type = Semgrep_output_v1_t.error_type = 
    LexicalError
  | ParseError
  | OtherParseError
  | AstBuilderError
  | RuleParseError
  | SemgrepWarning
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
  | StackOverflow
  | TimeoutDuringInterfile
  | OutOfMemoryDuringInterfile
  | MissingPlugin
  | PatternParseError of string list
  | PartialParsing of location list
  | IncompatibleRule of incompatible_rule
  | PatternParseError0
  | IncompatibleRule0
  | DependencyResolutionError of resolution_error_kind

  [@@deriving show]

type error_severity = Semgrep_output_v1_t.error_severity
  [@@deriving show, eq]

type core_error = Semgrep_output_v1_t.core_error = {
  error_type: error_type;
  severity: error_severity;
  message: string;
  details: string option;
  location: location option;
  rule_id: rule_id option
}

type target_discovery_result = Semgrep_output_v1_t.target_discovery_result = {
  target_paths: fpath list;
  errors: core_error list;
  skipped: skipped_target list
}

type tag = Semgrep_output_v1_t.tag

type symbol = Semgrep_output_v1_t.symbol = { fqn: string list }
  [@@deriving show]

type symbol_usage = Semgrep_output_v1_t.symbol_usage = {
  symbol: symbol;
  locs: location list
}
  [@@deriving show]

type symbol_analysis = Semgrep_output_v1_t.symbol_analysis [@@deriving show]

type resolution_method = Semgrep_output_v1_t.resolution_method
  [@@deriving show]

type dependency_source_file_kind =
  Semgrep_output_v1_t.dependency_source_file_kind
  [@@deriving show]

type dependency_source_file = Semgrep_output_v1_t.dependency_source_file = {
  kind: dependency_source_file_kind;
  path: fpath
}

type dependency_resolution_stats =
  Semgrep_output_v1_t.dependency_resolution_stats = {
  resolution_method: resolution_method;
  dependency_count: int;
  ecosystem: ecosystem
}

type subproject_stats = Semgrep_output_v1_t.subproject_stats = {
  subproject_id: string;
  dependency_sources: dependency_source_file list;
  resolved_stats: dependency_resolution_stats option
}

type supply_chain_stats = Semgrep_output_v1_t.supply_chain_stats = {
  subprojects_stats: subproject_stats list
}

type skipped_rule = Semgrep_output_v1_t.skipped_rule = {
  rule_id: rule_id;
  details: string;
  position: position
}

type scanned_and_skipped = Semgrep_output_v1_t.scanned_and_skipped = {
  scanned: fpath list;
  skipped: skipped_target list option
}

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

type glob = Semgrep_output_v1_t.glob

type product_ignored_files = Semgrep_output_v1_t.product_ignored_files

type historical_configuration =
  Semgrep_output_v1_t.historical_configuration = {
  enabled: bool;
  lookback_days: int option
}

type engine_configuration = Semgrep_output_v1_t.engine_configuration = {
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool;
  scan_all_deps_in_diff_scan: bool;
  symbol_analysis: bool;
  ignored_files: string list;
  product_ignored_files: product_ignored_files option;
  generic_slow_rollout: bool;
  historical_config: historical_configuration option;
  always_suppress_errors: bool
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
  dry_run: bool;
  sms_scan_id: string option
}

type project_metadata = Semgrep_output_v1_t.project_metadata = {
  scan_environment: string;
  repository: string;
  repo_url: uri option;
  repo_id: string option;
  org_id: string option;
  repo_display_name: string option;
  branch: string option;
  commit: sha1 option;
  commit_title: string option;
  commit_timestamp: datetime option;
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
  project_metadata: project_metadata;
  scan_metadata: scan_metadata;
  project_config: ci_config_from_repo option
}

type ci_env = Semgrep_output_v1_t.ci_env

type ci_config = Semgrep_output_v1_t.ci_config = {
  env: ci_env;
  enabled_products: product list;
  ignored_files: string list;
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool;
  scan_all_deps_in_diff_scan: bool;
  symbol_analysis: bool
}

type action = Semgrep_output_v1_t.action

type ci_config_from_cloud = Semgrep_output_v1_t.ci_config_from_cloud = {
  repo_config: ci_config;
  org_config: ci_config option;
  dirs_config: (fpath * ci_config) list option;
  actions: action list
}

type scan_config = Semgrep_output_v1_t.scan_config = {
  deployment_id: int;
  deployment_name: string;
  policy_names: string list;
  rule_config: string;
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool;
  scan_all_deps_in_diff_scan: bool;
  symbol_analysis: bool;
  triage_ignored_syntactic_ids: string list;
  triage_ignored_match_based_ids: string list;
  ignored_files: string list;
  enabled_products: product list option;
  actions: action list;
  ci_config_from_cloud: ci_config_from_cloud option
}

type sarif_format = Semgrep_output_v1_t.sarif_format = {
  rules: fpath;
  is_pro: bool;
  show_dataflow_traces: bool
}

type engine_kind = Semgrep_output_v1_t.engine_kind [@@deriving show]

type rule_id_and_engine_kind = Semgrep_output_v1_t.rule_id_and_engine_kind

type downloaded_dependency = Semgrep_output_v1_t.downloaded_dependency = {
  source_path: fpath
}

type resolved_dependency = Semgrep_output_v1_t.resolved_dependency

type resolved_subproject = Semgrep_output_v1_t.resolved_subproject = {
  info: subproject;
  resolution_method: resolution_method;
  ecosystem: ecosystem;
  resolved_dependencies: (dependency_child * resolved_dependency list) list;
  errors: sca_error list
}

type resolution_result = Semgrep_output_v1_t.resolution_result

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
  sca_info: sca_match option;
  dataflow_trace: match_dataflow_trace option;
  validation_state: validation_state option;
  historical_info: historical_info option;
  engine_kind: engine_of_finding option
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

type contributor = Semgrep_output_v1_t.contributor = {
  commit_author_name: string;
  commit_author_email: string
}

type contribution = Semgrep_output_v1_t.contribution = {
  commit_hash: string;
  commit_timestamp: datetime;
  contributor: contributor
}

type contributions = Semgrep_output_v1_t.contributions

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
  engine_requested: string option;
  findings_by_product: (string * int) list option;
  supply_chain_stats: supply_chain_stats option
}

type ci_scan_complete = Semgrep_output_v1_t.ci_scan_complete = {
  exit_code: int;
  stats: ci_scan_complete_stats;
  dependencies: ci_scan_dependencies option;
  dependency_parser_errors: dependency_parser_error list option;
  task_id: string option;
  final_attempt: bool option
}

type partial_scan_result = Semgrep_output_v1_t.partial_scan_result

type output_format = Semgrep_output_v1_t.output_format = 
    Text | Json | Emacs | Vim | Sarif | Gitlab_sast | Gitlab_secrets
  | Junit_xml | Files_with_matches | Incremental

  [@@deriving show]

type match_based_id = Semgrep_output_v1_t.match_based_id
  [@@deriving show, eq]

type has_features = Semgrep_output_v1_t.has_features = {
  has_autofix: bool;
  has_deepsemgrep: bool;
  has_triage_via_comment: bool;
  has_dependency_query: bool
}

type apply_fixes_return = Semgrep_output_v1_t.apply_fixes_return = {
  modified_file_count: int;
  fixed_lines: (int * string list) list
}

type function_return = Semgrep_output_v1_t.function_return

type format_context = Semgrep_output_v1_t.format_context = {
  is_ci_invocation: bool;
  is_logged_in: bool;
  is_using_registry: bool
}
  [@@deriving show]

type edit = Semgrep_output_v1_t.edit = {
  path: fpath;
  start_offset: int;
  end_offset: int;
  replacement_text: string
}

type dump_rule_partitions_params =
  Semgrep_output_v1_t.dump_rule_partitions_params = {
  rules: raw_json;
  n_partitions: int;
  output_dir: fpath
}

type cli_match_extra = Semgrep_output_v1_t.cli_match_extra = {
  metavars: metavars option;
  message: string;
  fix: string option;
  fixed_lines: string list option;
  metadata: raw_json;
  severity: match_severity;
  fingerprint: string;
  lines: string;
  is_ignored: bool option;
  sca_info: sca_match option;
  validation_state: validation_state option;
  historical_info: historical_info option;
  dataflow_trace: match_dataflow_trace option;
  engine_kind: engine_of_finding option;
  extra_extra: raw_json option
}

type cli_match = Semgrep_output_v1_t.cli_match = {
  check_id: rule_id;
  path: fpath;
  start: position;
  end_ (*atd end *): position;
  extra: cli_match_extra
}

type cli_output = Semgrep_output_v1_t.cli_output = {
  version: version option;
  results: cli_match list;
  errors: cli_error list;
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  interfile_languages_used: string list option;
  skipped_rules: skipped_rule list
}

type apply_fixes_params = Semgrep_output_v1_t.apply_fixes_params = {
  dryrun: bool;
  edits: edit list
}

type function_call = Semgrep_output_v1_t.function_call

type features = Semgrep_output_v1_t.features = {
  autofix: bool;
  deepsemgrep: bool;
  dependency_query: bool;
  path_to_transitivity: bool;
  scan_all_deps_in_diff_scan: bool;
  symbol_analysis: bool
}

type diff_file = Semgrep_output_v1_t.diff_file = {
  filename: fpath;
  diffs: string list;
  url: string
}
  [@@deriving show]

type diff_files = Semgrep_output_v1_t.diff_files = {
  cve_diffs: diff_file list
}
  [@@deriving show]

type deployment_config = Semgrep_output_v1_t.deployment_config = {
  id: int;
  name: string;
  organization_id: int;
  display_name: string;
  scm_name: string;
  slug: string;
  source_type: string;
  default_user_role: string;
  has_autofix: bool;
  has_deepsemgrep: bool;
  has_triage_via_comment: bool;
  has_dependency_query: bool
}
  [@@deriving show]

type deployment_response = Semgrep_output_v1_t.deployment_response = {
  deployment: deployment_config
}

type core_output_extra = Semgrep_output_v1_t.core_output_extra = {
  symbol_analysis: symbol_analysis option
}

type core_output = Semgrep_output_v1_t.core_output = {
  version: version;
  results: core_match list;
  errors: core_error list;
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  interfile_languages_used: string list option;
  skipped_rules: skipped_rule list;
  symbol_analysis: symbol_analysis option
}

type cli_output_extra = Semgrep_output_v1_t.cli_output_extra = {
  paths: scanned_and_skipped;
  time: profile option;
  explanations: matching_explanation list option;
  rules_by_engine: rule_id_and_engine_kind list option;
  engine_requested: engine_kind option;
  interfile_languages_used: string list option;
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

type ci_scan_complete_response =
  Semgrep_output_v1_t.ci_scan_complete_response = {
  success: bool;
  app_block_override: bool;
  app_block_reason: string;
  app_blocking_match_based_ids: match_based_id list
}
  [@@deriving show]

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

val write_lockfile_kind :
  Buffer.t -> lockfile_kind -> unit
  (** Output a JSON value of type {!type:lockfile_kind}. *)

val string_of_lockfile_kind :
  ?len:int -> lockfile_kind -> string
  (** Serialize a value of type {!type:lockfile_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_lockfile_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> lockfile_kind
  (** Input JSON data of type {!type:lockfile_kind}. *)

val lockfile_kind_of_string :
  string -> lockfile_kind
  (** Deserialize JSON data of type {!type:lockfile_kind}. *)

val write_lockfile :
  Buffer.t -> lockfile -> unit
  (** Output a JSON value of type {!type:lockfile}. *)

val string_of_lockfile :
  ?len:int -> lockfile -> string
  (** Serialize a value of type {!type:lockfile}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_lockfile :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> lockfile
  (** Input JSON data of type {!type:lockfile}. *)

val lockfile_of_string :
  string -> lockfile
  (** Deserialize JSON data of type {!type:lockfile}. *)

val write_manifest_kind :
  Buffer.t -> manifest_kind -> unit
  (** Output a JSON value of type {!type:manifest_kind}. *)

val string_of_manifest_kind :
  ?len:int -> manifest_kind -> string
  (** Serialize a value of type {!type:manifest_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_manifest_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> manifest_kind
  (** Input JSON data of type {!type:manifest_kind}. *)

val manifest_kind_of_string :
  string -> manifest_kind
  (** Deserialize JSON data of type {!type:manifest_kind}. *)

val write_manifest :
  Buffer.t -> manifest -> unit
  (** Output a JSON value of type {!type:manifest}. *)

val string_of_manifest :
  ?len:int -> manifest -> string
  (** Serialize a value of type {!type:manifest}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_manifest :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> manifest
  (** Input JSON data of type {!type:manifest}. *)

val manifest_of_string :
  string -> manifest
  (** Deserialize JSON data of type {!type:manifest}. *)

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

val write_loc_and_content :
  Buffer.t -> loc_and_content -> unit
  (** Output a JSON value of type {!type:loc_and_content}. *)

val string_of_loc_and_content :
  ?len:int -> loc_and_content -> string
  (** Serialize a value of type {!type:loc_and_content}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_loc_and_content :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> loc_and_content
  (** Input JSON data of type {!type:loc_and_content}. *)

val loc_and_content_of_string :
  string -> loc_and_content
  (** Deserialize JSON data of type {!type:loc_and_content}. *)

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

val write_pro_feature :
  Buffer.t -> pro_feature -> unit
  (** Output a JSON value of type {!type:pro_feature}. *)

val string_of_pro_feature :
  ?len:int -> pro_feature -> string
  (** Serialize a value of type {!type:pro_feature}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_pro_feature :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> pro_feature
  (** Input JSON data of type {!type:pro_feature}. *)

val pro_feature_of_string :
  string -> pro_feature
  (** Deserialize JSON data of type {!type:pro_feature}. *)

val write_engine_of_finding :
  Buffer.t -> engine_of_finding -> unit
  (** Output a JSON value of type {!type:engine_of_finding}. *)

val string_of_engine_of_finding :
  ?len:int -> engine_of_finding -> string
  (** Serialize a value of type {!type:engine_of_finding}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_engine_of_finding :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> engine_of_finding
  (** Input JSON data of type {!type:engine_of_finding}. *)

val engine_of_finding_of_string :
  string -> engine_of_finding
  (** Deserialize JSON data of type {!type:engine_of_finding}. *)

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

val write_sca_pattern :
  Buffer.t -> sca_pattern -> unit
  (** Output a JSON value of type {!type:sca_pattern}. *)

val string_of_sca_pattern :
  ?len:int -> sca_pattern -> string
  (** Serialize a value of type {!type:sca_pattern}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_pattern :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_pattern
  (** Input JSON data of type {!type:sca_pattern}. *)

val sca_pattern_of_string :
  string -> sca_pattern
  (** Deserialize JSON data of type {!type:sca_pattern}. *)

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

val write_historical_info :
  Buffer.t -> historical_info -> unit
  (** Output a JSON value of type {!type:historical_info}. *)

val string_of_historical_info :
  ?len:int -> historical_info -> string
  (** Serialize a value of type {!type:historical_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_historical_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> historical_info
  (** Input JSON data of type {!type:historical_info}. *)

val historical_info_of_string :
  string -> historical_info
  (** Deserialize JSON data of type {!type:historical_info}. *)

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

val write_transitive_reachable :
  Buffer.t -> transitive_reachable -> unit
  (** Output a JSON value of type {!type:transitive_reachable}. *)

val string_of_transitive_reachable :
  ?len:int -> transitive_reachable -> string
  (** Serialize a value of type {!type:transitive_reachable}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transitive_reachable :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transitive_reachable
  (** Input JSON data of type {!type:transitive_reachable}. *)

val transitive_reachable_of_string :
  string -> transitive_reachable
  (** Deserialize JSON data of type {!type:transitive_reachable}. *)

val write_transitive_unreachable :
  Buffer.t -> transitive_unreachable -> unit
  (** Output a JSON value of type {!type:transitive_unreachable}. *)

val string_of_transitive_unreachable :
  ?len:int -> transitive_unreachable -> string
  (** Serialize a value of type {!type:transitive_unreachable}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transitive_unreachable :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transitive_unreachable
  (** Input JSON data of type {!type:transitive_unreachable}. *)

val transitive_unreachable_of_string :
  string -> transitive_unreachable
  (** Deserialize JSON data of type {!type:transitive_unreachable}. *)

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

val write_sca_match_kind :
  Buffer.t -> sca_match_kind -> unit
  (** Output a JSON value of type {!type:sca_match_kind}. *)

val string_of_sca_match_kind :
  ?len:int -> sca_match_kind -> string
  (** Serialize a value of type {!type:sca_match_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_match_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_match_kind
  (** Input JSON data of type {!type:sca_match_kind}. *)

val sca_match_kind_of_string :
  string -> sca_match_kind
  (** Deserialize JSON data of type {!type:sca_match_kind}. *)

val write_sca_match :
  Buffer.t -> sca_match -> unit
  (** Output a JSON value of type {!type:sca_match}. *)

val string_of_sca_match :
  ?len:int -> sca_match -> string
  (** Serialize a value of type {!type:sca_match}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_match :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_match
  (** Input JSON data of type {!type:sca_match}. *)

val sca_match_of_string :
  string -> sca_match
  (** Deserialize JSON data of type {!type:sca_match}. *)

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

val write_dependency_source :
  Buffer.t -> dependency_source -> unit
  (** Output a JSON value of type {!type:dependency_source}. *)

val string_of_dependency_source :
  ?len:int -> dependency_source -> string
  (** Serialize a value of type {!type:dependency_source}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_source :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_source
  (** Input JSON data of type {!type:dependency_source}. *)

val dependency_source_of_string :
  string -> dependency_source
  (** Deserialize JSON data of type {!type:dependency_source}. *)

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

val write_matching_explanation_extra :
  Buffer.t -> matching_explanation_extra -> unit
  (** Output a JSON value of type {!type:matching_explanation_extra}. *)

val string_of_matching_explanation_extra :
  ?len:int -> matching_explanation_extra -> string
  (** Serialize a value of type {!type:matching_explanation_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_matching_explanation_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> matching_explanation_extra
  (** Input JSON data of type {!type:matching_explanation_extra}. *)

val matching_explanation_extra_of_string :
  string -> matching_explanation_extra
  (** Deserialize JSON data of type {!type:matching_explanation_extra}. *)

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

val write_unresolved_reason :
  Buffer.t -> unresolved_reason -> unit
  (** Output a JSON value of type {!type:unresolved_reason}. *)

val string_of_unresolved_reason :
  ?len:int -> unresolved_reason -> string
  (** Serialize a value of type {!type:unresolved_reason}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unresolved_reason :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unresolved_reason
  (** Input JSON data of type {!type:unresolved_reason}. *)

val unresolved_reason_of_string :
  string -> unresolved_reason
  (** Deserialize JSON data of type {!type:unresolved_reason}. *)

val write_subproject :
  Buffer.t -> subproject -> unit
  (** Output a JSON value of type {!type:subproject}. *)

val string_of_subproject :
  ?len:int -> subproject -> string
  (** Serialize a value of type {!type:subproject}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_subproject :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> subproject
  (** Input JSON data of type {!type:subproject}. *)

val subproject_of_string :
  string -> subproject
  (** Deserialize JSON data of type {!type:subproject}. *)

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

val write_resolution_cmd_failed :
  Buffer.t -> resolution_cmd_failed -> unit
  (** Output a JSON value of type {!type:resolution_cmd_failed}. *)

val string_of_resolution_cmd_failed :
  ?len:int -> resolution_cmd_failed -> string
  (** Serialize a value of type {!type:resolution_cmd_failed}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolution_cmd_failed :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolution_cmd_failed
  (** Input JSON data of type {!type:resolution_cmd_failed}. *)

val resolution_cmd_failed_of_string :
  string -> resolution_cmd_failed
  (** Deserialize JSON data of type {!type:resolution_cmd_failed}. *)

val write_resolution_error_kind :
  Buffer.t -> resolution_error_kind -> unit
  (** Output a JSON value of type {!type:resolution_error_kind}. *)

val string_of_resolution_error_kind :
  ?len:int -> resolution_error_kind -> string
  (** Serialize a value of type {!type:resolution_error_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolution_error_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolution_error_kind
  (** Input JSON data of type {!type:resolution_error_kind}. *)

val resolution_error_kind_of_string :
  string -> resolution_error_kind
  (** Deserialize JSON data of type {!type:resolution_error_kind}. *)

val write_sca_resolution_error :
  Buffer.t -> sca_resolution_error -> unit
  (** Output a JSON value of type {!type:sca_resolution_error}. *)

val string_of_sca_resolution_error :
  ?len:int -> sca_resolution_error -> string
  (** Serialize a value of type {!type:sca_resolution_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_resolution_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_resolution_error
  (** Input JSON data of type {!type:sca_resolution_error}. *)

val sca_resolution_error_of_string :
  string -> sca_resolution_error
  (** Deserialize JSON data of type {!type:sca_resolution_error}. *)

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

val write_sca_error :
  Buffer.t -> sca_error -> unit
  (** Output a JSON value of type {!type:sca_error}. *)

val string_of_sca_error :
  ?len:int -> sca_error -> string
  (** Serialize a value of type {!type:sca_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sca_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sca_error
  (** Input JSON data of type {!type:sca_error}. *)

val sca_error_of_string :
  string -> sca_error
  (** Deserialize JSON data of type {!type:sca_error}. *)

val write_unresolved_subproject :
  Buffer.t -> unresolved_subproject -> unit
  (** Output a JSON value of type {!type:unresolved_subproject}. *)

val string_of_unresolved_subproject :
  ?len:int -> unresolved_subproject -> string
  (** Serialize a value of type {!type:unresolved_subproject}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unresolved_subproject :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unresolved_subproject
  (** Input JSON data of type {!type:unresolved_subproject}. *)

val unresolved_subproject_of_string :
  string -> unresolved_subproject
  (** Deserialize JSON data of type {!type:unresolved_subproject}. *)

val write_snippet :
  Buffer.t -> snippet -> unit
  (** Output a JSON value of type {!type:snippet}. *)

val string_of_snippet :
  ?len:int -> snippet -> string
  (** Serialize a value of type {!type:snippet}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_snippet :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> snippet
  (** Input JSON data of type {!type:snippet}. *)

val snippet_of_string :
  string -> snippet
  (** Deserialize JSON data of type {!type:snippet}. *)

val write_killing_parent_kind :
  Buffer.t -> killing_parent_kind -> unit
  (** Output a JSON value of type {!type:killing_parent_kind}. *)

val string_of_killing_parent_kind :
  ?len:int -> killing_parent_kind -> string
  (** Serialize a value of type {!type:killing_parent_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_killing_parent_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> killing_parent_kind
  (** Input JSON data of type {!type:killing_parent_kind}. *)

val killing_parent_kind_of_string :
  string -> killing_parent_kind
  (** Deserialize JSON data of type {!type:killing_parent_kind}. *)

val write_killing_parent :
  Buffer.t -> killing_parent -> unit
  (** Output a JSON value of type {!type:killing_parent}. *)

val string_of_killing_parent :
  ?len:int -> killing_parent -> string
  (** Serialize a value of type {!type:killing_parent}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_killing_parent :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> killing_parent
  (** Input JSON data of type {!type:killing_parent}. *)

val killing_parent_of_string :
  string -> killing_parent
  (** Deserialize JSON data of type {!type:killing_parent}. *)

val write_unexpected_no_match_diagnosis_kind :
  Buffer.t -> unexpected_no_match_diagnosis_kind -> unit
  (** Output a JSON value of type {!type:unexpected_no_match_diagnosis_kind}. *)

val string_of_unexpected_no_match_diagnosis_kind :
  ?len:int -> unexpected_no_match_diagnosis_kind -> string
  (** Serialize a value of type {!type:unexpected_no_match_diagnosis_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unexpected_no_match_diagnosis_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unexpected_no_match_diagnosis_kind
  (** Input JSON data of type {!type:unexpected_no_match_diagnosis_kind}. *)

val unexpected_no_match_diagnosis_kind_of_string :
  string -> unexpected_no_match_diagnosis_kind
  (** Deserialize JSON data of type {!type:unexpected_no_match_diagnosis_kind}. *)

val write_unexpected_no_match_diagnosis :
  Buffer.t -> unexpected_no_match_diagnosis -> unit
  (** Output a JSON value of type {!type:unexpected_no_match_diagnosis}. *)

val string_of_unexpected_no_match_diagnosis :
  ?len:int -> unexpected_no_match_diagnosis -> string
  (** Serialize a value of type {!type:unexpected_no_match_diagnosis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unexpected_no_match_diagnosis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unexpected_no_match_diagnosis
  (** Input JSON data of type {!type:unexpected_no_match_diagnosis}. *)

val unexpected_no_match_diagnosis_of_string :
  string -> unexpected_no_match_diagnosis
  (** Deserialize JSON data of type {!type:unexpected_no_match_diagnosis}. *)

val write_originating_node_kind :
  Buffer.t -> originating_node_kind -> unit
  (** Output a JSON value of type {!type:originating_node_kind}. *)

val string_of_originating_node_kind :
  ?len:int -> originating_node_kind -> string
  (** Serialize a value of type {!type:originating_node_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_originating_node_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> originating_node_kind
  (** Input JSON data of type {!type:originating_node_kind}. *)

val originating_node_kind_of_string :
  string -> originating_node_kind
  (** Deserialize JSON data of type {!type:originating_node_kind}. *)

val write_unexpected_match_diagnosis :
  Buffer.t -> unexpected_match_diagnosis -> unit
  (** Output a JSON value of type {!type:unexpected_match_diagnosis}. *)

val string_of_unexpected_match_diagnosis :
  ?len:int -> unexpected_match_diagnosis -> string
  (** Serialize a value of type {!type:unexpected_match_diagnosis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unexpected_match_diagnosis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unexpected_match_diagnosis
  (** Input JSON data of type {!type:unexpected_match_diagnosis}. *)

val unexpected_match_diagnosis_of_string :
  string -> unexpected_match_diagnosis
  (** Deserialize JSON data of type {!type:unexpected_match_diagnosis}. *)

val write_triage_ignored :
  Buffer.t -> triage_ignored -> unit
  (** Output a JSON value of type {!type:triage_ignored}. *)

val string_of_triage_ignored :
  ?len:int -> triage_ignored -> string
  (** Serialize a value of type {!type:triage_ignored}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_triage_ignored :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> triage_ignored
  (** Input JSON data of type {!type:triage_ignored}. *)

val triage_ignored_of_string :
  string -> triage_ignored
  (** Deserialize JSON data of type {!type:triage_ignored}. *)

val write_transitive_finding :
  Buffer.t -> transitive_finding -> unit
  (** Output a JSON value of type {!type:transitive_finding}. *)

val string_of_transitive_finding :
  ?len:int -> transitive_finding -> string
  (** Serialize a value of type {!type:transitive_finding}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transitive_finding :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transitive_finding
  (** Input JSON data of type {!type:transitive_finding}. *)

val transitive_finding_of_string :
  string -> transitive_finding
  (** Deserialize JSON data of type {!type:transitive_finding}. *)

val write_todo :
  Buffer.t -> todo -> unit
  (** Output a JSON value of type {!type:todo}. *)

val string_of_todo :
  ?len:int -> todo -> string
  (** Serialize a value of type {!type:todo}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_todo :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> todo
  (** Input JSON data of type {!type:todo}. *)

val todo_of_string :
  string -> todo
  (** Deserialize JSON data of type {!type:todo}. *)

val write_matching_diagnosis :
  Buffer.t -> matching_diagnosis -> unit
  (** Output a JSON value of type {!type:matching_diagnosis}. *)

val string_of_matching_diagnosis :
  ?len:int -> matching_diagnosis -> string
  (** Serialize a value of type {!type:matching_diagnosis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_matching_diagnosis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> matching_diagnosis
  (** Input JSON data of type {!type:matching_diagnosis}. *)

val matching_diagnosis_of_string :
  string -> matching_diagnosis
  (** Deserialize JSON data of type {!type:matching_diagnosis}. *)

val write_expected_reported :
  Buffer.t -> expected_reported -> unit
  (** Output a JSON value of type {!type:expected_reported}. *)

val string_of_expected_reported :
  ?len:int -> expected_reported -> string
  (** Serialize a value of type {!type:expected_reported}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_expected_reported :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> expected_reported
  (** Input JSON data of type {!type:expected_reported}. *)

val expected_reported_of_string :
  string -> expected_reported
  (** Deserialize JSON data of type {!type:expected_reported}. *)

val write_rule_result :
  Buffer.t -> rule_result -> unit
  (** Output a JSON value of type {!type:rule_result}. *)

val string_of_rule_result :
  ?len:int -> rule_result -> string
  (** Serialize a value of type {!type:rule_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rule_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rule_result
  (** Input JSON data of type {!type:rule_result}. *)

val rule_result_of_string :
  string -> rule_result
  (** Deserialize JSON data of type {!type:rule_result}. *)

val write_fixtest_result :
  Buffer.t -> fixtest_result -> unit
  (** Output a JSON value of type {!type:fixtest_result}. *)

val string_of_fixtest_result :
  ?len:int -> fixtest_result -> string
  (** Serialize a value of type {!type:fixtest_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_fixtest_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> fixtest_result
  (** Input JSON data of type {!type:fixtest_result}. *)

val fixtest_result_of_string :
  string -> fixtest_result
  (** Deserialize JSON data of type {!type:fixtest_result}. *)

val write_config_error_reason :
  Buffer.t -> config_error_reason -> unit
  (** Output a JSON value of type {!type:config_error_reason}. *)

val string_of_config_error_reason :
  ?len:int -> config_error_reason -> string
  (** Serialize a value of type {!type:config_error_reason}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_config_error_reason :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> config_error_reason
  (** Input JSON data of type {!type:config_error_reason}. *)

val config_error_reason_of_string :
  string -> config_error_reason
  (** Deserialize JSON data of type {!type:config_error_reason}. *)

val write_config_error :
  Buffer.t -> config_error -> unit
  (** Output a JSON value of type {!type:config_error}. *)

val string_of_config_error :
  ?len:int -> config_error -> string
  (** Serialize a value of type {!type:config_error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_config_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> config_error
  (** Input JSON data of type {!type:config_error}. *)

val config_error_of_string :
  string -> config_error
  (** Deserialize JSON data of type {!type:config_error}. *)

val write_checks :
  Buffer.t -> checks -> unit
  (** Output a JSON value of type {!type:checks}. *)

val string_of_checks :
  ?len:int -> checks -> string
  (** Serialize a value of type {!type:checks}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_checks :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> checks
  (** Input JSON data of type {!type:checks}. *)

val checks_of_string :
  string -> checks
  (** Deserialize JSON data of type {!type:checks}. *)

val write_tests_result :
  Buffer.t -> tests_result -> unit
  (** Output a JSON value of type {!type:tests_result}. *)

val string_of_tests_result :
  ?len:int -> tests_result -> string
  (** Serialize a value of type {!type:tests_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tests_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tests_result
  (** Input JSON data of type {!type:tests_result}. *)

val tests_result_of_string :
  string -> tests_result
  (** Deserialize JSON data of type {!type:tests_result}. *)

val write_project_root :
  Buffer.t -> project_root -> unit
  (** Output a JSON value of type {!type:project_root}. *)

val string_of_project_root :
  ?len:int -> project_root -> string
  (** Serialize a value of type {!type:project_root}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_project_root :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> project_root
  (** Input JSON data of type {!type:project_root}. *)

val project_root_of_string :
  string -> project_root
  (** Deserialize JSON data of type {!type:project_root}. *)

val write_targeting_conf :
  Buffer.t -> targeting_conf -> unit
  (** Output a JSON value of type {!type:targeting_conf}. *)

val string_of_targeting_conf :
  ?len:int -> targeting_conf -> string
  (** Serialize a value of type {!type:targeting_conf}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_targeting_conf :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> targeting_conf
  (** Input JSON data of type {!type:targeting_conf}. *)

val targeting_conf_of_string :
  string -> targeting_conf
  (** Deserialize JSON data of type {!type:targeting_conf}. *)

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

val write_analyzer :
  Buffer.t -> analyzer -> unit
  (** Output a JSON value of type {!type:analyzer}. *)

val string_of_analyzer :
  ?len:int -> analyzer -> string
  (** Serialize a value of type {!type:analyzer}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_analyzer :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> analyzer
  (** Input JSON data of type {!type:analyzer}. *)

val analyzer_of_string :
  string -> analyzer
  (** Deserialize JSON data of type {!type:analyzer}. *)

val write_code_target :
  Buffer.t -> code_target -> unit
  (** Output a JSON value of type {!type:code_target}. *)

val string_of_code_target :
  ?len:int -> code_target -> string
  (** Serialize a value of type {!type:code_target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_code_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> code_target
  (** Input JSON data of type {!type:code_target}. *)

val code_target_of_string :
  string -> code_target
  (** Deserialize JSON data of type {!type:code_target}. *)

val write_target :
  Buffer.t -> target -> unit
  (** Output a JSON value of type {!type:target}. *)

val string_of_target :
  ?len:int -> target -> string
  (** Serialize a value of type {!type:target}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_target :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> target
  (** Input JSON data of type {!type:target}. *)

val target_of_string :
  string -> target
  (** Deserialize JSON data of type {!type:target}. *)

val write_scanning_roots :
  Buffer.t -> scanning_roots -> unit
  (** Output a JSON value of type {!type:scanning_roots}. *)

val string_of_scanning_roots :
  ?len:int -> scanning_roots -> string
  (** Serialize a value of type {!type:scanning_roots}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_scanning_roots :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> scanning_roots
  (** Input JSON data of type {!type:scanning_roots}. *)

val scanning_roots_of_string :
  string -> scanning_roots
  (** Deserialize JSON data of type {!type:scanning_roots}. *)

val write_targets :
  Buffer.t -> targets -> unit
  (** Output a JSON value of type {!type:targets}. *)

val string_of_targets :
  ?len:int -> targets -> string
  (** Serialize a value of type {!type:targets}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_targets :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> targets
  (** Input JSON data of type {!type:targets}. *)

val targets_of_string :
  string -> targets
  (** Deserialize JSON data of type {!type:targets}. *)

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

val write_target_discovery_result :
  Buffer.t -> target_discovery_result -> unit
  (** Output a JSON value of type {!type:target_discovery_result}. *)

val string_of_target_discovery_result :
  ?len:int -> target_discovery_result -> string
  (** Serialize a value of type {!type:target_discovery_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_target_discovery_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> target_discovery_result
  (** Input JSON data of type {!type:target_discovery_result}. *)

val target_discovery_result_of_string :
  string -> target_discovery_result
  (** Deserialize JSON data of type {!type:target_discovery_result}. *)

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

val write_symbol :
  Buffer.t -> symbol -> unit
  (** Output a JSON value of type {!type:symbol}. *)

val string_of_symbol :
  ?len:int -> symbol -> string
  (** Serialize a value of type {!type:symbol}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_symbol :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> symbol
  (** Input JSON data of type {!type:symbol}. *)

val symbol_of_string :
  string -> symbol
  (** Deserialize JSON data of type {!type:symbol}. *)

val write_symbol_usage :
  Buffer.t -> symbol_usage -> unit
  (** Output a JSON value of type {!type:symbol_usage}. *)

val string_of_symbol_usage :
  ?len:int -> symbol_usage -> string
  (** Serialize a value of type {!type:symbol_usage}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_symbol_usage :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> symbol_usage
  (** Input JSON data of type {!type:symbol_usage}. *)

val symbol_usage_of_string :
  string -> symbol_usage
  (** Deserialize JSON data of type {!type:symbol_usage}. *)

val write_symbol_analysis :
  Buffer.t -> symbol_analysis -> unit
  (** Output a JSON value of type {!type:symbol_analysis}. *)

val string_of_symbol_analysis :
  ?len:int -> symbol_analysis -> string
  (** Serialize a value of type {!type:symbol_analysis}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_symbol_analysis :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> symbol_analysis
  (** Input JSON data of type {!type:symbol_analysis}. *)

val symbol_analysis_of_string :
  string -> symbol_analysis
  (** Deserialize JSON data of type {!type:symbol_analysis}. *)

val write_resolution_method :
  Buffer.t -> resolution_method -> unit
  (** Output a JSON value of type {!type:resolution_method}. *)

val string_of_resolution_method :
  ?len:int -> resolution_method -> string
  (** Serialize a value of type {!type:resolution_method}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolution_method :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolution_method
  (** Input JSON data of type {!type:resolution_method}. *)

val resolution_method_of_string :
  string -> resolution_method
  (** Deserialize JSON data of type {!type:resolution_method}. *)

val write_dependency_source_file_kind :
  Buffer.t -> dependency_source_file_kind -> unit
  (** Output a JSON value of type {!type:dependency_source_file_kind}. *)

val string_of_dependency_source_file_kind :
  ?len:int -> dependency_source_file_kind -> string
  (** Serialize a value of type {!type:dependency_source_file_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_source_file_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_source_file_kind
  (** Input JSON data of type {!type:dependency_source_file_kind}. *)

val dependency_source_file_kind_of_string :
  string -> dependency_source_file_kind
  (** Deserialize JSON data of type {!type:dependency_source_file_kind}. *)

val write_dependency_source_file :
  Buffer.t -> dependency_source_file -> unit
  (** Output a JSON value of type {!type:dependency_source_file}. *)

val string_of_dependency_source_file :
  ?len:int -> dependency_source_file -> string
  (** Serialize a value of type {!type:dependency_source_file}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_source_file :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_source_file
  (** Input JSON data of type {!type:dependency_source_file}. *)

val dependency_source_file_of_string :
  string -> dependency_source_file
  (** Deserialize JSON data of type {!type:dependency_source_file}. *)

val write_dependency_resolution_stats :
  Buffer.t -> dependency_resolution_stats -> unit
  (** Output a JSON value of type {!type:dependency_resolution_stats}. *)

val string_of_dependency_resolution_stats :
  ?len:int -> dependency_resolution_stats -> string
  (** Serialize a value of type {!type:dependency_resolution_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dependency_resolution_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dependency_resolution_stats
  (** Input JSON data of type {!type:dependency_resolution_stats}. *)

val dependency_resolution_stats_of_string :
  string -> dependency_resolution_stats
  (** Deserialize JSON data of type {!type:dependency_resolution_stats}. *)

val write_subproject_stats :
  Buffer.t -> subproject_stats -> unit
  (** Output a JSON value of type {!type:subproject_stats}. *)

val string_of_subproject_stats :
  ?len:int -> subproject_stats -> string
  (** Serialize a value of type {!type:subproject_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_subproject_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> subproject_stats
  (** Input JSON data of type {!type:subproject_stats}. *)

val subproject_stats_of_string :
  string -> subproject_stats
  (** Deserialize JSON data of type {!type:subproject_stats}. *)

val write_supply_chain_stats :
  Buffer.t -> supply_chain_stats -> unit
  (** Output a JSON value of type {!type:supply_chain_stats}. *)

val string_of_supply_chain_stats :
  ?len:int -> supply_chain_stats -> string
  (** Serialize a value of type {!type:supply_chain_stats}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_supply_chain_stats :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> supply_chain_stats
  (** Input JSON data of type {!type:supply_chain_stats}. *)

val supply_chain_stats_of_string :
  string -> supply_chain_stats
  (** Deserialize JSON data of type {!type:supply_chain_stats}. *)

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

val write_glob :
  Buffer.t -> glob -> unit
  (** Output a JSON value of type {!type:glob}. *)

val string_of_glob :
  ?len:int -> glob -> string
  (** Serialize a value of type {!type:glob}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_glob :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> glob
  (** Input JSON data of type {!type:glob}. *)

val glob_of_string :
  string -> glob
  (** Deserialize JSON data of type {!type:glob}. *)

val write_product_ignored_files :
  Buffer.t -> product_ignored_files -> unit
  (** Output a JSON value of type {!type:product_ignored_files}. *)

val string_of_product_ignored_files :
  ?len:int -> product_ignored_files -> string
  (** Serialize a value of type {!type:product_ignored_files}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_product_ignored_files :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> product_ignored_files
  (** Input JSON data of type {!type:product_ignored_files}. *)

val product_ignored_files_of_string :
  string -> product_ignored_files
  (** Deserialize JSON data of type {!type:product_ignored_files}. *)

val write_historical_configuration :
  Buffer.t -> historical_configuration -> unit
  (** Output a JSON value of type {!type:historical_configuration}. *)

val string_of_historical_configuration :
  ?len:int -> historical_configuration -> string
  (** Serialize a value of type {!type:historical_configuration}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_historical_configuration :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> historical_configuration
  (** Input JSON data of type {!type:historical_configuration}. *)

val historical_configuration_of_string :
  string -> historical_configuration
  (** Deserialize JSON data of type {!type:historical_configuration}. *)

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

val write_action :
  Buffer.t -> action -> unit
  (** Output a JSON value of type {!type:action}. *)

val string_of_action :
  ?len:int -> action -> string
  (** Serialize a value of type {!type:action}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_action :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> action
  (** Input JSON data of type {!type:action}. *)

val action_of_string :
  string -> action
  (** Deserialize JSON data of type {!type:action}. *)

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

val write_sarif_format :
  Buffer.t -> sarif_format -> unit
  (** Output a JSON value of type {!type:sarif_format}. *)

val string_of_sarif_format :
  ?len:int -> sarif_format -> string
  (** Serialize a value of type {!type:sarif_format}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sarif_format :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sarif_format
  (** Input JSON data of type {!type:sarif_format}. *)

val sarif_format_of_string :
  string -> sarif_format
  (** Deserialize JSON data of type {!type:sarif_format}. *)

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

val write_downloaded_dependency :
  Buffer.t -> downloaded_dependency -> unit
  (** Output a JSON value of type {!type:downloaded_dependency}. *)

val string_of_downloaded_dependency :
  ?len:int -> downloaded_dependency -> string
  (** Serialize a value of type {!type:downloaded_dependency}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_downloaded_dependency :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> downloaded_dependency
  (** Input JSON data of type {!type:downloaded_dependency}. *)

val downloaded_dependency_of_string :
  string -> downloaded_dependency
  (** Deserialize JSON data of type {!type:downloaded_dependency}. *)

val write_resolved_dependency :
  Buffer.t -> resolved_dependency -> unit
  (** Output a JSON value of type {!type:resolved_dependency}. *)

val string_of_resolved_dependency :
  ?len:int -> resolved_dependency -> string
  (** Serialize a value of type {!type:resolved_dependency}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolved_dependency :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolved_dependency
  (** Input JSON data of type {!type:resolved_dependency}. *)

val resolved_dependency_of_string :
  string -> resolved_dependency
  (** Deserialize JSON data of type {!type:resolved_dependency}. *)

val write_resolved_subproject :
  Buffer.t -> resolved_subproject -> unit
  (** Output a JSON value of type {!type:resolved_subproject}. *)

val string_of_resolved_subproject :
  ?len:int -> resolved_subproject -> string
  (** Serialize a value of type {!type:resolved_subproject}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolved_subproject :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolved_subproject
  (** Input JSON data of type {!type:resolved_subproject}. *)

val resolved_subproject_of_string :
  string -> resolved_subproject
  (** Deserialize JSON data of type {!type:resolved_subproject}. *)

val write_resolution_result :
  Buffer.t -> resolution_result -> unit
  (** Output a JSON value of type {!type:resolution_result}. *)

val string_of_resolution_result :
  ?len:int -> resolution_result -> string
  (** Serialize a value of type {!type:resolution_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolution_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolution_result
  (** Input JSON data of type {!type:resolution_result}. *)

val resolution_result_of_string :
  string -> resolution_result
  (** Deserialize JSON data of type {!type:resolution_result}. *)

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

val write_partial_scan_result :
  Buffer.t -> partial_scan_result -> unit
  (** Output a JSON value of type {!type:partial_scan_result}. *)

val string_of_partial_scan_result :
  ?len:int -> partial_scan_result -> string
  (** Serialize a value of type {!type:partial_scan_result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_partial_scan_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> partial_scan_result
  (** Input JSON data of type {!type:partial_scan_result}. *)

val partial_scan_result_of_string :
  string -> partial_scan_result
  (** Deserialize JSON data of type {!type:partial_scan_result}. *)

val write_output_format :
  Buffer.t -> output_format -> unit
  (** Output a JSON value of type {!type:output_format}. *)

val string_of_output_format :
  ?len:int -> output_format -> string
  (** Serialize a value of type {!type:output_format}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_output_format :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> output_format
  (** Input JSON data of type {!type:output_format}. *)

val output_format_of_string :
  string -> output_format
  (** Deserialize JSON data of type {!type:output_format}. *)

val write_match_based_id :
  Buffer.t -> match_based_id -> unit
  (** Output a JSON value of type {!type:match_based_id}. *)

val string_of_match_based_id :
  ?len:int -> match_based_id -> string
  (** Serialize a value of type {!type:match_based_id}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_match_based_id :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> match_based_id
  (** Input JSON data of type {!type:match_based_id}. *)

val match_based_id_of_string :
  string -> match_based_id
  (** Deserialize JSON data of type {!type:match_based_id}. *)

val write_has_features :
  Buffer.t -> has_features -> unit
  (** Output a JSON value of type {!type:has_features}. *)

val string_of_has_features :
  ?len:int -> has_features -> string
  (** Serialize a value of type {!type:has_features}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_has_features :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> has_features
  (** Input JSON data of type {!type:has_features}. *)

val has_features_of_string :
  string -> has_features
  (** Deserialize JSON data of type {!type:has_features}. *)

val write_apply_fixes_return :
  Buffer.t -> apply_fixes_return -> unit
  (** Output a JSON value of type {!type:apply_fixes_return}. *)

val string_of_apply_fixes_return :
  ?len:int -> apply_fixes_return -> string
  (** Serialize a value of type {!type:apply_fixes_return}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_apply_fixes_return :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> apply_fixes_return
  (** Input JSON data of type {!type:apply_fixes_return}. *)

val apply_fixes_return_of_string :
  string -> apply_fixes_return
  (** Deserialize JSON data of type {!type:apply_fixes_return}. *)

val write_function_return :
  Buffer.t -> function_return -> unit
  (** Output a JSON value of type {!type:function_return}. *)

val string_of_function_return :
  ?len:int -> function_return -> string
  (** Serialize a value of type {!type:function_return}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_function_return :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> function_return
  (** Input JSON data of type {!type:function_return}. *)

val function_return_of_string :
  string -> function_return
  (** Deserialize JSON data of type {!type:function_return}. *)

val write_format_context :
  Buffer.t -> format_context -> unit
  (** Output a JSON value of type {!type:format_context}. *)

val string_of_format_context :
  ?len:int -> format_context -> string
  (** Serialize a value of type {!type:format_context}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_format_context :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> format_context
  (** Input JSON data of type {!type:format_context}. *)

val format_context_of_string :
  string -> format_context
  (** Deserialize JSON data of type {!type:format_context}. *)

val write_edit :
  Buffer.t -> edit -> unit
  (** Output a JSON value of type {!type:edit}. *)

val string_of_edit :
  ?len:int -> edit -> string
  (** Serialize a value of type {!type:edit}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_edit :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> edit
  (** Input JSON data of type {!type:edit}. *)

val edit_of_string :
  string -> edit
  (** Deserialize JSON data of type {!type:edit}. *)

val write_dump_rule_partitions_params :
  Buffer.t -> dump_rule_partitions_params -> unit
  (** Output a JSON value of type {!type:dump_rule_partitions_params}. *)

val string_of_dump_rule_partitions_params :
  ?len:int -> dump_rule_partitions_params -> string
  (** Serialize a value of type {!type:dump_rule_partitions_params}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dump_rule_partitions_params :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dump_rule_partitions_params
  (** Input JSON data of type {!type:dump_rule_partitions_params}. *)

val dump_rule_partitions_params_of_string :
  string -> dump_rule_partitions_params
  (** Deserialize JSON data of type {!type:dump_rule_partitions_params}. *)

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

val write_apply_fixes_params :
  Buffer.t -> apply_fixes_params -> unit
  (** Output a JSON value of type {!type:apply_fixes_params}. *)

val string_of_apply_fixes_params :
  ?len:int -> apply_fixes_params -> string
  (** Serialize a value of type {!type:apply_fixes_params}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_apply_fixes_params :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> apply_fixes_params
  (** Input JSON data of type {!type:apply_fixes_params}. *)

val apply_fixes_params_of_string :
  string -> apply_fixes_params
  (** Deserialize JSON data of type {!type:apply_fixes_params}. *)

val write_function_call :
  Buffer.t -> function_call -> unit
  (** Output a JSON value of type {!type:function_call}. *)

val string_of_function_call :
  ?len:int -> function_call -> string
  (** Serialize a value of type {!type:function_call}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_function_call :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> function_call
  (** Input JSON data of type {!type:function_call}. *)

val function_call_of_string :
  string -> function_call
  (** Deserialize JSON data of type {!type:function_call}. *)

val write_features :
  Buffer.t -> features -> unit
  (** Output a JSON value of type {!type:features}. *)

val string_of_features :
  ?len:int -> features -> string
  (** Serialize a value of type {!type:features}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_features :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> features
  (** Input JSON data of type {!type:features}. *)

val features_of_string :
  string -> features
  (** Deserialize JSON data of type {!type:features}. *)

val write_diff_file :
  Buffer.t -> diff_file -> unit
  (** Output a JSON value of type {!type:diff_file}. *)

val string_of_diff_file :
  ?len:int -> diff_file -> string
  (** Serialize a value of type {!type:diff_file}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_diff_file :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> diff_file
  (** Input JSON data of type {!type:diff_file}. *)

val diff_file_of_string :
  string -> diff_file
  (** Deserialize JSON data of type {!type:diff_file}. *)

val write_diff_files :
  Buffer.t -> diff_files -> unit
  (** Output a JSON value of type {!type:diff_files}. *)

val string_of_diff_files :
  ?len:int -> diff_files -> string
  (** Serialize a value of type {!type:diff_files}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_diff_files :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> diff_files
  (** Input JSON data of type {!type:diff_files}. *)

val diff_files_of_string :
  string -> diff_files
  (** Deserialize JSON data of type {!type:diff_files}. *)

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

val write_core_output_extra :
  Buffer.t -> core_output_extra -> unit
  (** Output a JSON value of type {!type:core_output_extra}. *)

val string_of_core_output_extra :
  ?len:int -> core_output_extra -> string
  (** Serialize a value of type {!type:core_output_extra}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_core_output_extra :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> core_output_extra
  (** Input JSON data of type {!type:core_output_extra}. *)

val core_output_extra_of_string :
  string -> core_output_extra
  (** Deserialize JSON data of type {!type:core_output_extra}. *)

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

