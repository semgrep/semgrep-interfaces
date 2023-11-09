(* ATD adapter for rule_schema_v2.atd
 * See https://atd.readthedocs.io/en/latest/atdgen.html#field-adapter-ocaml
 *)

module Formula = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `String str ->
        `Assoc ["pattern", `String str]
    (* TODO: check at least one of any/all/... is specified *)
    | x -> x

  (** Convert from ATD-compatible json to original json *)
  let restore  (_atd : Yojson.Safe.t) : Yojson.Safe.t =
    (* not needed for now; we care just about parsing *)
    failwith "Rule_schema_v2_adapter.Formula.restore not implemented"
end

module Condition = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `Assoc (("comparison", cmp)::rest) ->
       `List [`String "C";
            `Assoc (("comparison", cmp)::rest)]
    | `Assoc (("metavariable", mvar)::rest) ->
       (* TODO: check at least one of type/types/... is specified *)
       `List [`String "M";
            `Assoc (("metavariable", mvar)::rest)]
    | `Assoc [("focus", `String x)] ->
       `List [`String "F";
            `Assoc [("focus", `List [`String x])]]
    | `Assoc [("focus", `List x)] ->
       `List [`String "F";
            `Assoc [("focus", `List x)]]
    | x -> x

  (** Convert from ATD-compatible json to original json *)
  let restore  (_atd : Yojson.Safe.t) : Yojson.Safe.t =
    (* not needed for now; we care just about parsing *)
    failwith "Rule_schema_v2_adapter.Condition.restore not implemented"
end

module BySideEffect = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `Bool true -> `String "true"
    | `Bool false -> `String "false"
    | x -> x

  (** Convert from ATD-compatible json to original json *)
  let restore  (_atd : Yojson.Safe.t) : Yojson.Safe.t =
    (* not needed for now; we care just about parsing *)
    failwith "Rule_schema_v2_adapter.BySideEffect.restore not implemented"
end
