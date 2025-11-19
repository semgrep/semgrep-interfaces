(* Auto-generated from "semgrep_output_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

(** RFC 3339 format *)
type datetime = ATD_string_wrap.Datetime.t
  [@@deriving ord]

type dependency_child = { package: string; version: string } [@@deriving ord]

(** *)
type dependency_kind = 
    Direct
      (**
        we depend directly on the 3rd-party library mentioned in the lockfile
        (e.g., use of log4j library and concrete calls to log4j in 1st-party
        code). log4j must be declared as a direct dependency in the manifest
        file.
      *)
  | Transitive
      (**
        we depend indirectly (transitively) on the 3rd-party library (e.g.,
        if we use lodash which itself uses internally log4j then lodash is a
        Direct dependency and log4j a Transitive one)
        
        alt: Indirect
      *)
  | Unknown
      (**
        If there is insufficient information to determine the transitivity,
        such as a requirements.txt file without a requirements.in manifest,
        we leave it Unknown.
      *)

  [@@deriving ord, eq, show]

(**
  both ecosystem and transitivity below have frozen=True so the generated
  classes can be hashed and put in sets (see calls to reachable_deps.add() in
  semgrep SCA code)
  
  alt: type package_manager
*)
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
  | Mix
      (**
        Deprecated: Mix is a build system, should use Hex, which is the
        ecosystem
      *)
  | Hex
  | Opam

  [@@deriving eq, ord, show]

type fpath = ATD_string_wrap.Fpath.t [@@deriving eq, ord, show]

type found_dependency = {
  package: string;
  version: string;
  ecosystem: ecosystem;
  allowed_hashes: (string * string list) list (** ??? *);
  resolved_url: string option;
  transitivity: dependency_kind;
  manifest_path: fpath option
    (**
      Path to the manifest file that defines the project containing this
      dependency. Examples: package.json, nested/folder/pom.xml
    *);
  lockfile_path: fpath option
    (**
      Path to the lockfile that contains this dependency. Examples:
      package-lock.json, nested/folder/requirements.txt, go.mod. Since 1.87.0
    *);
  line_number: int option
    (**
      The line number of the dependency in the lockfile. When combined with
      the lockfile_path, this can identify the location of the dependency in
      the lockfile.
    *);
  children: dependency_child list option
    (**
      If we have dependency relationship information for this dependency,
      this field will include the name and version of other found_dependency
      items that this dependency requires. These fields must match values in
      `package` and `version` of another `found_dependency` in the same set
    *);
  git_ref: string option
    (**
      Git ref of the dependency if the dependency comes directly from a git
      repo. Examples: refs/heads/main, refs/tags/v1.0.0,
      e5c704df4d308690fed696faf4c86453b4d88a95. Since 1.66.0
    *)
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

(**
  Note that this type is used in Matching_explanation.ml hence the need for
  deriving show below.
*)
type matching_operation = 
    And
  | Or
  | Inside
  | Anywhere
  | XPat of string
      (**
        XPat for eXtended pattern. Can be a spacegrep pattern, a regexp
        pattern, or a proper semgrep pattern. see
        semgrep-core/src/core/XPattern.ml
      *)
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

(**
  The string attached to the location is the actual code from the file. This
  can contain sensitive information so be careful!
  
  TODO: the type seems redundant since location already specifies a range.
  maybe this saves some effort to the user of this type which do not need to
  read the file to get the content.
*)
type loc_and_content = (location * string)
  [@@deriving ord]

(**
  This type happens to be mostly the same as a loc_and_content for now, but
  it's split out because Iago has plans to extend this with more information
*)
type match_intermediate_var = {
  location: location;
  content: string
    (**
      Unlike abstract_content, this is the actual text read from the
      corresponding source file
    *)
}
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

(**
  Report the engine used to detect each finding. Additionally, if we are able
  to infer that the finding could only be detected using the pro engine,
  report that the pro engine is required and include basic information about
  which feature is required.
  
{v
   OSS = ran with OSS
   PRO = ran with PRO, but we didn't infer that OSS couldn't have found this
   finding
   PRO_REQUIRED = ran with PRO and requires a PRO feature (see pro_feature_used)
v}
  
  Note: OSS and PRO could have clearer names, but for backwards compatibility
  we're leaving them as is
*)
type engine_of_finding = [
    `OSS
  | `PRO
  | `PRO_REQUIRED of pro_feature (** Semgrep 1.64.0 or later *)
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

(** part of cli_match_extra *)
type historical_info = {
  git_commit: sha1
    (**
      Git commit at which the finding is present. Used by "historical" scans,
      which scan non-HEAD commits in the git history. Relevant for finding,
      e.g., secrets which are buried in the git history which we wouldn't
      find at HEAD
    *);
  git_blob: sha1 option
    (**
      Git blob at which the finding is present. Sent in addition to the
      commit since some SCMs have permalinks which use the blob sha, so this
      information is useful when generating links back to the SCM.
    *);
  git_commit_timestamp: datetime
}
  [@@deriving ord]

type svalue_value = {
  svalue_start: position option;
  svalue_end: position option;
  svalue_abstract_content: string (** value? *)
}
  [@@deriving ord]

type metavar_value = {
  start: position
    (**
      for certain metavariable like $...ARGS, 'end' may be equal to 'start'
      to represent an empty metavariable value. The rest of the Python code
      (message metavariable substitution and autofix) works without change
      for empty ranges (when end = start).
    *);
  end_ (*atd end *): position;
  abstract_content: string (** value? *);
  propagated_value: svalue_value option
}
  [@@deriving ord]

(**
  Name/value map of the matched metavariables. The leading '$' must be
  included in the metavariable name.
*)
type metavars = (string * metavar_value) list
  [@@deriving ord]

type transitive_undetermined = { explanation: string option }
  [@@deriving ord]

type transitive_unreachable = {
  analyzed_packages: found_dependency list
    (**
      We didn't find any findings in all the 3rd party libraries that are
      using the 3rd party vulnerable library. This is a "proof of work".
    *);
  explanation: string option
    (** some extra explanation that the user can understand *)
}
  [@@deriving ord]

(**
  This type is used by postprocessors for secrets to report back the validity
  of a finding. No_validator is currently also used when no validation has
  yet occurred, which if that becomes confusing we could adjust that, by
  adding another state.
*)
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
  intermediate_vars: match_intermediate_var list option
    (**
      Intermediate variables which are involved in the dataflow. This
      explains how the taint flows from the source to the sink.
    *);
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
  metavars: metavars option
    (**
      Since 1.98.0, you need to be logged in to get this field. note: we also
      need ?metavars because dependency_aware code
    *);
  message: string
    (**
      Those fields are derived from the rule but the metavariables they
      contain have been expanded to their concrete value.
    *);
  fix: string option
    (**
      If present, semgrep was able to compute a string that should be
      inserted in place of the text in the matched range in order to fix the
      finding. Note that this is the result of applying both the fix: or
      fix_regex: in a rule.
    *);
  fixed_lines: string list option;
  metadata: raw_json (** fields coming from the rule *);
  severity: match_severity;
  fingerprint: string
    (** Since 1.98.0, you need to be logged in to get those fields *);
  lines: string;
  is_ignored: bool option (** for nosemgrep *);
  sca_info: sca_match option
    (** EXPERIMENTAL: added by dependency_aware code *);
  validation_state: validation_state option
    (**
      EXPERIMENTAL: If present indicates the status of postprocessor
      validation. This field not being present should be equivalent to
      No_validator. Added in semgrep 1.37.0
    *);
  historical_info: historical_info option
    (**
      EXPERIMENTAL: added by secrets post-processing & historical scanning
      code Since 1.60.0.
    *);
  dataflow_trace: match_dataflow_trace option
    (**
      EXPERIMENTAL: For now, present only for taint findings. May be extended
      to others later on.
    *);
  engine_kind: engine_of_finding option;
  extra_extra: raw_json option
    (** EXPERIMENTAL: see core_match_extra.extra_extra *)
}

(** *)
and sca_match = {
  reachability_rule: bool
    (**
      does the rule has a pattern part; otherwise it's a "parity" or
      "upgrade-only" rule.
    *);
  sca_finding_schema: int;
  dependency_match: dependency_match;
  reachable: bool;
  kind: sca_match_kind option (** EXPERIMENTAL since 1.108.0 *)
}

(**
  Note that in addition to "reachable" there are also the notions of
  "vulnerable" and "exploitable".
*)
and sca_match_kind = 
    LockfileOnlyMatch of dependency_kind
      (**
        This is used for "parity" or "upgrade-only" rules. transitivity
        indicates whether the match is for a direct or transitive usage of
        the dependency; for a dependency that is both direct and transitive
        two findings should be generated.
      *)
  | DirectReachable
      (**
        found the pattern-part of the SCA rule in 1st-party code (reachable
        as originally defined by Semgrep Inc.) the match location will be in
        some target code.
      *)
  | TransitiveReachable of transitive_reachable
      (**
        found the pattern-part of the SCA rule in third-party code and
        ultimately found a path from 1st party code to this vulnerable
        third-party code. The goal of transitive reachability analysis is to
        change some Undetermined or (LockfileOnlyMatch Transitive) into
        TransitiveReachable or TransitiveUnreachable
      *)
  | TransitiveUnreachable of transitive_unreachable
      (**
        This is a "positive" finding in the sense that semgrep was able to
        prove that the transitive finding is "safe" and can be ignored
        because either there is no call to the pattern-part of the SCA rule
        in 3rd party code, or if there is it's in third-party code that is
        not accessed from the 1st-party code (e.g., via callgraph analysis)
        Note that there is no need for DirectUnreachable because semgrep
        would never generate such a finding. We have TransitiveUnreachable
        because semgrep first generates some Undetermined that we then retag
        as DirectUnreachable.
      *)
  | TransitiveUndetermined of transitive_undetermined
      (**
        could not decide because of the engine limitations (e.g., found the
        use of a vulnerable library in the lockfile but could not find the
        pattern in first party code and could not access third-party code for
        further investigation (similar to (LockfileOnlyMatch Transitive))
      *)

  [@@deriving ord]

and transitive_reachable = {
  matches: (found_dependency * cli_match list) list
    (**
      The matches we found in 3rd party libraries. Ideally the location in
      cli_match are relative to the root of the project so one can display
      matches as package\@/path/to/finding.py
    *);
  callgraph_reachable: bool option
    (**
      LATER: add callgraph information so one can see the path from 1st party
      code to the vulnerable intermediate 3rd party function. This is set to
      None for now.
    *);
  explanation: string option
    (** some extra explanation that the user can understand *)
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

(**
  For any "extra" information that we cannot fit at the node itself. This is
  useful for kind-specific information, which we cannot put in the operation
  itself without giving up our ability to derive `show` (needed for
  `matching_operation` below).
*)
type matching_explanation_extra = {
  before_negation_matches: core_match list option
    (**
      Only present in And kind. This information is useful for determining
      the input matches to the first Negation node.
    *);
  before_filter_matches: core_match list option
    (**
      Only present in nodes which have children Filter nodes. This
      information is useful for determining the input matches to the first
      Filter node, as there is otherwise no way of obtaining the
      post-intersection matches in an And node, for instance
    *)
}

(** EXPERIMENTAL *)
type matching_explanation = {
  op: matching_operation;
  children: matching_explanation list;
  matches: core_match list
    (** result matches at this node (can be empty when we reach a nomatch) *);
  loc: location
    (**
      location in the rule file! not target file. This tries to delimit the
      part of the rule relevant to the current operation (e.g., the position
      of the 'patterns:' token in the rule for the And operation).
    *);
  extra: matching_explanation_extra option (** NEW: since v1.79 *)
}

(**
  These ratios are numbers in \[0, 1\], and we would hope that both
  'time_ratio' and 'count_ratio' are very close to 0. In bad cases, we may
  see the 'count_ratio' being close to 0 while the 'time_ratio' is above 0.5,
  meaning that a small number of very slow files/etc represent a large amount
  of the total processing time. EXPERIMENTAL
*)
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

type product = [
    `SAST (** a.k.a. Code *)
  | `SCA (** a.k.a. SSC *)
  | `Secrets
]
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

(**
  A reason for skipping a target file or a pair (target, rule). Note that
  this type is also used in Report.ml hence the need for deriving show here.
  
  For consistency, please make sure all the JSON constructors use the same
  case rules (lowercase, underscores). This is hard to fix later! Please
  review your code carefully before committing to interface changes.
*)
type skip_reason = 
    Always_skipped
  | Semgrepignore_patterns_match
  | Cli_include_flags_do_not_match
  | Cli_exclude_flags_match
  | Exceeded_size_limit
  | Analysis_failed_parser_or_internal_error
  | Excluded_by_config
  | Wrong_language
  | Too_big
  | Minified
  | Binary
  | Irrelevant_rule
  | Too_many_matches
  | Gitignore_patterns_match
  | Dotfile
      (**
        since 1.40.0. They were always ignored, but not shown in the skip
        report
      *)
  | Nonexistent_file (** since 1.44.0 *)
  | Insufficient_permissions (** since 1.94.0 *)

  [@@deriving show]

(** coupling: ugly: with yield_json_objects() in target_manager.py *)
type skipped_target = {
  path: fpath;
  reason: skip_reason;
  details: string option
    (** since semgrep 1.39.0 (used to be return only by semgrep-core) *);
  rule_id: rule_id option
    (**
      If the 'rule_id' field is missing, the target is assumed to have been
      skipped for all the rules
    *)
}
  [@@deriving show]

type incompatible_rule = {
  rule_id: rule_id;
  this_version: version;
  min_version: version option;
  max_version: version option
}
  [@@deriving show]

type error_type = 
    LexicalError
      (**
        File parsing related errors; coupling: if you add a target parse
        error then metrics for cli need to be updated. See
        cli/src/semgrep/parsing_data.py.
      *)
  | ParseError (** a.k.a SyntaxError *)
  | OtherParseError
  | AstBuilderError
  | RuleParseError
      (**
        Pattern parsing related errors. There are more precise info about the
        error in Rule.invalid_rule_error_kind in Rule.ml.
      *)
  | SemgrepWarning (** generated in pysemgrep only *)
  | SemgrepError
  | InvalidRuleSchemaError
  | UnknownLanguageError
  | InvalidYaml
  | MatchingError (** internal error, e.g., NoTokenLocation *)
  | SemgrepMatchFound
  | TooManyMatches
  | FatalError (** missing file, OCaml errors, etc. *)
  | Timeout
  | OutOfMemory
  | FixpointTimeout (** since semgrep 1.132.0 *)
  | StackOverflow (** since semgrep 1.86.0 *)
  | TimeoutDuringInterfile
  | OutOfMemoryDuringInterfile
  | MissingPlugin (** since semgrep 1.40.0 *)
  | PatternParseError of string list
      (**
        the string list is the "YAML path" of the pattern, e.g. [\["rules";
        "1"; ...\]]
      *)
  | PartialParsing of location list
      (** list of skipped tokens. Since semgrep 0.97. *)
  | IncompatibleRule of incompatible_rule (** since semgrep 1.38.0 *)
  | PatternParseError0
      (**
        Those Xxx0 variants were introduced in semgrep 1.45.0, but actually
        they are here so that our backend can read the cli_error.type_ from
        old semgrep versions that were translating the PatternParseError _
        and IncompatibleRule _ above as a single string (instead of a list
        \["PatternParseError", ...\] now). There is no PartialParsing0
        because this was encoded as a ParseError instead.
      *)
  | IncompatibleRule0
  | DependencyResolutionError of resolution_error_kind
      (** since semgrep 1.94.0 *)

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

(**
  Result of get_targets internal RPC, similar to scanned_and_skipped but more
  complete
*)
type target_discovery_result = {
  target_paths: fppath list;
  errors: core_error list;
  skipped: skipped_target list
}

(** EXPERIMENTAL *)
type summary_stats = { mean: float; std_dev: float }

(** EXPERIMENTAL *)
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
  position: position (** position of the error in the rule file *)
}

(** EXPERIMENTAL *)
type file_time = { fpath: fpath; ftime: float }
  [@@deriving show]

(** Scanning time (includes matching and tainting) EXPERIMENTAL *)
type scanning_time = {
  total_time: float;
  per_file_time: summary_stats;
  very_slow_stats: very_slow_stats;
  very_slow_files: file_time list (** ascending order *)
}

type scanned_and_skipped = {
  scanned: fpath list;
  skipped: skipped_target list option
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

(** EXPERIMENTAL *)
type parsing_time = {
  total_time: float;
  per_file_time: summary_stats;
  very_slow_stats: very_slow_stats option;
  very_slow_files: file_time list (** ascending order *)
}

(** EXPERIMENTAL *)
type file_rule_time = { fpath: fpath; rule_id: rule_id; time: float }
  [@@deriving show]

(** *)
type matching_time = {
  total_time: float;
  per_file_and_rule_time: summary_stats;
  very_slow_stats: very_slow_stats;
  very_slow_rules_on_files: file_rule_time list (** *)
}

(** Run locally $ ./run-benchmarks --dummy --upload *)
type profile = {
  rules: rule_id list
    (**
      List of rules, including the one read but not run on any target. This
      list is actually more an array which allows other fields to reference
      rule by number instead of rule_id (e.g., match_times further below)
      saving space in the JSON.
      
      Upgrade note: this used to be defined as a rule_id_dict where each
      rule_id was inside a \{id: rule_id; ...\} record so we could give
      parsing time info about each rule, but parsing one rule was never the
      slow part, so now we just juse the aggregated rules_parse_time below
      and do not need a complex rule_id_dict record anymore.
    *);
  rules_parse_time: float;
  profiling_times: (string * float) list;
  parsing_time: parsing_time option (** EXPERIMENTAL *);
  scanning_time: scanning_time option (** EXPERIMENTAL *);
  matching_time: matching_time option (** EXPERIMENTAL *);
  tainting_time: tainting_time option (** EXPERIMENTAL *);
  fixpoint_timeouts: core_error list option
    (**
      EXPERIMENTAL: Dafatlow fixpoint-function timeouts
      
      Happen more often than we would like, and it's mainly Semgrep devs that
      will use this info for debugging, so for now we are reporting these
      timeouts as part of the profiling report.
    *);
  prefiltering: prefiltering_stats option;
  targets: target_times list;
  total_bytes: int;
  max_memory_bytes: int option
    (**
      maximum amount of memory used by Semgrep(-core) during its execution
    *)
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
  file: fpath (** for InvalidRuleSchemaError *);
  start: position;
  end_ (*atd end *): position;
  source_hash: string option;
  config_start: position option option
    (**
      The path to the pattern in the yaml rule and an adjusted start/end
      within just the pattern. Used to report playground parse errors in the
      simple editor
    *);
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

(** (called SemgrepError in error.py) *)
type cli_error = {
  code: int (** exit code for the type_ of error *);
  level: error_severity;
  type_: error_type
    (**
      before 1.45.0 the type below was 'string', but was the result of
      converting error_type into a string, so using directly 'error_type'
      below should be mostly backward compatible thx to the <json name>
      annotations in error_type. To be fully backward compatible, we actually
      introduced the PatternParseError0 and IncompatibleRule0 cases in
      error_type.
    *);
  rule_id: rule_id option;
  message: string option (** contains error location *);
  path: fpath option;
  long_msg: string option (** for invalid rules, for ErrorWithSpan *);
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

(** e.g. "ab023_1" *)
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
