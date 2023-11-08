(* ATD adapter for rule_schema_v2.atd
 * See https://atd.readthedocs.io/en/latest/atdgen.html#field-adapter-ocaml
 *)

module Formula = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `String str ->
        `Assoc ["f", `List [`String "pattern"; `String str]]
    | `Assoc [(key , elt)] ->
        `Assoc ["f", `List [`String key; elt]]
    | `Assoc [(key , elt); ("where", stuff)] ->
        `Assoc [
            ("f", `List [`String key; elt]);
            ("where", stuff)]
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
    | `Assoc [("metavariable", mvar); ("regex", reg)] ->
       `List [`String "M";
            `Assoc [("metavariable", mvar); 
              ("c", `List [`String "regex"; reg])]]
    | `Assoc [("metavariable", mvar); ("type", ty)] ->
       `List [`String "M";
            `Assoc [("metavariable", mvar); 
              ("c", `List [`String "type"; ty])]]
    | `Assoc [("metavariable", mvar); ("types", tys)] ->
       `List [`String "M";
            `Assoc [("metavariable", mvar); 
              ("c", `List [`String "types"; tys])]]
    | `Assoc [("metavariable", mvar); ("pattern", p)] ->
       `List [`String "M";
            `Assoc [("metavariable", mvar); 
              ("c", `List [`String "F"; `Assoc [("pattern", p)]])]]
    | x -> 
          x


  (** Convert from ATD-compatible json to original json *)
  let restore  (_atd : Yojson.Safe.t) : Yojson.Safe.t =
    (* not needed for now; we care just about parsing *)
    failwith "Rule_schema_v2_adapter.Condition.restore not implemented"
end
